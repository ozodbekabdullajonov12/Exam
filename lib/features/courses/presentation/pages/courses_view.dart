import 'package:ayol_uchun_exam/features/home/presentation/pages/ayol_uchun_bottom_navigation_bar.dart';
import 'package:ayol_uchun_exam/features/home/presentation/widgets/ayol_uchun_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../home/presentation/manager/home_bloc.dart';
import '../../../home/presentation/manager/home_state.dart';

class CoursesPage extends StatelessWidget {
  const CoursesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AyolUchunAppBar(title: "Kurslar"),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          final courses = state.courses;
          if (state.status == HomeStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (courses == null || courses.isEmpty) {
            return const Center(child: Text("Kurslar topilmadi"));
          }
          return ListView.builder(
            itemCount: courses.length,
            itemBuilder: (context, index) {
              return Center(
                child: Container(
                  margin: EdgeInsets.only(bottom: 20.h),
                  height: 294.h,
                  width: 335.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withValues(alpha: 0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Image.network(
                              "${courses[index].image}",
                              width: 335.w,
                              height: 164.h,
                              fit: BoxFit.cover,
                            ),
                            Positioned(
                              top: 8,
                              left: 8,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 8.w,
                                  vertical: 4.h,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Row(
                                  spacing: 5,
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                      size: 12.sp,
                                    ),
                                    Text(
                                      "${courses[index].rating}",
                                      style: TextStyle(
                                        color: Color(0xff222222),
                                        fontSize: 12,
                                        fontFamily: "Open Sans",
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "${courses[index].category}",
                                      style: TextStyle(
                                        color: Color(
                                          0xff222222,
                                        ).withValues(alpha: 0.2),
                                        fontFamily: "Open Sans",
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              top: 8,
                              right: 8,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 8.w,
                                  vertical: 4.h,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.amber.withValues(alpha: 0.6),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Row(
                                  children: [
                                    SizedBox(width: 4.w),
                                    Text(
                                      "${courses[index].status}",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12.w,
                            vertical: 6.h,
                          ),
                          child: Text(
                            "${courses[index].title}",
                            style: const TextStyle(
                              color: Color(0xff172B4D),
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              fontFamily: "Open Sans",
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12.w),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                "assets/icons/profile_circle.svg",
                              ),
                              SizedBox(width: 5.w),
                              Text(
                                "${courses[index].user}",
                                style: const TextStyle(
                                  color: Color(0xff8898AA),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Open Sans",
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset("assets/icons/cash.svg"),
                                  SizedBox(width: 4.w),
                                  Text(
                                    "${courses[index].price} UZS",
                                    style: const TextStyle(
                                      color: Color(0xff525F7F),
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                      fontFamily: "Open Sans",
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                height: 28,
                                width: 28,
                                decoration: BoxDecoration(
                                  color: Color(0xffFFE9ED),
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                child: Center(
                                  child: SvgPicture.asset(
                                    "assets/icons/arrow.svg",
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10.h),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
      bottomNavigationBar: AyolUchunBottomNavigationBar(),
    );
  }
}
