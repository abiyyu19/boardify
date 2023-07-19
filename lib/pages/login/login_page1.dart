import 'package:boardify/providers/button.dart';
import 'package:boardify/providers/secure_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/constant.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_textformfield.dart';
import 'header_login.dart';

class LoginPage1 extends StatelessWidget {
  LoginPage1({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SecureText(),
        ),
        ChangeNotifierProvider(
          create: (context) => Button(),
        )
      ],
      child: Scaffold(
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
              const Text("ini halaman login yang baru"),

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
              Consumer<SecureText>(
                builder: (context, secureIcon, _) => CustomTextFormField(
                  label: 'Password',
                  controller: _passwordController,
                  inputType: TextInputType.visiblePassword,
                  obsecureText: secureIcon.secureText,
                  suffixIcon: IconButton(
                    icon: Icon(
                      secureIcon.secureText
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Theme.of(context).primaryColorDark,
                    ),
                    onPressed: () {
                      context.read<SecureText>().changeSecureText();
                    },
                  ),
                ),
              ),

              largeGap,

              // Masuk Button
              Consumer<Button>(
                builder: (context, button, _) => CustomButton(
                  text: "Masuk",
                  onPressed: () {
                    print(_emailController.text);
                  },
                  textColor: Colors.white,
                  backgroundColor: const Color(0xFF2B65F6),
                ),
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
      ),
    );
  }
}
