import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes/app/core/constants/constants.dart';
import 'package:notes/app/core/theme/app_colors.dart';
import 'package:notes/app/modules/profile/profile_controller.dart';

class Avatar extends StatelessWidget {
  final controller = Get.find<ProfileController>();

  Avatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Obx(
      () => Align(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: CircleAvatar(
            backgroundImage: AssetImage(controller.avatar.value),
            backgroundColor: AppColors.secondary,
            maxRadius: 80,
            child: Stack(
              children: [
                Align(
                  alignment: const Alignment(1.25, 1.1),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 8,
                      primary: Colors.grey.shade900,
                      onPrimary: Colors.white,
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(15),
                    ),
                    child: const Icon(
                      EvaIcons.cameraOutline,
                    ),
                    onPressed: () {
                      Get.dialog(
                        AlertDialog(
                          scrollable: true,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          title: const Text('Escoge un avatar'),
                          content: SizedBox(
                            width: width,
                            height: height * 0.5,
                            child: GridView.count(
                              crossAxisCount: 2,
                              childAspectRatio: width / (height * 0.5),
                              crossAxisSpacing: 30,
                              mainAxisSpacing: 30,
                              children: [
                                maleAvatar1,
                                maleAvatar2,
                                femaleAvatar1,
                                femaleAvatar2
                              ].map((avatar) {
                                return GestureDetector(
                                  onTap: () {
                                    controller.updateAvatar(avatar);
                                    Get.back();
                                  },
                                  child: Align(
                                    child: CircleAvatar(
                                      backgroundImage: AssetImage(avatar),
                                      maxRadius: 64,
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                          actions: [
                            TextButton(
                              style: TextButton.styleFrom(
                                primary: AppColors.secondary,
                              ),
                              child: const Text('Cancelar'),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
