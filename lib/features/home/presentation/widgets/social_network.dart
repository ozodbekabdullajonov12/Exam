import 'package:ayol_uchun_exam/data/models/social_media_model.dart';
import 'package:ayol_uchun_exam/features/home/presentation/widgets/social_url_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SocialNetwork extends StatelessWidget {
  const SocialNetwork({super.key,required this.socialAcc});
  final List<SocialMediaModel> socialAcc;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 210.h,
      decoration: BoxDecoration(color: Colors.white),
      child: Center(
        child: Container(
          padding: EdgeInsets.all(10),
          width: 335.w,
          height: 115.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.2),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(2, 3),
              ),
            ],
          ),
          child: Column(
            spacing: 10,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Bizning ijtimoiy tarmoqlarimiz",
                style: TextStyle(
                  color: Color(0xff060C13),
                  fontWeight: FontWeight.w700,
                  fontFamily: "Open Sans",
                  fontSize: 20,
                ),
              ),
              ///List.generate ishlatilmagani sababi colorda
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SocialUrlButton(
                    color: Color(0xffF00073),
                    svg: socialAcc[0].icon,
                    url: socialAcc[0].link,
                  ),
                  SocialUrlButton(
                    color: Color(0xff222222),
                    svg: socialAcc[1].icon,
                    url: socialAcc[1].link,
                  ),
                  SocialUrlButton(
                    color: Color(0xffFF0000),
                    svg: socialAcc[2].icon,
                    url: socialAcc[2].link,
                  ),
                  SocialUrlButton(
                    color: Color(0xff0088CC),
                    svg: socialAcc[3].icon,
                    url: socialAcc[3].link,
                  ),
                  SocialUrlButton(
                    color: Color(0xff1877F2),
                    svg: socialAcc[4].icon,
                    url: socialAcc[4].link,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
