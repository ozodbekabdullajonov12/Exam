import 'package:ayol_uchun_exam/data/models/interview_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'interview_card.dart';
class InterviewList extends StatelessWidget {
  final List<InterviewModel> interviews;

  const InterviewList({super.key, required this.interviews});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Text(
            "INTERVYULAR",
            style: TextStyle(
              color: Color(0xff222222),
              fontSize: 18.sp,
              fontFamily: "Open Sans",
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        SizedBox(height: 20.h),
        SizedBox(
          height: 251.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: interviews.length,
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            itemBuilder: (context, index) {
              return InterviewCard(interview: interviews[index]);
            },
          ),
        ),
      ],
    );
  }
}


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
