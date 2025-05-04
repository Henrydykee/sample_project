import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:new_project/core/di/di_config.dart';
import 'package:new_project/core/presentation/state/provider_view_model.dart';
import 'package:new_project/core/presentation/widgets/loader_wrapper.dart';
import 'package:new_project/features/auth/presentation/pages/password_reset/enter_email_screen.dart';
import 'package:new_project/features/auth/presentation/pages/signup/create_account_screen.dart';
import 'package:new_project/features/auth/presentation/state/authentication_provider.dart';
import 'package:new_project/features/navigation_bar/nav_bar.dart';
import '../../../../core/platform/color.dart';
import '../../../../core/presentation/widgets/button.dart';
import '../../../../core/presentation/widgets/custom_text_field.dart';
import '../../../../core/presentation/widgets/error_component.dart';
import '../../../../core/presentation/widgets/text_holder.dart';
import '../../../../core/utils/navigation_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isChecked = false;
  bool _obscureText = true; // 👈 show/hide password toggle

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider(
      viewModel: AuthenticationProvider(inject()),
      builder: (context, vm, child) {
        return LoaderWrapper(
          isLoading: vm.isLoading,
          view: Scaffold(
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Gap(70),
                      TextHolder(
                        title: "Welcome back!",
                        size: 32,
                        fontWeight: FontWeight.w700,
                      ),
                      Gap(8),
                      TextHolder(
                        title: "We’ve added more opportunities for you",
                        size: 14,
                        fontWeight: FontWeight.w400,
                        color: newprojectColor.grey,
                      ),
                      Gap(40),
                      CustomTextField(
                        title: "Company Email",
                        hinttitle: "Enter your company email",
                        controller: _emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$')
                              .hasMatch(value)) {
                            return 'Enter a valid email address';
                          }
                          return null;
                        },
                      ),
                      Gap(24),
                      CustomTextField(
                        title: "Password",
                        hinttitle: "*********",
                        obscureText: _obscureText,
                        controller: _passwordController,
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscureText ? Icons.visibility_off : Icons.visibility,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          } else if (value.length < 6) {
                            return 'Password must be at least 6 characters';
                          }
                          return null;
                        },
                      ),
                      Gap(10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                value: isChecked,
                                activeColor: const Color(0xFFFFA41B),
                                onChanged: (val) {
                                  setState(() => isChecked = val!);
                                },
                              ),
                              TextHolder(
                                title: "Remember me",
                                fontWeight: FontWeight.w400,
                                size: 14,
                              )
                            ],
                          ),
                          GestureDetector(
                            onTap: () => router.push(EnterEmailScreen()),
                            child: TextHolder(
                              title: "Forgot your password",
                              fontWeight: FontWeight.w400,
                              size: 14,
                            ),
                          )
                        ],
                      ),
                      Gap(30),
                      GButton(
                        title: "Log in",
                        onTap: () async {
                          if (!_formKey.currentState!.validate()) return;
                          await vm.login(
                            email: _emailController.text.trim(),
                            password: _passwordController.text.trim(),
                          );
                          if (vm.hasError) {
                            showErrorDialog(
                              context,
                              "Authentication Error",
                              vm.errorMessage,
                            );
                            return;
                          }
                          router.push(GrantNavBar());
                        },
                      ),
                      Gap(20),
                      const DividerWithText(text: 'or continue with'),
                      Gap(20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset("assets/svg/google_icon.svg"),
                          SvgPicture.asset("assets/svg/apple_icon.svg"),
                          SvgPicture.asset("assets/svg/facebook_icon.svg"),
                        ],
                      ),
                      Gap(50),
                      GestureDetector(
                        onTap: () => router.push(CreateAccountScreen()),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextHolder(
                              title: "Don’t have an account? ",
                              size: 14,
                              fontWeight: FontWeight.w400,
                            ),
                            TextHolder(
                              title: "Create account",
                              size: 14,
                              fontWeight: FontWeight.w400,
                              color: newprojectColor.orange,
                            ),
                          ],
                        ),
                      ),
                      Gap(30),
                    ],
                  ),
                ),
              ),
            ),
          ),

        );
      },
    );
  }
}
