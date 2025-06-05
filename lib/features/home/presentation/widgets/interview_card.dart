import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../data/models/interview_model.dart';

class InterviewCard extends StatelessWidget {
  final InterviewModel interview;

  const InterviewCard({super.key, required this.interview});

  String formatDuration(int minutes) {
    final hours = minutes ~/ 60;
    final remainingMinutes = minutes % 60;

    if (hours > 0 && remainingMinutes > 0) {
      return '$hours soat $remainingMinutes daqiqa';
    } else if (hours > 0) {
      return '$hours soat';
    } else {
      return '$remainingMinutes daqiqa';
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 228.w,
      margin: EdgeInsets.only(right: 12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],

      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            child: Image.network(
              interview.image,
              width: 228.w,
              height: 140.h,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              spacing: 10,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SvgPicture.asset("assets/icons/clock.svg"),
                    SizedBox(width: 8.w),
                    Text(
                      formatDuration(interview.duration),
                      style: TextStyle(
                        color: Color(0xff555555),
                        fontSize: 14.sp,
                        fontFamily: "Open Sans",
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                Text(
                  interview.title,
                  style: TextStyle(
                    color: Color(0xff172B4D),
                    fontFamily: "Open Sans",
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                Row(
                  children: [
                    SvgPicture.asset("assets/icons/profile_circle.svg"),
                    Text(
                      interview.user,
                      style: TextStyle(
                        color: Color(0xff8898AA),
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Open Sans",
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
