import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeMyCourses extends StatelessWidget {
  const HomeMyCourses({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 210.h,
      width: double.infinity,
      child: Column(
        children: [
          SvgPicture.asset(
            "assets/icons/ayol_uchun_logo.svg",
            width: 57.w,
            height: 48.h,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 15),
            child: Text(
              textAlign: TextAlign.center,
              "Sizda hali boshlangan kurs mavjud emas."
              " Ko‘plab foydali kurslarimiz "
              "orasidan bittasini tanlang.",
              style: TextStyle(
                color: Color(0xFF222222),
                fontSize: 16,
                fontWeight: FontWeight.w600,
                fontFamily: "Open Sans",
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              width: 150.w,
              height: 34.h,
              decoration: BoxDecoration(
                color: Color(0xFFF5365C),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  "Kurs sotib olish",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Open Sans",
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
