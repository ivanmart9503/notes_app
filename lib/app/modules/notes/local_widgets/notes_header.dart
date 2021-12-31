import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes/app/modules/home/home_controller.dart';
import 'package:notes/app/modules/profile/profile_controller.dart';

class NotesHeader extends StatelessWidget {
  final homeCtrl = Get.find<HomeController>();
  final profileCtrl = Get.find<ProfileController>();

  NotesHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Mis notas',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 26,
              ),
            ),
            const SizedBox(height: 2.5),
            Text(
              profileCtrl.user.value.name,
              textAlign: TextAlign.left,
              style: const TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
          ],
        ),
        Obx(
          () => GestureDetector(
            onTap: () {
              homeCtrl.animateToPage(1);
            },
            child: CircleAvatar(
              backgroundImage: AssetImage(profileCtrl.avatar.value),
              maxRadius: 24,
            ),
          ),
        )
      ],
    );
  }
}
