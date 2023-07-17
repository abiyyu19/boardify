import 'package:boardify/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
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
        backgroundColor: Colors.transparent,
      ),
      body: Form(
        key: _formKey,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Logo
                Center(
                  child: SvgPicture.asset('assets/boardify_logo.svg'),
                ),

                largeGap,
                largeGap,

                // Text
                const Text(
                  "Selamat Datang!",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),

                const Text(
                  "Silahkan masuk untuk melanjutkan",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.w100),
                ),

                largeGap,

                // Email Label
                const Text(
                  "Email",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                smallGap,

                // Email Form
                TextFormField(
                  decoration: InputDecoration(
                    enabledBorder: enabledBorder(),
                    focusedBorder: focusedBorder(),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailController,
                ),

                smallGap,

                // Password Label
                const Text(
                  "Password",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                smallGap,

                // Password Form
                TextFormField(
                  decoration: InputDecoration(
                    enabledBorder: enabledBorder(),
                    focusedBorder: focusedBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(
                        // Based on passwordVisible state choose the icon
                        _obscureText ? Icons.visibility : Icons.visibility_off,
                        color: Theme.of(context).primaryColorDark,
                      ),
                      onPressed: () {
                        // Update the state i.e. toogle the state of passwordVisible variable
                        setState(
                          () {
                            _obscureText = !_obscureText;
                          },
                        );
                      },
                    ),
                  ),
                  obscureText: _obscureText,
                  controller: _passwordController,
                ),

                largeGap,

                // Masuk Button
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                      backgroundColor: const Color(0xFF2B65F6)),
                  onPressed: () => {},
                  child: const Text(
                    "Masuk",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),

                // Don't Have an Account?
              ],
            ),
          ),
        ),
      ),
    );
  }

  OutlineInputBorder focusedBorder() {
    return const OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.black,
        width: 2,
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(8),
      ),
    );
  }

  OutlineInputBorder enabledBorder() {
    return const OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.black,
        width: 2,
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(8),
      ),
    );
  }
}
