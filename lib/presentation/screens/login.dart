import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:torogi/core/utils/snackbar_util.dart';
import 'package:torogi/features/auth/login/login_bloc.dart';
import 'package:torogi/features/auth/login/login_event.dart';
import 'package:torogi/features/auth/login/login_state.dart';
import 'package:torogi/presentation/widgets/custom_button.dart';
import 'package:torogi/presentation/widgets/custom_text_field.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'torogi',
                style: TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Welcome Back 👋',
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 32),

              // Card-style container
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: theme.colorScheme.surface,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: theme.shadowColor.withOpacity(0.1),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    CustomTextField(
                      controller: emailController,
                      hintText: 'Email',
                    ),
                    const SizedBox(height: 16),
                    CustomTextField(
                      controller: passwordController,
                      hintText: 'Password',
                      obscureText: true,
                    ),
                    const SizedBox(height: 24),

                    BlocConsumer<LoginBloc, LoginState>(
                      listener: (context, state) {
                        if (state is LoginFailure) {
                          showSnackBar(context, state.error);
                        } else if (state is LoginSuccess) {
                          if (state.isAdmin) {
                            showSnackBar(context, "Admin Login Successful");
                            context.go('/admin');
                          } else {
                            showSnackBar(context, "Login Successful");
                            context.go('/home');
                          }
                        }
                      },
                      builder: (context, state) {
                        if (state is LoginLoading) {
                          return const CircularProgressIndicator();
                        }
                        return CustomButton(
                          text: 'Sign In',
                          onPressed: () {
                            context.read<LoginBloc>().add(
                              LoginSubmitted(
                                emailController.text.trim(),
                                passwordController.text.trim(),
                              ),
                            );
                          },
                        );
                      },
                    ),

                    const SizedBox(height: 20),

                    // Social login
                    Row(
                      children: [
                        Expanded(child: Divider(color: theme.dividerColor)),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            'or continue with',
                            style: theme.textTheme.bodySmall,
                          ),
                        ),
                        Expanded(child: Divider(color: theme.dividerColor)),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Google button
                    // CustomButton.icon(
                    //   text: 'Sign in with Google',
                    //   icon: Icons.g_mobiledata_rounded,
                    //   onPressed: () async {
                    //     // your Google sign-in implementation here
                    //   },
                    // ),

                    const SizedBox(height: 12),

                    // Facebook button
                    // CustomButton.icon(
                    //   text: 'Sign in with Facebook',
                    //   icon: Icons.facebook,
                    //   backgroundColor: Colors.blue.shade800,
                    //   onPressed: () {
                    //     // your Facebook sign-in implementation here
                    //   },
                    // ),

                    const SizedBox(height: 24),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account? "),
                        GestureDetector(
                          onTap: () => context.go('/signup'),
                          child: Text(
                            'Register',
                            style: TextStyle(
                              color: theme.colorScheme.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
