import 'package:flutter/material.dart';

class UserReg extends StatefulWidget {
  const UserReg({super.key});

  @override
  State<UserReg> createState() => _UserRegState();
}

class _UserRegState extends State<UserReg> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.symmetric(horizontal: 32),
        width: double.infinity,
        child: Column(children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          Image.asset('assets/himan.png')
        ]),
      ),
    )));
  }
}
