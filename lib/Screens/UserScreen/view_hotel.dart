import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


class view_hotel extends StatelessWidget {
  static var routeName;

  const view_hotel({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      child: SingleChildScrollView(
        child:Row(
          children: [
            const SizedBox(
              width: 8,
            ),
            for(int i= 0; i < 3; i++) const view_hotel()
          ],
        )
        ),
    );
  }
}

