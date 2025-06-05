import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextContainerButton extends StatelessWidget {
  const TextContainerButton({
    super.key,
    required this.text,
    required this.callback,
  });

  final String text;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:() => callback(),
      child: Container(
        height: 43.h,
        width: 335.w,
        decoration: BoxDecoration(
          color: Color(0xFFF5365C),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              fontFamily: "SF Pro Text",
            ),
          ),
        ),
      ),
    );
  }
}
