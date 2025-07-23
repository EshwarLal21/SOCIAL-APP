import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:torogi/core/utils/snackbar_util.dart';
import 'package:torogi/features/auth/signup/signup_bloc.dart';
import 'package:torogi/features/auth/signup/signup_event.dart';
import 'package:torogi/features/auth/signup/signup_state.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  String selectedUserType = 'employer';
  final List<String> userTypes = ['employer', 'serviceprovider'];

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 500), // For larger screens
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: width * 0.05),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: height * 0.05),
                    // Logo with animation
                    AnimatedOpacity(
                      opacity: 1.0,
                      duration: const Duration(milliseconds: 500),
                      child: Image.asset(
                        'assets/logo.png',
                        height: height * 0.1,
                        width: width * 0.5,
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(height: height * 0.03),
                    Text(
                      'Create Your Account',
                      style: theme.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.primary,
                      ),
                    ),
                    SizedBox(height: height * 0.02),
                    // Card container
                    Card(
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      margin: EdgeInsets.symmetric(vertical: height * 0.02),
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            CustomTextField(
                              controller: usernameController,
                              hintText: 'Username',
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'Username is required';
                                }
                                if (value.trim().length < 3) {
                                  return 'Username must be at least 3 characters';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: height * 0.02),
                            CustomTextField(
                              controller: emailController,
                              hintText: 'Email',
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'Email is required';
                                }
                                if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                    .hasMatch(value)) {
                                  return 'Enter a valid email';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: height * 0.02),
                            CustomTextField(
                              controller: passwordController,
                              hintText: 'Password',
                              obscureText: true,
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'Password is required';
                                }
                                if (value.trim().length < 6) {
                                  return 'Password must be at least 6 characters';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: height * 0.02),
                            CustomTextField(
                              controller: confirmPasswordController,
                              hintText: 'Confirm Password',
                              obscureText: true,
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'Please confirm your password';
                                }
                                if (value.trim() != passwordController.text.trim()) {
                                  return 'Passwords do not match';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: height * 0.02),
                            // User Type Dropdown
                            DropdownButtonFormField<String>(
                              value: selectedUserType,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 12,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(
                                    color: theme.colorScheme.primary,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(
                                    color: theme.colorScheme.primary.withOpacity(0.5),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(
                                    color: theme.colorScheme.primary,
                                    width: 2,
                                  ),
                                ),
                                labelText: 'User Type',
                                labelStyle: TextStyle(
                                  color: theme.colorScheme.onSurface.withOpacity(0.6),
                                ),
                              ),
                              items: userTypes
                                  .map((type) => DropdownMenuItem(
                                value: type,
                                child: Text(
                                  type[0].toUpperCase() + type.substring(1),
                                  style: theme.textTheme.bodyLarge,
                                ),
                              ))
                                  .toList(),
                              onChanged: (value) {
                                if (value != null) {
                                  setState(() {
                                    selectedUserType = value;
                                  });
                                }
                              },
                            ),
                            SizedBox(height: height * 0.03),
                            // Register button with loading state
                            BlocConsumer<SignupBloc, SignupState>(
                              listener: (context, state) {
                                if (state is SignupFailure) {
                                  showSnackBar(
                                    context,
                                    state.error,
                                    isError: true,
                                  );
                                } else if (state is SignupSuccess) {
                                  showSnackBar(
                                    context,
                                    'Registration Successful!',
                                    isError: false,
                                  );
                                  context.go('/login');
                                }
                              },
                              builder: (context, state) {
                                return AnimatedSwitcher(
                                  duration: const Duration(milliseconds: 300),
                                  child: state is SignupLoading
                                      ? Center(
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation(
                                        theme.colorScheme.primary,
                                      ),
                                    ),
                                  )
                                      : CustomButton(
                                    text: 'Register',
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        context.read<SignupBloc>().add(
                                          SignupSubmitted(
                                            emailController.text.trim(),
                                            passwordController.text.trim(),
                                            usernameController.text.trim(),
                                            selectedUserType,
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                );
                              },
                            ),
                            SizedBox(height: height * 0.02),
                            Divider(
                              color: theme.dividerColor.withOpacity(0.3),
                              thickness: 1,
                            ),
                            SizedBox(height: height * 0.015),
                            // Login redirect
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Already have an account? ',
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                    color: theme.colorScheme.onSurface.withOpacity(0.7),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () => context.go('/login'),
                                  child: Text(
                                    'Login',
                                    style: theme.textTheme.bodyMedium?.copyWith(
                                      color: theme.colorScheme.primary,
                                      fontWeight: FontWeight.w600,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}