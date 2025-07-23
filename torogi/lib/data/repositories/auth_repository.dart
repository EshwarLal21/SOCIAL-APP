import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:torogi/data/models/user_profile.dart';

class AuthRepository {
  final SupabaseClient supabaseClient = Supabase.instance.client;

  //Signup and create users
  Future<UserProfile> signUp(
      String email, String password, String username, String userType) async {
    try {
      // Check if email or username already exists
      final existingUsers = await supabaseClient
          .from('users')
          .select()
          .or('email.eq.$email,username.eq.$username')
          .limit(1);

      if (existingUsers.isNotEmpty) {
        final existing = existingUsers[0];
        if (existing['email'] == email) {
          throw Exception('Email already registered');
        }
        if (existing['username'] == username) {
          throw Exception('Username already taken');
        }
      }

      // Create auth user
      final response = await supabaseClient.auth.signUp(
        email: email,
        password: password,
      );

      final user = response.user;
      if (user == null) throw Exception('Signup failed');

      // Set userType — force 'admin' if email matches, else from parameter
      final assignedUserType =
      email.toLowerCase() == 'torogi.app@gmail.com' ? 'admin' : userType;

      // Create user profile
      final userProfile = UserProfile(
        id: user.id,
        email: email,
        username: username,
        createdat: DateTime.now(),
        userType: assignedUserType,
        banner: 'guest',
      );

      // Insert into users table
      await supabaseClient.from('users').insert(userProfile.toJson());

      return userProfile;
    } on AuthException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }


  // Check if user is admin
  Future<bool> isAdmin(String email) async {
    try {
      // Simple check against a hardcoded admin email
      return email.toLowerCase() == 'torogi.app@gmail.com';
    } catch (e) {
      print('Error checking admin status: ${e.toString()}');
      return false;
    }
  }

  // Check admin credentials directly
  Future<bool> checkAdminCredentials(String email, String password) async {
    try {
      print('Checking admin credentials for: $email');
      // Simple check against hardcoded admin credentials
      return email.toLowerCase() == 'torogi.app@gmail.com' &&
          password == 'torogi123456';
    } catch (e) {
      print('Error checking admin credentials: ${e.toString()}');
      return false;
    }
  }

  //Login for all users
  Future<UserProfile> login(String email, String password) async {
    try {
      print('Attempting to login with email: $email');

      // First check if these are admin credentials
      final isAdmin = email.toLowerCase() == 'torogi.app@gmail.com' &&
          password == 'torogi123456';
      print('Admin check result: $isAdmin');

      if (isAdmin) {
        print('Admin user verified');
        return UserProfile(
          id: 'admin',
          email: email.toLowerCase(),
          username: 'admin',
          createdat: DateTime.now(),
          userType: 'admin',
          banner: 'admin',
        );
      }

      // If not admin, proceed with regular Supabase auth
      final response = await supabaseClient.auth.signInWithPassword(
        email: email.trim().toLowerCase(),
        password: password,
      );

      final user = response.user;
      if (user == null) throw Exception('Login Failed - No user returned');

      // Check if user exists in users table
      final existingUsers = await supabaseClient
          .from('users')
          .select()
          .eq('email', email.toLowerCase())
          .limit(1);

      // If user exists in users table
      if (existingUsers.isNotEmpty) {
        return UserProfile.fromJson(existingUsers[0]);
      }

      // If user doesn't exist in users table, create new profile
      final userProfile = UserProfile(
        id: user.id,
        email: email.toLowerCase(),
        username: email.split('@')[0],
        createdat: DateTime.now(),
        userType: 'guest',
        banner: 'guest',
      );

      // Insert into users table
      await supabaseClient.from('users').insert(userProfile.toJson());
      return userProfile;
    } on AuthException catch (e) {
      print('Auth Exception: ${e.message}');
      throw Exception('Login failed: ${e.message}');
    } catch (e) {
      print('General Exception: ${e.toString()}');
      throw Exception('Login failed: ${e.toString()}');
    }
  }
  Future<void> reportBlog({
    required String blogId,
    required String userId,
    required String reason,
  }) async {
    try {
      final supabase = Supabase.instance.client;
      print('AuthRepository: Submitting report for blog: $blogId by user: $userId');
      await supabase.from('blog_reports').insert({
        'blogid': blogId,
        'userid': userId,
        'reason': reason,
      });
      print('AuthRepository: Report submitted successfully');
    } catch (e, stackTrace) {
      print('AuthRepository: Error submitting report: $e, StackTrace: $stackTrace');
      throw Exception('Failed to submit report: $e');
    }
  }

  //Logout
  Future<void> logout() async {
    await supabaseClient.auth.signOut();
  }

  // Get current user profile
  Future<UserProfile?> getCurrentUserProfile() async {
    final user = supabaseClient.auth.currentUser;
    if (user == null) return null;

    final response = await supabaseClient.from('users').select().eq('id', user.id).single();
    return UserProfile.fromJson(response);
  }

  // Upgrade user type (e.g., guest → employer or service provider)
  Future<void> upgradeUserType(String userId, String newType) async {
    await supabaseClient.from('users').update({'userType': newType}).eq('id', userId);
  }

  /// Update profile picture
  Future<void> updateProfilePic(String userId, String imageUrl) async {
    await supabaseClient.from('users').update({'profilePic': imageUrl}).eq('id', userId);
  }

  // Delete user by email (admin only)
  Future<void> deleteUserByEmail(String email) async {
    try {
      final users = await supabaseClient
          .from('users')
          .select('id')
          .eq('email', email.toLowerCase());

      if (users.isNotEmpty) {
        final userId = users[0]['id'];
        // Delete from users table first
        await supabaseClient.from('users').delete().eq('id', userId);
        print('Deleted user from users table');
      }

      print('User cleanup completed');
    } catch (e) {
      print('Error during user deletion: ${e.toString()}');
      throw Exception('Failed to delete user: ${e.toString()}');
    }
  }

  // Helper method to ensure admin exists
  Future<void> ensureAdminExists() async {
    try {
      final email = 'torogi.app@gmail.com';
      final password = 'torogi123456';

      // Check if admin exists in auth
      final existingAuth = await supabaseClient.auth.signInWithPassword(
        email: email,
        password: password,
      ).catchError((e) => null);

      if (existingAuth?.user == null) {
        print('Admin auth user does not exist, creating...'); // Debug log
        // Create admin auth user
        final response = await supabaseClient.auth.signUp(
          email: email,
          password: password,
        );

        if (response.user == null) throw Exception('Failed to create admin user');

        // Create admin profile
        final userProfile = UserProfile(
          id: response.user!.id,
          email: email,
          username: 'admin',
          createdat: DateTime.now(),
          userType: 'admin',
          banner: 'admin',
        );

        // Insert into users table
        await supabaseClient.from('users').insert(userProfile.toJson());

        // Insert into admins table
        await supabaseClient.from('admins').insert({
          'email': email,
          'created_at': DateTime.now().toIso8601String(),
        });

        print('Admin user created successfully'); // Debug log
      } else {
        print('Admin auth user already exists'); // Debug log
      }
    } catch (e) {
      print('Error ensuring admin exists: ${e.toString()}');
    }
  }
}