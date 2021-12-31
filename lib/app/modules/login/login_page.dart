import 'package:flutter/material.dart';
import 'package:notes/app/modules/login/local_widgets/login_form.dart';
import 'package:notes/app/global_widgets/header.dart';
import 'package:notes/app/global_widgets/page_title.dart.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Header(),
              const PageTitle(title: 'Inicio \nde sesión'),
              LoginForm(),
            ],
          ),
        ),
      ),
    );
  }
}
