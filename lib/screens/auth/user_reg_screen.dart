import 'package:c_man_mobapp/utils/colors.dart';
import 'package:c_man_mobapp/widgets/button.dart';
import 'package:c_man_mobapp/widgets/textfield.dart';
import 'package:flutter/material.dart';

class UserReg extends StatefulWidget {
  const UserReg({super.key});

  @override
  State<UserReg> createState() => _UserRegState();
}

class _UserRegState extends State<UserReg> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _contctController = TextEditingController();

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
              CircleAvatar(
                radius: 35,
                backgroundColor: secondaryColor,
                backgroundImage: const NetworkImage(
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
            inputkeyboardType: TextInputType.emailAddress,
            hintText: 'Enter a password',
          ),
          const SizedBox(
            height: 15,
          ),

          // username
          TextInputField(
            controller: _usernameController,
            isPassword: false,
            inputkeyboardType: TextInputType.emailAddress,
            hintText: 'Username',
          ),
          const SizedBox(
            height: 15,
          ),

          // Address
          TextInputField(
            controller: _addressController,
            isPassword: false,
            inputkeyboardType: TextInputType.emailAddress,
            hintText: 'Enter your address',
          ),
          const SizedBox(
            height: 15,
          ),

          // contact number
          TextInputField(
            controller: _contctController,
            isPassword: false,
            inputkeyboardType: TextInputType.emailAddress,
            hintText: 'Enter your contact number',
          ),
          const SizedBox(
            height: 15,
          ),

          // submit button
          SubmitButton(
            onPressed: () {},
            text: 'Register',
          ),
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
                  Navigator.pushNamed(context, '/login');
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
