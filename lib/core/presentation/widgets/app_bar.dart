import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../utils/navigation_service.dart'; // adjust this import if needed

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onBackTap;
  final Color backgroundColor;
  final String backIconPath;
  final double elevation;

  const CustomAppBar({
    Key? key,
    this.onBackTap,
    this.backgroundColor = Colors.white,
    this.backIconPath = "assets/svg/back_icon.svg",
    this.elevation = 0.0,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: elevation,
      backgroundColor: backgroundColor,
      leading: GestureDetector(
        onTap: onBackTap ?? router.pop,  // fallback if no custom function is passed
        child: SvgPicture.asset(
          backIconPath,
          fit: BoxFit.scaleDown,
        ),
      ),
    );
  }
}
