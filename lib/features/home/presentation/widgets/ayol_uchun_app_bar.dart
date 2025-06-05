import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AyolUchunAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AyolUchunAppBar({super.key,required this.title});
  final String title;

  @override
  Size get preferredSize => const Size.fromHeight(153);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4,
      color: Colors.transparent,
      child: ClipPath(
        clipper: OvalBottomClipper(),
        child: Container(
          height: preferredSize.height,
          decoration: const BoxDecoration(
            color: Color(0xFFF5365C),
          ),
          child: SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Salom, $title🌸",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: SvgPicture.asset(
                    "assets/icons/notification.svg",
                    height: 24,
                    width: 24,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class OvalBottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height -30);
    path.quadraticBezierTo(
      size.width / 2,
      size.height,
      size.width,
      size.height - 30,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
