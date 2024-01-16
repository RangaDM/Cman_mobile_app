import 'package:c_man_mobapp/screens/auth/user_reg_screen.dart';
import 'package:c_man_mobapp/widgets/button.dart';
import 'package:c_man_mobapp/widgets/textfield.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.06,
            ),
            Image.asset(
              'assets/logoyellow.png',
              height: 150,
            ),
            const SizedBox(
              height: 35,
            ),

            // email
            TextInputField(
              controller: _emailcontroller,
              isPassword: false,
              inputkeyboardType: TextInputType.emailAddress,
              hintText: "Enter Email",
            ),
            const SizedBox(
              height: 35,
            ),

            // password
            TextInputField(
              controller: _passwordcontroller,
              isPassword: true,
              inputkeyboardType: TextInputType.emailAddress,
              hintText: "Enter Email",
            ),
            const SizedBox(
              height: 35,
            ),

            SubmitButton(text: "Log in", onPressed: () {}),
            const SizedBox(
              height: 35,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Don\'t have an account?',
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
                          builder: (context) => const UserReg(),
                        ));
                  },
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Colors.yellow,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    )));
  }
}
