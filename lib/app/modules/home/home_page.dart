import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes/app/core/theme/app_colors.dart';
import 'package:notes/app/modules/home/home_controller.dart';
import 'package:notes/app/modules/notes/notes_view.dart';
import 'package:notes/app/modules/profile/profile_view.dart';
import 'package:notes/app/routes/routes.dart';

class HomePage extends StatelessWidget {
  final controller = Get.find<HomeController>();

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller.pageController,
        onPageChanged: (index) => controller.indexPage.value = index,
        children: [
          NotesView(),
          ProfileView(),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: const Icon(EvaIcons.plus),
        onPressed: () => Get.toNamed(Routes.noteDetails, arguments: {}),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 0,
            horizontal: 20,
          ),
          child: Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildBottomItem(
                  index: 0,
                  icon: EvaIcons.gridOutline,
                  title: 'Notas',
                ),
                _buildBottomItem(
                  index: 1,
                  icon: EvaIcons.personOutline,
                  title: 'Perfil',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomItem({
    required int index,
    required IconData icon,
    required String title,
  }) {
    final active = index == controller.indexPage.value;

    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        onTap: () => controller.animateToPage(index),
        borderRadius: BorderRadius.circular(50),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                color: active ? AppColors.secondary : Colors.grey,
              ),
              const SizedBox(height: 5),
              Text(
                title,
                style: TextStyle(
                  color: active ? AppColors.secondary : Colors.grey,
                  fontWeight: active ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
