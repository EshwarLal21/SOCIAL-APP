class UserProfile {
  final String id;
  final String email;
  final String username;
  final String? bio;
  final String? location;
  final String? profilePic;
  final String banner;
  String userType; // Remove final to allow updates
  final int following;
  final int followers;
  final DateTime createdat;

  UserProfile({
    required this.id,
    required this.email,
    required this.username,
    this.bio,
    this.location,
    this.profilePic,
    this.banner = 'guest', // Default value
    this.userType = 'guest', // Default value
    this.following = 0,
    this.followers = 0,
    required this.createdat,
  });

  /// Convert JSON from Supabase to UserProfile object
  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      id: json['id'],
      email: json['email'],
      username: json['username'],
      bio: json['bio'],
      location: json['location'],
      profilePic: json['profilepic'],
      banner: json['banner'] ?? 'guest',
      userType: json['usertype'] ?? 'guest',
      following: json['following'] ?? 0,
      followers: json['followers'] ?? 0,
      createdat: DateTime.parse(json['createdat']),
    );
  }

  /// Convert UserProfile object to JSON for Supabase
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'username': username,
      'bio': bio,
      'location': location,
      'profilepic': profilePic,
      'banner': banner,
      'usertype': userType,
      'following': following,
      'followers': followers,
      'createdat': createdat.toIso8601String(),
    };
  }

  /// Create a copy of UserProfile with optional field updates
  UserProfile copyWith({
    String? id,
    String? email,
    String? username,
    String? bio,
    String? location,
    String? profilePic,
    String? banner,
    String? userType,
    int? following,
    int? followers,
    DateTime? createdat,
  }) {
    return UserProfile(
      id: id ?? this.id,
      email: email ?? this.email,
      username: username ?? this.username,
      bio: bio ?? this.bio,
      location: location ?? this.location,
      profilePic: profilePic ?? this.profilePic,
      banner: banner ?? this.banner,
      userType: userType ?? this.userType,
      following: following ?? this.following,
      followers: followers ?? this.followers,
      createdat: createdat ?? this.createdat,
    );
  }
}
