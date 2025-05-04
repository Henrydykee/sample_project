import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:new_project/core/presentation/state/provider_view_model.dart';
import 'package:new_project/core/presentation/widgets/app_bar.dart';
import 'package:new_project/core/presentation/widgets/button.dart';
import 'package:new_project/core/presentation/widgets/error_component.dart';
import 'package:new_project/core/presentation/widgets/loader_wrapper.dart';
import 'package:new_project/core/presentation/widgets/text_field.dart';
import 'package:new_project/core/presentation/widgets/text_holder.dart';
import 'package:new_project/features/auth/domain/usecases/update_user.dart';
import 'package:new_project/features/auth/presentation/state/authentication_provider.dart';
import 'package:new_project/features/navigation_bar/nav_bar.dart';
import '../../../../core/di/di_config.dart';
import '../../../../core/managers/local_sorage.dart';
import '../../../../core/utils/navigation_service.dart';
import '../../../auth/data/models/user_model.dart';

class PersonalDetailScreen extends StatefulWidget {
  const PersonalDetailScreen({super.key});

  @override
  State<PersonalDetailScreen> createState() => _PersonalDetailScreenState();
}

class _PersonalDetailScreenState extends State<PersonalDetailScreen> {
  UserModel? user;
  XFile? _selectedImage;

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  Future<void> _load() async {
    final userMap = inject<LocalStorageService>().getJson("user");
    if (userMap != null) {
      user = UserModelMapper.fromMap(userMap);
      _firstNameController.text = user?.first_name ?? '';
      _lastNameController.text = user?.first_name ?? '';
      _phoneController.text = user?.phone ?? '';
      _emailController.text = user?.email ?? '';
    }
  }

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider(
        viewModel: AuthenticationProvider(inject()),
        builder: (context, viewModel, child) {
          return LoaderWrapper(
            isLoading: viewModel.isLoading,
            view: Scaffold(
              appBar: CustomAppBar(),
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextHolder(
                                title: "Personal Details",
                                size: 24,
                                fontWeight: FontWeight.w700,
                              ),
                              const Gap(44),
                              Center(
                                child: Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () async {
                                        final file = await _pickImage(context);
                                        if (file != null) {
                                          setState(() {
                                            _selectedImage = file;
                                          });
                                          await viewModel.updateProfileImage(file);
                                          final message = viewModel.hasError
                                              ? viewModel.errorMessage
                                              : "Profile Picture Updated";
                                          showErrorDialog(
                                            context,
                                            viewModel.hasError ? "Error" : "Success",
                                            message,
                                          );
                                        }
                                      },
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(60),
                                        child: _selectedImage != null
                                            ? Image.asset(
                                          _selectedImage!.path,
                                          width: 120,
                                          height: 120,
                                          fit: BoxFit.cover,
                                        )
                                            : (user?.file?.file_path != null
                                            ? Image.network(
                                          user!.file!.file_path,
                                          width: 120,
                                          height: 120,
                                          fit: BoxFit.cover,
                                        )
                                            : SvgPicture.asset(
                                          "assets/svg/profile_photo.svg",
                                          width: 120,
                                          height: 120,
                                        )),
                                      ),
                                    )
                                    ,
                                    TextHolder(
                                      title: "Add a profile Picture",
                                      size: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ],
                                ),
                              ),
                              const Gap(30),
                              CustomTextField(
                                title: "First Name",
                                controller: _firstNameController,
                                validator: (value) =>
                                value == null || value.isEmpty ? 'First name is required' : null,
                              ),
                              const Gap(20),
                              CustomTextField(
                                title: "Last Name",
                                controller: _lastNameController,
                                validator: (value) =>
                                value == null || value.isEmpty ? 'Last name is required' : null,
                              ),
                              const Gap(20),
                              CustomTextField(
                                title: "Phone number",
                                controller: _phoneController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) return 'Phone number is required';
                                  if (value.length < 10) return 'Enter a valid phone number';
                                  return null;
                                },
                              ),
                              const Gap(20),
                              CustomTextField(
                                title: "Email",
                                controller: _emailController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) return 'Email is required';
                                  if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$').hasMatch(value)) {
                                    return 'Enter a valid email';
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 30),
                        child: GButton(
                          title: 'Update',
                          onTap: () async {
                            if (_formKey.currentState!.validate()) {
                              UpdateUserParams params = UpdateUserParams(email: _emailController.text, phone: _phoneController.text, firstName: _firstNameController.text, lastName: _lastNameController.text);;
                              await viewModel.updateUser(params);
                              if(viewModel.hasError){
                                showErrorDialog(context, "Error", viewModel.errorMessage);
                              }else{
                                router.push(GrantNavBar());
                              }
                            }
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        }
    );
  }

  Future<XFile?> _pickImage(BuildContext context) async {
    return showModalBottomSheet<XFile?>(
      context: context,
      builder: (_) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: Icon(Icons.camera_alt),
                title: Text('Take a photo'),
                onTap: () async {
                  final pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);
                  Navigator.pop(context, pickedFile != null ? XFile(pickedFile.path) : null);
                },
              ),
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text('Choose from gallery'),
                onTap: () async {
                  final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
                  Navigator.pop(context, pickedFile != null ? XFile(pickedFile.path) : null);
                },
              ),
            ],
          ),
        );
      },
    );
  }


}



