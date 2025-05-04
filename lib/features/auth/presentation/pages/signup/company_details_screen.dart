import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:new_project/core/platform/color.dart';
import 'package:new_project/core/presentation/state/provider_view_model.dart';
import 'package:new_project/core/presentation/widgets/app_bar.dart';
import 'package:new_project/core/presentation/widgets/button.dart';
import 'package:new_project/core/presentation/widgets/step_indicator.dart';
import 'package:new_project/core/presentation/widgets/text_field.dart';
import 'package:new_project/core/presentation/widgets/text_holder.dart';
import 'package:new_project/features/auth/presentation/pages/signup/country_picker_screen.dart';
import 'package:new_project/features/auth/presentation/pages/signup/final_step_screen.dart';
import 'package:new_project/features/auth/presentation/state/authentication_provider.dart';
import '../../../../../core/di/di_config.dart';
import '../../../../../core/utils/navigation_service.dart';

class CompanyDetailsScreen extends StatefulWidget {
  const CompanyDetailsScreen({super.key});

  @override
  State<CompanyDetailsScreen> createState() => _CompanyDetailsScreenState();
}

class _CompanyDetailsScreenState extends State<CompanyDetailsScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _companyNameController = TextEditingController();
  final TextEditingController _companyWebsiteController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _provinceController = TextEditingController();
  final TextEditingController _businessTypeController = TextEditingController();
  final TextEditingController _businessGoalsController = TextEditingController();
  final TextEditingController _registrationDateController = TextEditingController();
  final TextEditingController _companyStatusController = TextEditingController();

  @override
  void dispose() {
    _companyNameController.dispose();
    _companyWebsiteController.dispose();
    _countryController.dispose();
    _provinceController.dispose();
    _businessTypeController.dispose();
    _businessGoalsController.dispose();
    _registrationDateController.dispose();
    _companyStatusController.dispose();
    super.dispose();
  }

  void _pickDate() async {
    DateTime? pickedDate;

    if (Platform.isIOS) {
      showCupertinoModalPopup(
        context: context,
        builder: (_) => Container(
          height: 260,
          color: Colors.white,
          child: Column(
            children: [
              SizedBox(
                height: 200,
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.date,
                  initialDateTime: DateTime.now(),
                  onDateTimeChanged: (dateTime) {
                    pickedDate = dateTime;
                  },
                ),
              ),
              CupertinoButton(
                child: const Text('Done'),
                onPressed: () {
                  if (pickedDate != null) {
                    _registrationDateController.text = _formatDate(pickedDate!);
                  }
                  Navigator.of(context).pop();
                },
              )
            ],
          ),
        ),
      );
    } else {
      pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(2100),
      );

      if (pickedDate != null) {
        _registrationDateController.text = _formatDate(pickedDate);
      }
    }
  }

  String _formatDate(DateTime date) {
    return "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
  }

  void _proceed() {
    if (_formKey.currentState!.validate()) {
      router.push(
        FinalStepScreen(
          companyName: _companyNameController.text,
          companyWebsite: _companyWebsiteController.text,
          country: _countryController.text,
          province: _provinceController.text,
          businessType: _businessTypeController.text,
          businessGoals: _businessGoalsController.text,
          registrationDate: _registrationDateController.text,
          companyStatus: _companyStatusController.text,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider(
      viewModel: AuthenticationProvider(inject()),
      builder: (context, model, child) {
        return Scaffold(
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
                      currentStep: 2,
                      totalSteps: 3,
                      activeColor: Colors.black,
                      inactiveColor: Colors.grey.shade300,
                      completedColor: Colors.black,
                    ),
                    const Gap(40),
                    TextHolder(title: "Welcome aboard!", size: 24, fontWeight: FontWeight.w700),
                    TextHolder(
                      title: "Complete your profile to get started",
                      size: 14,
                      fontWeight: FontWeight.w400,
                      color: newprojectColor.grey,
                    ),
                    const Gap(40),
                    CustomTextField(
                      controller: _companyNameController,
                      title: "Company Name",
                      hinttitle: "Enter company name",
                      validator: (value) => value == null || value.isEmpty ? 'Company name is required' : null,
                    ),
                    const Gap(30),
                    CustomTextField(
                      controller: _companyWebsiteController,
                      title: "Company Website",
                      hinttitle: "you@company.com",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Company website is required';
                        }
                        if (!value.contains('.') ) {
                          return 'Enter a valid website or email';
                        }
                        return null;
                      },
                    ),
                    const Gap(30),
                    CustomTextField(
                      controller: _countryController,
                      title: "In which country does your company operate?",
                      hinttitle: "Select country",
                      readOnly: true,
                      onTap: () async {
                        var country =  await router.push(SelectCountryScreen());
                        if (country != null) {
                          setState(() {
                            _countryController.text = country;
                          });

                        }

                      },
                      validator: (value) => value == null || value.isEmpty ? 'Country is required' : null,
                    ),
                    const Gap(30),
                    CustomTextField(
                      controller: _provinceController,
                      title: "In which province is your business incorporated?",
                      hinttitle: "",
                      validator: (value) => value == null || value.isEmpty ? 'Province is required' : null,
                    ),
                    const Gap(30),
                    CustomTextField(
                      controller: _businessTypeController,
                      title: "What’s your business type?",
                      hinttitle: "",
                      validator: (value) => value == null || value.isEmpty ? 'Business type is required' : null,
                    ),
                    const Gap(30),
                    CustomTextField(
                      padding:   EdgeInsets.all(8.0),
                      controller: _businessGoalsController,
                      title: "Tell us your key business goals in the next 12 months",
                      hinttitle: "",
                      maxLines: 5,
                      validator: (value) => value == null || value.isEmpty ? 'Business goals are required' : null,
                    ),
                    const Gap(30),
                    GestureDetector(
                      onTap: _pickDate,
                      child: AbsorbPointer(
                        child: CustomTextField(
                          controller: _registrationDateController,
                          title: "Company founded/Registration Date",
                          hinttitle: "Select a date",
                          validator: (value) => value == null || value.isEmpty ? 'Registration date is required' : null,
                        ),
                      ),
                    ),
                    const Gap(30),
                    CustomTextField(
                      controller: _companyStatusController,
                      title: "Company Status",
                      hinttitle: "",
                      validator: (value) => value == null || value.isEmpty ? 'Company status is required' : null,
                    ),
                    const Gap(30),
                    GButton(
                      title: "Proceed",
                      onTap: _proceed,
                    ),
                    const Gap(30),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
