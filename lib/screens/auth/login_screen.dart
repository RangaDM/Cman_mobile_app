import 'package:c_man_mobapp/screens/auth/cman_profile.dart';
import 'package:c_man_mobapp/screens/auth/user_reg_screen.dart';
import 'package:c_man_mobapp/services/auth_service.dart';
import 'package:c_man_mobapp/utils/colors.dart';
import 'package:c_man_mobapp/widgets/button.dart';
import 'package:c_man_mobapp/widgets/textfield.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isLoaging = false;

  //auth logic instance
  final AuthMethodes _authMethodes = AuthMethodes();

  //login the user
  void loginUser() async {
    setState(() {
      isLoaging = true;
    });
    final String email = _emailController.text.trim();
    final String password = _passwordController.text.trim();

    String result = await _authMethodes.loginWithEmailAndPassword(
      email: email,
      password: password,
    );

    //show the snak bar if the user is created or not

    if (result == "success") {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>
              const CmanProfile(uid: "QPdEVAiLhuaZGqRWCsv9RdWTYVh2"),
        ),
      );
    } else {
      setState(() {
        isLoaging = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(result),
        ),
      );
    }

    setState(() {
      isLoaging = false;
    });

    print("user logged in");
  }

  @override
  void dispose() {
    super.dispose();
    //dispose the controllers
    _emailController.dispose();
    _passwordController.dispose();
  }

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
                  height: 64,
                ),

                //text feild for email
                TextInputField(
                  hintText: 'Enter Email',
                  controller: _emailController,
                  isPassword: false,
                  inputkeyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 15,
                ),
                //text feild for password
                TextInputField(
                  hintText: 'Enter Password',
                  controller: _passwordController,
                  isPassword: true,
                  inputkeyboardType: TextInputType.visiblePassword,
                ),
                //button for login
                const SizedBox(
                  height: 30,
                ),
                isLoaging
                    ? const CircularProgressIndicator(
                        color: primaryColor,
                      )
                    : SubmitButton(
                        text: 'Log in',
                        onPressed: loginUser,
                      ),
                //button for signup to navigate to signup screen
                const SizedBox(
                  height: 100,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Don\'t have an account?',
                      style: TextStyle(color: Colors.white),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const UserReg(),
                          ),
                        );
                      },
                      child: const Text(
                        'Sign up.',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
