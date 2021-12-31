import 'package:email_validator/email_validator.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes/app/global_widgets/footer.dart';
import 'package:notes/app/modules/login/login_controller.dart';
import 'package:notes/app/routes/routes.dart';

class LoginForm extends StatelessWidget {
  final _controller = Get.find<LoginController>();

  LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            blurRadius: 16,
            spreadRadius: -5,
            color: Colors.black12,
            offset: Offset(3, 3),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 30,
      ),
      child: Form(
        key: _controller.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 10, bottom: 20),
              child: Text(
                '¡Hola, que gusto tenerte de vuelta!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: TextFormField(
                controller: _controller.emailCtrl,
                autocorrect: false,
                keyboardType: TextInputType.emailAddress,
                textCapitalization: TextCapitalization.none,
                decoration: InputDecoration(
                  hintText: 'Correo',
                  icon: Icon(
                    EvaIcons.emailOutline,
                    color: Colors.grey.shade500,
                  ),
                ),
                validator: (value) {
                  final validEmail = EmailValidator.validate(value ?? '');

                  if (!validEmail) {
                    return '¡No dejes este campo vacío!';
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Obx(
                () => TextFormField(
                  controller: _controller.passCtrl,
                  autocorrect: false,
                  textCapitalization: TextCapitalization.none,
                  obscureText: !_controller.showPassword.value,
                  decoration: InputDecoration(
                    hintText: 'Contraseña',
                    icon: Icon(
                      EvaIcons.lockOutline,
                      color: Colors.grey.shade500,
                    ),
                    suffixIcon: GestureDetector(
                      onTap: _controller.showHidePassword,
                      child: Icon(
                        _controller.showPassword.value
                            ? EvaIcons.eyeOff2Outline
                            : EvaIcons.eyeOutline,
                        color: Colors.grey.shade500,
                      ),
                    ),
                  ),
                  validator: (value) {
                    final validPassword = value != null && value.length >= 6;

                    if (!validPassword) {
                      return 'La contraseña debe contener 6 caracteres o más';
                    }
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Obx(
                () => TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    padding: const EdgeInsets.all(20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: !_controller.loginInProgress.value
                      ? const Text('Entrar')
                      : const SizedBox(
                          height: 24,
                          width: 24,
                          child: CircularProgressIndicator(
                            strokeWidth: 2.5,
                            valueColor: AlwaysStoppedAnimation(
                              Colors.white,
                            ),
                          ),
                        ),
                  onPressed: () async {
                    if (!_controller.loginInProgress.value) {
                      await _controller.login();
                    }
                  },
                ),
              ),
            ),
            Footer(
              text: '¿No tienes una cuenta? ',
              clickableText: 'Regístrate aquí',
              onTap: () => Get.offNamed(Routes.register),
            ),
          ],
        ),
      ),
    );
  }
}
