import 'dart:typed_data';

import 'package:c_man_mobapp/screens/auth/login_screen.dart';
import 'package:c_man_mobapp/utils/colors.dart';
import 'package:c_man_mobapp/widgets/button.dart';
import 'package:c_man_mobapp/widgets/textfield.dart';
import 'package:flutter/material.dart';

class CmanRegScn extends StatefulWidget {
  const CmanRegScn({super.key});

  @override
  State<CmanRegScn> createState() => _CmanRegScnState();
}

class _CmanRegScnState extends State<CmanRegScn> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _stdnameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _contctController = TextEditingController();
  Uint8List? _profileImage;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.symmetric(horizontal: 32),
        width: double.infinity,
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Container(
            // padding: EdgeInsets.only(right: 40),
            height: MediaQuery.of(context).size.height * 0.06,
          ),
          Image.asset(
            'assets/logoyellow.png',
            height: 150,
          ),
          const SizedBox(
            height: 35,
          ),
          Stack(
            children: [
              const CircleAvatar(
                radius: 35,
                backgroundColor: secondaryColor,
                backgroundImage: NetworkImage(
                    'https://plus.unsplash.com/premium_photo-1664870883044-0d82e3d63d99?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
              ),
              Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        color: Colors.black38,
                        borderRadius: BorderRadiusDirectional.circular(30)),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.add_a_photo),
                      color: Colors.yellow.shade600,
                    ),
                  )),
            ],
          ),
          const SizedBox(
            height: 30,
          ),

          // email
          TextInputField(
            controller: _emailController,
            isPassword: false,
            inputkeyboardType: TextInputType.emailAddress,
            hintText: 'Enter your email',
          ),
          const SizedBox(
            height: 15,
          ),

          // password
          TextInputField(
            controller: _passwordController,
            isPassword: true,
            inputkeyboardType: TextInputType.visiblePassword,
            hintText: 'Enter a password',
          ),
          const SizedBox(
            height: 15,
          ),

          // username
          TextInputField(
            controller: _usernameController,
            isPassword: false,
            inputkeyboardType: TextInputType.name,
            hintText: 'Username',
          ),
          const SizedBox(
            height: 15,
          ),

          // Studio Name
          TextInputField(
            controller: _stdnameController,
            isPassword: false,
            inputkeyboardType: TextInputType.name,
            hintText: 'Studio Name',
          ),
          const SizedBox(
            height: 15,
          ),

          // Address
          TextInputField(
            controller: _addressController,
            isPassword: false,
            inputkeyboardType: TextInputType.text,
            hintText: 'Enter your address',
          ),
          const SizedBox(
            height: 15,
          ),

          // contact number
          TextInputField(
            controller: _contctController,
            isPassword: false,
            inputkeyboardType: TextInputType.text,
            hintText: 'Enter a contact number',
          ),
          const SizedBox(
            height: 15,
          ),

          // submit button
          SubmitButton(text: "Register", onPressed: () {}),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Already have an account?',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ));
                },
                child: const Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.yellow,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          )
        ]),
      ),
    )));
  }
}
