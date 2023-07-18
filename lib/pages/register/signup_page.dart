import 'package:boardify/pages/login/header_login.dart';
import 'package:boardify/pages/register/header_register.dart';
import 'package:boardify/utils/constant.dart';
import 'package:boardify/widgets/custom_button.dart';
import 'package:boardify/widgets/custom_textformfield.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _obscureText = true;
  bool _obscureText2 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: const BackButton(
          color: Colors.black,
        ),
        backgroundColor: Colors.white38,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [
            largeGap,

            const HeaderRegister(),

            smallGap,

            // Name Form
            CustomTextFormField(
              label: "Nama",
              controller: _nameController,
            ),

            smallGap,

            // Email Form
            CustomTextFormField(
              controller: _emailController,
              label: "Email",
              inputType: TextInputType.emailAddress,
            ),

            smallGap,

            // Password Form
            CustomTextFormField(
              label: 'Password',
              controller: _passwordController,
              inputType: TextInputType.visiblePassword,
              obsecureText: _obscureText,
              suffixIcon: IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                  color: Theme.of(context).primaryColorDark,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              ),
            ),

            smallGap,

            // Confirm Password
            CustomTextFormField(
              label: 'Confirm Password',
              controller: _confirmPasswordController,
              inputType: TextInputType.visiblePassword,
              obsecureText: _obscureText2,
              suffixIcon: IconButton(
                icon: Icon(
                  _obscureText2 ? Icons.visibility : Icons.visibility_off,
                  color: Theme.of(context).primaryColorDark,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText2 = !_obscureText2;
                  });
                },
              ),
            ),

            largeGap,

            // Daftar Button
            CustomButton(
              text: "Daftar",
              onPressed: () => {},
              textColor: Colors.white,
              backgroundColor: const Color(0xFF2B65F6),
            ),
          ],
        ),
      ),
    );
  }
}
