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
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final Height = MediaQuery.of(context).size.height;
    final Width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: Height * 0.1),
              child: Text(
                'torogi',
                style: TextStyle(fontSize: 70, fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                left: Height * 0.03,
                right: Height * 0.03,
                top: 20,
              ),
              height: Height * 0.55,
              color: theme.colorScheme.surface,
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: Height * 0.03,
                    right: Height * 0.03,
                    top: 10,
                    bottom: 10,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CustomTextField(
                        controller: usernameController,
                        hintText: 'Username',
                      ),
                      CustomTextField(
                        controller: emailController,
                        hintText: 'Email',
                      ),
                      CustomTextField(
                        controller: passwordController,
                        hintText: 'Password',
                        obscureText: true,
                      ),
                      CustomTextField(
                        controller: confirmPasswordController,
                        hintText: 'Retype Password',
                        obscureText: true,
                      ),

                      BlocConsumer<SignupBloc, SignupState>(
                        listener: (context, state) {
                          if (state is SignupFailure) {
                            showSnackBar(context, state.error, isError: true);
                          } else if (state is SignupSuccess) {
                            showSnackBar(context, "Registration Successful!");
                            context.go('/login');
                          }
                        },
                        builder: (context, state) {
                          if (state is SignupLoading) {
                            return const CircularProgressIndicator();
                          }
                          return CustomButton(
                            text: "Register",
                            onPressed: () {
                              if (passwordController.text.trim() !=
                                  confirmPasswordController.text.trim()) {
                                showSnackBar(
                                  context,
                                  "Passwords do not match!",
                                  isError: true,
                                );
                                return;
                              }

                              context.read<SignupBloc>().add(
                                SignupSubmitted(
                                  emailController.text.trim(),
                                  passwordController.text.trim(),
                                  usernameController.text.trim(),
                                ),
                              );
                            },
                          );
                        },
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(child: Text("Already have an Acoount. ")),
                          Container(
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: theme.colorScheme.secondary,
                                  width: 1.0,
                                ),
                              ),
                            ),
                            child: GestureDetector(
                              onTap: () => {GoRouter.of(context).go('/login')},
                              child: Text(
                                "Login",
                                style: TextStyle(
                                  color: theme.colorScheme.secondary,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
