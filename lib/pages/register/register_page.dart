import 'package:boardify/pages/register/header_register.dart';
import 'package:boardify/service/supabase_service.dart';
import 'package:boardify/utils/constant.dart';
import 'package:boardify/widgets/custom_button.dart';
import 'package:boardify/widgets/custom_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'handle_register.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
        onChanged: () {
          setState(() {});
        },
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
              onPressed: (_nameController.text.isNotEmpty &&
                      _emailController.text.isNotEmpty &&
                      _passwordController.text.isNotEmpty &&
                      _confirmPasswordController.text.isNotEmpty)
                  ? () {
                      handleRegister(
                        context,
                        _nameController.text,
                        _emailController.text,
                        _passwordController.text,
                        _confirmPasswordController.text,
                      );
                    }
                  : null,
              textColor: Colors.white,
              backgroundColor: mainBlue,
            ),
          ],
        ),
      ),
    );
  }

  // Future<dynamic> loadingWidget(BuildContext context) {
  //   return showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return const SpinKitCircle(
  //         size: 100,
  //         color: mainBlue,
  //       );
  //     },
  //   );
  // }

  // void handleRegister() {
  //   if (_passwordController.text != _confirmPasswordController.text) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(
  //         content: Text("Password harus sama"),
  //       ),
  //     );
  //   } else if (_passwordController.text.length < 6 &&
  //       _confirmPasswordController.text.length < 6) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(
  //         content: Text("Password harus terdiri dari 6 karakter"),
  //       ),
  //     );
  //   } else {
  //     loadingWidget(context);
  //     signUpEmailAndPassword(_emailController.text, _passwordController.text)
  //         .then(
  //       (value) {
  //         setState(() {
  //           _isLoading = false;
  //         });
  //         ScaffoldMessenger.of(context).showSnackBar(
  //           const SnackBar(
  //             content: Text("Register Berhasil"),
  //           ),
  //         );
  //         Navigator.pushNamedAndRemoveUntil(
  //             context, '/login', ModalRoute.withName('/onboarding'));
  //         // Navigator.pushReplacementNamed(context, '/login');
  //       },
  //     );
  //   }
  // }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }
}