import 'package:ayol_uchun_exam/data/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routing/routes.dart';
import '../manager/home_bloc.dart';

class CategoriesItem extends StatelessWidget {
  const CategoriesItem({
    super.key,
    required this.categories,
    required this.index,
  });

  final List<CategoryModel> categories;

  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          Row(
            spacing: 10,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  final selectedCategory = categories[index];
                  context.read<HomeBloc>().add(
                    LoadCoursesByCategory("${selectedCategory.id}"),
                  );
                  context.go(Routes.courses);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  width: 160.w,
                  height: 50.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Color(0xFFFDD3DB)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            categories[index].title,
                            style: TextStyle(
                              color: Color(0xFF222222),
                              fontFamily: "Open Sans",
                              fontWeight: FontWeight.w700,
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            "Jami ${categories[index].totalCourses} ta dars",
                            style: TextStyle(
                              color: Color(0xFF8898AA),
                              fontWeight: FontWeight.w400,
                              fontFamily: "Open Sans",
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                      Image.network(
                        categories[index].icon,
                        width: 50.w,
                        height: 50.h,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  width: 160.w,
                  height: 50.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Color(0xFFFDD3DB)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            categories[index + 1].title,
                            style: TextStyle(
                              color: Color(0xFF222222),
                              fontFamily: "Open Sans",
                              fontWeight: FontWeight.w700,
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            "Jami ${categories[index + 1].totalCourses} ta dars",
                            style: TextStyle(
                              color: Color(0xFF8898AA),
                              fontWeight: FontWeight.w400,
                              fontFamily: "Open Sans",
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                      Image.network(
                        categories[index + 1].icon,
                        width: 50.w,
                        height: 50.h,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
        ],
      ),
    );
  }
}
