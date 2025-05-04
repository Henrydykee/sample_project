import 'package:new_project/core/presentation/widgets/text_holder.dart';
import 'package:flutter/material.dart';

import '../../platform/color.dart';


class GButton extends StatelessWidget {
  final Color? btnColor;
  final String? title;
  final VoidCallback? onTap;
  final Color? textColor;
  final bool? isDisabled;
  final double? textSize;
  final double? height;
  final double? width;
  final String? assetImage;
  final bool showBorder;

  const GButton({
    Key? key,
    this.btnColor,
    this.title,
    this.onTap,
    this.isDisabled = false,
    this.textColor,
    this.textSize,
    this.height,
    this.width,
    this.showBorder = true,
    this.assetImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool disabled = isDisabled == true;
    return GestureDetector(
      onTap: disabled ? null : () {
        FocusScope.of(context).unfocus();
        onTap?.call();
      },
      child: Container(
        height: height,
        width: width ?? double.infinity,
        decoration: BoxDecoration(
          color: disabled ? const Color(0xFFCECECE) : btnColor ?? Color(0xFF333333),
          border: Border.all(
            color: disabled ? newprojectColor.grey :  Color(0xFF333333),
            width: showBorder ?  1 : 0,
          ),
          borderRadius: BorderRadius.circular(disabled ? 63 : 63),
        ),
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Center(
          child: TextHolder(
            title: title ?? "",
            size: textSize ?? 12,
            color: disabled ? const Color(0xFF898989) : (textColor ?? Colors.white),
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}


