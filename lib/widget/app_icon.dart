import 'package:flutter/cupertino.dart';

class AppIcon extends StatelessWidget {
  final IconData icon;
  final Color backgroundcolor;
  final Color iconColor;
  final double size;
  AppIcon({
    Key? key,
    required this.icon,
    this.backgroundcolor = const Color(0xfffcf4e4),
    this.iconColor = const Color.fromRGBO(191, 134, 143, 30),
    this.size = 40,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size / 2),
        color: backgroundcolor,
      ),
      child: Icon(
        icon,
        color: iconColor,
        size: 16,
      ),
    );
  }
}
