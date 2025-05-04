import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:new_project/core/presentation/state/provider_view_model.dart';
import 'package:new_project/core/presentation/widgets/app_bar.dart';
import 'package:new_project/core/presentation/widgets/error_component.dart';
import 'package:new_project/core/presentation/widgets/loader_wrapper.dart';
import 'package:new_project/features/auth/data/models/create_organisation.dart';
import 'package:new_project/features/auth/presentation/pages/login_screen.dart';
import 'package:new_project/features/auth/presentation/state/authentication_provider.dart';

import '../../../../../core/di/di_config.dart';
import '../../../../../core/platform/color.dart';
import '../../../../../core/presentation/widgets/button.dart';
import '../../../../../core/presentation/widgets/custom_text_field.dart';
import '../../../../../core/presentation/widgets/step_indicator.dart';
import '../../../../../core/presentation/widgets/text_holder.dart';
import '../../../../../core/utils/navigation_service.dart';

class FinalStepScreen extends StatefulWidget {
  final String companyName;
  final String companyWebsite;
  final String country;
  final String province;
  final String businessType;
  final String businessGoals;
  final String registrationDate;
  final String companyStatus;

  const FinalStepScreen({
    super.key,
    required this.companyName,
    required this.companyWebsite,
    required this.country,
    required this.province,
    required this.businessType,
    required this.businessGoals,
    required this.registrationDate,
    required this.companyStatus,
  });

  @override
  State<FinalStepScreen> createState() => _FinalStepScreenState();
}

class _FinalStepScreenState extends State<FinalStepScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _companySizeController = TextEditingController();
  final TextEditingController _revenueController = TextEditingController();
  final TextEditingController _industryController = TextEditingController();
  final TextEditingController _demographicController = TextEditingController();
  final TextEditingController _dilutiveCapitalController = TextEditingController();
  final TextEditingController _grantFundingController = TextEditingController();
  final TextEditingController _researchController = TextEditingController();
  final TextEditingController _payrollController = TextEditingController();
  final TextEditingController _debtFundingController = TextEditingController();

  @override
  void dispose() {
    _companySizeController.dispose();
    _revenueController.dispose();
    _industryController.dispose();
    _demographicController.dispose();
    _dilutiveCapitalController.dispose();
    _grantFundingController.dispose();
    _researchController.dispose();
    _payrollController.dispose();
    _debtFundingController.dispose();
    super.dispose();
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
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      StepIndicator(
                        currentStep: 3,
                        totalSteps: 3,
                        activeColor: Colors.black,
                        inactiveColor: Colors.grey.shade300,
                        completedColor: Colors.black,
                      ),
                      const Gap(20),
                      TextHolder(title: "Almost there!", size: 24, fontWeight: FontWeight.w700),
                      TextHolder(
                        title: "Just a few more questions and you’re done",
                        size: 14,
                        fontWeight: FontWeight.w400,
                        color: newprojectColor.grey,
                      ),
                      const Gap(40),
                      CustomTextField(
                        title: "Company Size. (Other than business owners, how many employees are on payroll?)",
                        hinttitle: "20",
                        controller: _companySizeController,
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Company Size is required';
                          }
                          if (int.tryParse(value) == null) {
                            return 'Company Size must be a number';
                          }
                          return null;
                        },
                      ),
                      const Gap(30),
                      CustomTextField(
                        title: "Annual Revenue",
                        hinttitle: "100,000",
                        controller: _revenueController,
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Annual Revenue is required';
                          }
                          if (double.tryParse(value.replaceAll(',', '')) == null) {
                            return 'Annual Revenue must be a valid number';
                          }
                          return null;
                        },
                      ),
                      const Gap(30),
                      CustomTextField(
                        title: "Industry",
                        hinttitle: "",
                        controller: _industryController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Industry is required';
                          }
                          return null;
                        },
                      ),
                      const Gap(30),
                      CustomTextField(
                        title: "Founder Demographics",
                        hinttitle: "",
                        controller: _demographicController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Founder Demographics is required';
                          }
                          return null;
                        },
                      ),
                      const Gap(30),
                      CustomTextField(
                        title: "Debt Funding",
                        hinttitle: "",
                        keyboardType: TextInputType.number,
                        controller: _debtFundingController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Founder Demographics is required';
                          }
                          return null;
                        },
                      ),
                      const Gap(30),
                      CustomTextField(
                        title: "Have you raised dilutive capital?",
                        hinttitle: "",
                        controller: _dilutiveCapitalController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please answer about dilutive capital';
                          }
                          return null;
                        },
                      ),
                      const Gap(30),
                      CustomTextField(
                        title: "Have you accessed grant funding before?",
                        hinttitle: "",
                        controller: _grantFundingController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please answer about grant funding';
                          }
                          return null;
                        },
                      ),
                      const Gap(30),
                      CustomTextField(
                        title: "Do you engage in research Development?",
                        hinttitle: "",
                        controller: _researchController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please answer about research development';
                          }
                          return null;
                        },
                      ),
                      const Gap(30),
                      CustomTextField(
                        title: "What payroll system do you use?",
                        hinttitle: "",
                        controller: _payrollController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please specify your payroll system';
                          }
                          return null;
                        },
                      ),
                      const Gap(30),
                      GButton(
                        title: "Finish",
                        onTap: () async {
                          if (_formKey.currentState?.validate() ?? false) {
                            final params = CreateOrganizationParams(
                              orgName: widget.companyName,
                              orgWebsite: widget.companyWebsite,
                              countryOperation: widget.country,
                              businessType: widget.businessType,
                              businessIncorporate: widget.registrationDate,
                              businessGoal: widget.businessGoals,
                              size: _companySizeController.text.trim(),
                              registered: widget.companyStatus,
                              revenue: _revenueController.text.trim(),
                              industry: _industryController.text.trim(),
                              demographic: _demographicController.text.trim(),
                              grantFunding: int.parse(_grantFundingController.text.trim()),
                              debtFunding: int.parse(_debtFundingController.text.trim()),
                              equityFunding: int.parse(_grantFundingController.text.trim()),
                              payroll: _payrollController.text.trim(),
                              research: _researchController.text.trim(),
                            );
                            await model.createOrg(params);
                            if (model.hasError) {
                              showErrorDialog(context, "Error", model.errorMessage);
                            } else {
                              router.push(LoginScreen());
                            }

                            // NavigationService.pushReplacement(const LoginScreen());
                          }
                        },
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
