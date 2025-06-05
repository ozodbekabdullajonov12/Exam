import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routing/routes.dart';

class AyolUchunBottomNavigationBar extends StatelessWidget {
  const AyolUchunBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 90.h,
      decoration: BoxDecoration(color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            icon: SvgPicture.asset("assets/icons/home.svg"),
            onPressed: () {context.go(Routes.home);},
          ),
          IconButton(
            icon: SvgPicture.asset("assets/icons/course.svg"),
            onPressed: () {context.go(Routes.courses);},
          ),
          IconButton(
            icon: SvgPicture.asset("assets/icons/blog.svg"),
            onPressed: () {},
          ),
          IconButton(
            icon: SvgPicture.asset("assets/icons/account.svg"),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
