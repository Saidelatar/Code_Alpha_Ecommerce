// ignore: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:music_notes_player_app_setup/const.dart';

class ForgetPasswordPage extends StatelessWidget {
  const ForgetPasswordPage({super.key});
  static const String id = 'ForgetPasswordPage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        height: 300,
        width: 300,
        color: colorBase,
        child: const Text(
          'Forget Password Page',
          style: TextStyle(fontSize: 30),
        ),
      ),
    ));
  }
}
