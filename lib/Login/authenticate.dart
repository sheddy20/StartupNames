import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:startUp/Auth/login.dart';
import 'package:startUp/widgets/random.dart';

class Authenticate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firbaseUser = context.watch<User>();
    if (firbaseUser != null) {
      return RandomWords();
    }
    return LoginPage();
  }
}
