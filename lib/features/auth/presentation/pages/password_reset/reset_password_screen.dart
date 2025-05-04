import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_project/core/presentation/widgets/app_bar.dart';
import 'package:new_project/core/presentation/widgets/button.dart';
import 'package:new_project/core/presentation/widgets/text_field.dart';
import 'package:new_project/features/auth/presentation/pages/login_screen.dart';

import '../../../../../core/utils/navigation_service.dart';

class PasswordResetScreen extends StatefulWidget {
  String email;
   PasswordResetScreen({Key? key, required this.email}) : super(key: key);

  @override
  State<PasswordResetScreen> createState() => _PasswordResetScreenState();
}

class _PasswordResetScreenState extends State<PasswordResetScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  String _password = '';
  bool _passwordStrengthWeak = true;
  bool _passwordVisible = false;
  bool _confirmPasswordVisible = false;

  List<bool> _validationChecks = [false, false, false, false];

  void _validatePassword(String value) {
    setState(() {
      _password = value;

      // Check password strength (simple check for demonstration)
      _passwordStrengthWeak = value.length < 10;
      _validationChecks[0] = true; // Let's assume we always mark this as checked for the example

      // Check if password contains name or email
      _validationChecks[1] = true; // Simplified check for demo

      // Check if password has at least 8 characters
      _validationChecks[2] = value.length >= 8;

      // Check if password contains a number or symbol
      _validationChecks[3] = RegExp(r'[0-9!@#$%^&*(),.?":{}|<>]').hasMatch(value);
    });
  }

  void _togglePasswordVisibility() {
    setState(() {
      _passwordVisible = !_passwordVisible;
    });
  }

  void _toggleConfirmPasswordVisibility() {
    setState(() {
      _confirmPasswordVisible = !_confirmPasswordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Reset Password',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Color(0xFF333333),
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Enter your email in the field below for the code to reset your password',
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF666666),
              ),
            ),
            const SizedBox(height: 40),
            CustomTextField(
              title: "Password",
              controller: _passwordController,
              obscureText: !_passwordVisible,
              onchanged: _validatePassword,
              suffixIcon: IconButton(
                icon: Icon(
                  _passwordVisible ? Icons.visibility : Icons.visibility_off,
                  color: Colors.grey,
                ),
                onPressed: _togglePasswordVisibility,
              ),
            ),
            const SizedBox(height: 24),
            CustomTextField(
              title: 'Confirm Password',
              controller: _confirmPasswordController,
              obscureText: !_confirmPasswordVisible,
              suffixIcon: IconButton(
                icon: Icon(
                  _confirmPasswordVisible ? Icons.visibility : Icons.visibility_off,
                  color: Colors.grey,
                ),
                onPressed: _toggleConfirmPasswordVisibility,
              ),
            ),
            const SizedBox(height: 32),
            _buildValidationItem(
              isValid: _validationChecks[0],
              text: 'Password Strength : ${_passwordStrengthWeak ? 'Weak' : 'Strong'}',
            ),
            const SizedBox(height: 12),
            _buildValidationItem(
              isValid: _validationChecks[1],
              text: 'Cannot contain your name or email address',
            ),
            const SizedBox(height: 12),
            _buildValidationItem(
              isValid: _validationChecks[2],
              text: 'At least 8 characters',
            ),
            const SizedBox(height: 12),
            _buildValidationItem(
              isValid: _validationChecks[3],
              text: 'Contains a number or symbol',
            ),
            const SizedBox(height: 32),
            GButton(
              title: "Reset password",
              onTap: () =>  router.push(LoginScreen()),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildValidationItem({required bool isValid, required String text}) {
    return Row(
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            color: isValid ? const Color(0xFF4CAF50) : Colors.grey.shade300,
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.check,
            size: 10,
            color: Colors.white,
          ),
        ),
        const SizedBox(width: 12),
        Text(
          text,
          style: TextStyle(
            fontSize: 14,
            color: isValid ? const Color(0xFF4CAF50) : Colors.grey.shade700,
          ),
        ),
      ],
    );
  }
}