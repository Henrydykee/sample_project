import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:new_project/core/di/di_config.dart';
import 'package:new_project/core/presentation/state/provider_view_model.dart';
import 'package:new_project/core/presentation/widgets/error_component.dart';
import 'package:new_project/core/presentation/widgets/loader_wrapper.dart';
import 'package:new_project/features/auth/presentation/pages/password_reset/reset_password_screen.dart';
import 'package:new_project/features/auth/presentation/state/authentication_provider.dart';

import '../../../../../core/platform/color.dart';
import '../../../../../core/presentation/widgets/app_bar.dart';
import '../../../../../core/presentation/widgets/button.dart';
import '../../../../../core/presentation/widgets/custom_text_field.dart';
import '../../../../../core/presentation/widgets/text_holder.dart';
import '../../../../../core/utils/navigation_service.dart';

class EnterEmailScreen extends StatefulWidget {
  const EnterEmailScreen({super.key});

  @override
  State<EnterEmailScreen> createState() => _EnterEmailScreenState();
}

class _EnterEmailScreenState extends State<EnterEmailScreen> {
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    // Basic email pattern validation
    const pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
    final regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider(
      viewModel: AuthenticationProvider(inject()),
      builder: (context, model, child) {
        return LoaderWrapper(
          isLoading: model.isLoading,
          view: Scaffold(
            backgroundColor: Colors.white,
            appBar: CustomAppBar(),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextHolder(
                        title: "Forgot your password?",
                        size: 32,
                        fontWeight: FontWeight.w700,
                      ),
                      const Gap(8),
                      TextHolder(
                        title: "Enter your email in the field below for the code to reset your password",
                        size: 14,
                        fontWeight: FontWeight.w400,
                        color: newprojectColor.grey,
                      ),
                      const Gap(40),
                      CustomTextField(
                        controller: _emailController,
                        title: "Company Email",
                        hinttitle: "Enter your company email",
                        validator: _validateEmail,
                      ),
                      const Gap(24),
                      GButton(
                        title: "Continue",
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            await model.requestPasswordRest(_emailController.text.trim());
                            if (model.hasError) {
                              showErrorDialog(context, "Error", model.errorMessage.toString());
                            } else {
                              router.push(PasswordResetScreen(
                                email: _emailController.text,
                              ));
                            }
                          }
                        },
                      ),
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
