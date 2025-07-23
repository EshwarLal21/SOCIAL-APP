import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:torogi/core/utils/snackbar_util.dart';
import 'package:torogi/data/repositories/auth_repository.dart';
import 'package:torogi/features/auth/login/login_bloc.dart';
import 'package:torogi/features/auth/login/login_event.dart';
import 'package:torogi/features/auth/login/login_state.dart';
import 'package:torogi/presentation/widgets/custom_button.dart';
import 'package:torogi/presentation/widgets/custom_text_field.dart';

import 'admin_dashboard.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();


  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocProvider(
      create: (_) => LoginBloc(AuthRepository()),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.02), // Responsive spacing
                AnimatedOpacity(
                  opacity: 1.0,
                  duration: const Duration(milliseconds: 500),
                  child: Center(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: MediaQuery.of(context).size.height * 0.15, // Max height
                        maxWidth: MediaQuery.of(context).size.width * 0.6,  // Max width
                      ),
                      child: Image.asset(
                        'assets/logo.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 12),



                // Card container
                Container(
                  padding: const EdgeInsets.all(22),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surface,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: theme.shadowColor.withOpacity(0.06),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: BlocConsumer<LoginBloc, LoginState>(
                    listener: (context, state) {
                      if (state is LoginFailure) {
                        showSnackBar(context, state.error);
                      } else if (state is LoginSuccess) {
                        if (state.isAdmin) {
                          showSnackBar(context, "Admin Login Successful");

                          // ✅ Use GoRouter-safe navigation
                          context.go('/admin');
                        } else {
                          showSnackBar(context, "Login Successful");
                          context.go('/home');
                        }
                      }
                    },


                    builder: (context, state) {
                      return Column(
                        children: [
                          CustomTextField(
                            controller: emailController,
                            hintText: 'Email',
                          ),
                          const SizedBox(height: 14),
                          CustomTextField(
                            controller: passwordController,
                            hintText: 'Password',
                            obscureText: true,
                          ),
                          const SizedBox(height: 10),

                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () => context.push('/forgot-password'),
                              child: Text(
                                'Forgot Password?',
                                style: TextStyle(
                                  color: theme.colorScheme.primary,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),

                          // Sign In button
                          state is LoginLoading
                              ? const CircularProgressIndicator()
                              : CustomButton(
                            text: 'Sign In',
                            backgroundColor: Colors.green,
                            onPressed: () {
                              final email = emailController.text.trim();
                              final password = passwordController.text.trim();

                              if (email.isEmpty || password.isEmpty) {
                                showSnackBar(context, 'Please fill in all fields.');
                                return;
                              }

                              context.read<LoginBloc>().add(
                                LoginSubmitted(email, password),
                              );
                            },
                          ),

                          const SizedBox(height: 18),

                          Row(
                            children: [
                              Expanded(child: Divider(color: theme.dividerColor)),
                              Padding(
                                padding:
                                const EdgeInsets.symmetric(horizontal: 8),
                                child: Text(
                                  'or continue with',
                                  style: theme.textTheme.bodySmall,
                                ),
                              ),
                              Expanded(child: Divider(color: theme.dividerColor)),
                            ],
                          ),
                          const SizedBox(height: 14),

                          ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.red.shade600,
                              minimumSize: const Size.fromHeight(48),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            icon:
                            const Icon(Icons.g_mobiledata_rounded, size: 26),
                            label: const Text('Sign in with Google'),
                            onPressed: () {
                              showSnackBar(
                                  context, 'Google sign-in not implemented.');
                            },
                          ),
                          const SizedBox(height: 10),

                          ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.blue.shade800,
                              minimumSize: const Size.fromHeight(48),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            icon: const Icon(Icons.facebook, size: 24),
                            label: const Text('Sign in with Facebook'),
                            onPressed: () {
                              showSnackBar(
                                  context, 'Facebook sign-in not implemented.');
                            },
                          ),
                          const SizedBox(height: 10),

                          TextButton(
                            onPressed: () => context.go('/home'),
                            child: Text(
                              'Continue as Guest',
                              style: TextStyle(
                                color: theme.colorScheme.primary,
                                fontWeight: FontWeight.w600,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                const SizedBox(height: 18),

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
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
