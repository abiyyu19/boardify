import 'package:boardify/pages/login/handle_login.dart';
import 'package:boardify/pages/login/header_login.dart';
import 'package:boardify/service/supabase_service.dart';
import 'package:boardify/utils/constant.dart';
import 'package:boardify/widgets/custom_button.dart';
import 'package:boardify/widgets/custom_textformfield.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _obscureText = true;

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

            const HeaderLogin(),

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
                  setState(
                    () {
                      _obscureText = !_obscureText;
                    },
                  );
                },
              ),
            ),

            largeGap,

            // Masuk Button
            CustomButton(
              text: "Masuk",
              onPressed: (_emailController.text.isNotEmpty &&
                      _passwordController.text.isNotEmpty)
                  ? () {
                      handleLogin(
                        context,
                        _emailController.text,
                        _passwordController.text,
                      );
                    }
                  : null,
              textColor: Colors.white,
              backgroundColor: mainBlue,
            ),

            // Don't Have an Account?
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Belum Punya akun?',
                  style: TextStyle(
                      fontFamily: 'OpenSans', fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () => {
                    Navigator.pushNamed(context, '/signup'),
                  },
                  child: const Text('Daftar!'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
