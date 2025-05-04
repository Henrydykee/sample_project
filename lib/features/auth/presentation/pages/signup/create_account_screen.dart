import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:new_project/core/di/di_config.dart';
import 'package:new_project/core/platform/color.dart';
import 'package:new_project/core/presentation/state/provider_view_model.dart';
import 'package:new_project/core/presentation/widgets/button.dart';
import 'package:new_project/core/presentation/widgets/custom_text_field.dart';
import 'package:new_project/core/presentation/widgets/loader_wrapper.dart';
import 'package:new_project/core/presentation/widgets/text_holder.dart';
import 'package:new_project/features/auth/presentation/pages/login_screen.dart';
import 'package:new_project/features/auth/presentation/state/authentication_provider.dart';

import '../../../../../core/presentation/widgets/error_component.dart';
import '../../../../../core/utils/navigation_service.dart';
import 'company_details_screen.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final _formKey = GlobalKey<FormState>();
  bool isChecked = false;

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _launchTerms() {
    print("Navigate to Terms of Services");
  }

  void _launchPrivacy() {
    print("Navigate to Privacy Policy");
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
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
                      const Gap(70),
                       TextHolder(
                        title: "Hello there!",
                        size: 32,
                        fontWeight: FontWeight.w700,
                      ),
                      const Gap(8),
                      TextHolder(
                        title: "Create an account to access funding opportunities for your business",
                        size: 14,
                        fontWeight: FontWeight.w400,
                        color: newprojectColor.grey,
                      ),
                      const Gap(40),
                      CustomTextField(
                        controller: _firstNameController,
                        title: "First Name",
                        hinttitle: "Enter your first name",
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "First name is required";
                          }
                          return null;
                        },
                      ),
                      const Gap(24),
                      CustomTextField(
                        controller: _lastNameController,
                        title: "Last Name",
                        hinttitle: "Enter your last name",
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "Last name is required";
                          }
                          return null;
                        },
                      ),
                      const Gap(24),
                      CustomTextField(
                        controller: _emailController,
                        title: "Company Email",
                        hinttitle: "you@company.com",
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "Email is required";
                          }
                          if (!RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$").hasMatch(value.trim())) {
                            return "Enter a valid email";
                          }
                          return null;
                        },
                      ),
                      const Gap(24),
                      CustomTextField(
                        controller: _phoneController,
                        title: "Phone number",
                        hinttitle: "+(234) 000-0000-000",
                        keyboardType: TextInputType.phone,
                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "Phone number is required";
                          }
                          if (value.trim().length < 10) {
                            return "Enter a valid phone number";
                          }
                          return null;
                        },
                      ),
                      const Gap(24),
                      CustomTextField(
                        controller: _passwordController,
                        title: "Password",
                        hinttitle: "*********",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Password is required";
                          }
                          if (value.length < 6) {
                            return "Password must be at least 6 characters";
                          }
                          return null;
                        },
                        obscureText: true,
                      ),
                      const Gap(28),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Checkbox(
                            value: isChecked,
                            activeColor: const Color(0xFFFFA41B),
                            onChanged: (val) {
                              setState(() => isChecked = val!);
                            },
                          ),
                          Expanded(
                            child: RichText(
                              text: TextSpan(
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF8E8E93),
                                  height: 1.5,
                                ),
                                children: [
                                  const TextSpan(
                                    text: "By signing up to create an account I accept\nCompany’s ",
                                  ),
                                  TextSpan(
                                    text: "Terms of services",
                                    style: const TextStyle(
                                      color: Color(0xFFFFA41B),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                    ),
                                    recognizer: TapGestureRecognizer()..onTap = _launchTerms,
                                  ),
                                  const TextSpan(text: " & "),
                                  TextSpan(
                                    text: "Privacy Policy.",
                                    style: const TextStyle(
                                      color: Color(0xFFFFA41B),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                    ),
                                    recognizer: TapGestureRecognizer()..onTap = _launchPrivacy,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Gap(30),
                      GButton(
                        title: "Create an account",
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            if (!isChecked) {
                              showErrorDialog(context, "Authentication Error", "Please accept the Terms and Privacy Policy");
                              return;
                            }
                            await vm.createUser(
                              email: _emailController.text.trim(),
                              password: _passwordController.text,
                              firstName: _firstNameController.text.trim(),
                              lastName: _lastNameController.text.trim(),
                              phone: _phoneController.text.trim(),
                            );
                            if (vm.hasError) {
                              showErrorDialog(context, "Authentication Error", vm.errorMessage);
                            }else{
                              router.push(CompanyDetailsScreen());
                            }

                          }
                        },
                      ),
                      const Gap(20),
                      const DividerWithText(text: 'or continue with'),
                      const Gap(20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset("assets/svg/google_icon.svg"),
                          SvgPicture.asset("assets/svg/apple_icon.svg"),
                          SvgPicture.asset("assets/svg/facebook_icon.svg"),
                        ],
                      ),
                      const Gap(50),
                      GestureDetector(
                        onTap: () => router.push(const LoginScreen()),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextHolder(
                              title: "Already have an account? ",
                              size: 14,
                              fontWeight: FontWeight.w400,
                            ),
                            TextHolder(
                              title: "Sign in",
                              size: 14,
                              fontWeight: FontWeight.w400,
                              color: newprojectColor.orange,
                            ),
                          ],
                        ),
                      ),
                      const Gap(30),
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

class DividerWithText extends StatelessWidget {
  final String text;

  const DividerWithText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(
            color: Colors.grey,
            thickness: 1.0,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
        ),
        const Expanded(
          child: Divider(
            color: Colors.grey,
            thickness: 1.0,
          ),
        ),
      ],
    );
  }
}
