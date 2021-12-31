import 'package:flutter/material.dart';
import 'package:notes/app/global_widgets/header.dart';
import 'package:notes/app/global_widgets/page_title.dart.dart';
import 'package:notes/app/modules/register/local_widgets/register_form.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

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
              const PageTitle(title: 'Crear \nuna cuenta'),
              RegisterForm(),
            ],
          ),
        ),
      ),
    );
  }
}
