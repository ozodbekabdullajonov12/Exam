import 'package:ayol_uchun_exam/features/home/presentation/manager/home_bloc.dart';
import 'package:ayol_uchun_exam/features/home/presentation/manager/home_state.dart';
import 'package:ayol_uchun_exam/features/home/presentation/widgets/categories_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        final categories = state.categories;
        if (state.status == HomeStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state.status == HomeStatus.error) {
          return Center(child: Text("Error"));
        }
        if (state.categories == null || state.categories.isEmpty) {
          return const Center(child: Text('Kategoriya mavjud emas'));
        }
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "KATEGORIYALAR",
                style: const TextStyle(
                  color: Color(0xFF222222),
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Open Sans',
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 10.h),
              Column(
                children: [
                  for (var i = 0; i < 8; i += 2)
                    CategoriesItem(index: i, categories: categories),
                  SizedBox(height: 10.h),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: double.infinity,
                      height: 44.h,
                      decoration: BoxDecoration(
                        color: Color(0xffFDD3DB),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Center(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Barcha kategoriyalar",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontFamily: "Open Sans",
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(width: 5.w),
                            SvgPicture.asset("assets/icons/arrow.svg"),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
