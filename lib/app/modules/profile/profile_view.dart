import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:get/get.dart';
import 'package:notes/app/core/theme/app_colors.dart';
import 'package:notes/app/modules/profile/local_widgets/avatar.dart';
import 'package:notes/app/modules/profile/profile_controller.dart';

class ProfileView extends StatelessWidget {
  final controller = Get.find<ProfileController>();

  ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Text(
                  'Mi perfil',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                  ),
                ),
              ),
              Avatar(),
              const SizedBox(height: 40),
              const Text(
                'NOMBRE',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                controller.user.value.name,
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'USUARIO',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                controller.user.value.name,
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'CORREO',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                controller.user.value.email,
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              // const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 80),
                child: Align(
                  child: TextButton.icon(
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: Colors.red.shade400,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.all(10),
                    ),
                    icon: const Icon(EvaIcons.powerOutline, size: 20),
                    label: const Text('Cerrar sesión'),
                    onPressed: () {
                      controller.logout(context);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
