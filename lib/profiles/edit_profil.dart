import 'package:boardify/service/supabase_service.dart';
import 'package:boardify/utils/constant.dart';
import 'package:boardify/widgets/custom_button.dart';
import 'package:boardify/widgets/custom_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final User? user = client.auth.currentUser;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _oldPassword = TextEditingController();
  final TextEditingController _newPassword = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    setState(() {
      _nameController.text = user?.userMetadata?['name'];
      _emailController.text = user?.userMetadata?['email'];
    });
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        centerTitle: true,
        title: const Text(
          'EDIT PROFIL',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 20,
          ),
          children: [
            smallGap,
            CustomTextFormField(
              label: 'Nama',
              controller: _nameController,
            ),
            smallGap,
            CustomTextFormField(
              label: 'email',
              controller: _emailController,
            ),
            smallGap,
            CustomTextFormField(
              label: 'Password Lama',
              controller: _oldPassword,
            ),
            smallGap,
            CustomTextFormField(
              label: 'Password Baru',
              controller: _newPassword,
            ),
            CustomButton(
              text: 'SIMPAN',
              textColor: Colors.white,
              backgroundColor: mainBlue,
              //                   onPressed: (_nameController.text.isNotEmpty &&
              //                           _emailController.text.isNotEmpty &&
              //                           _oldPassword.text.isNotEmpty &&
              //                           _newPassword.text.isNotEmpty )
              //                       ? () {

              // //                         if (_oldPassword.text != confirmPassword) {
              // //   ScaffoldMessenger.of(context).showSnackBar(
              // //     const SnackBar(
              // //       content: Text("Password harus sama"),
              // //     ),
              // //   );
              // // } else if (password.length < 6 && confirmPassword.length < 6) {
              // //   ScaffoldMessenger.of(context).showSnackBar(
              // //     const SnackBar(
              // //       content: Text("Password harus terdiri dari 6 karakter"),
              // //     ),
              // //   );
              // // }

              //                         editProfile(_nameController.text, _emailController.text, password)
              //                         }
              //                       : null,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _oldPassword.dispose();
    _newPassword.dispose();
    super.dispose();
  }
}
