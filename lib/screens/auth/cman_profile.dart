import 'package:flutter/material.dart';

class CmanProfile extends StatefulWidget {
  const CmanProfile({super.key});

  @override
  State<CmanProfile> createState() => _CmanProfileState();
}

class _CmanProfileState extends State<CmanProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: SingleChildScrollView()),
    );
  }
}
