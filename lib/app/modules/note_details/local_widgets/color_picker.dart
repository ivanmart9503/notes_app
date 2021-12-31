import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes/app/core/theme/app_colors.dart';
import 'package:notes/app/modules/note_details/note_details_controller.dart';

class ColorPicker extends StatelessWidget {
  final controller = Get.find<NoteDetailsController>();

  ColorPicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: const Icon(EvaIcons.colorPaletteOutline),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      itemBuilder: (context) => {
        'Azul': AppColors.blue,
        'Amarillo': AppColors.yellow,
        'Rosa': AppColors.pink,
        'Gris': AppColors.grey,
      }.entries.map((e) {
        final active = controller.color.value.value == e.value.value;

        return PopupMenuItem(
          onTap: () {
            controller.color(e.value);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade800,
                      // color: active ? Colors.grey.shade800 : Colors.transparent,
                      blurRadius: active ? 10 : 0,
                      spreadRadius: active ? -5 : 0,
                    ),
                  ],
                ),
                margin: const EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 0,
                ),
                padding: const EdgeInsets.all(5),
                child: Container(
                  decoration: BoxDecoration(
                    color: e.value,
                    shape: BoxShape.circle,
                  ),
                  height: 32,
                  width: 32,
                ),
              ),
              const SizedBox(width: 10),
              Text(e.key),
            ],
          ),
        );
      }).toList(),
    );
  }
}
