import 'package:ayol_uchun_exam/features/home/presentation/manager/home_bloc.dart';
import 'package:ayol_uchun_exam/features/home/presentation/manager/home_state.dart';
import 'package:ayol_uchun_exam/features/home/presentation/pages/ayol_uchun_bottom_navigation_bar.dart';
import 'package:ayol_uchun_exam/features/home/presentation/widgets/ayol_uchun_app_bar.dart';
import 'package:ayol_uchun_exam/features/home/presentation/widgets/categories.dart';
import 'package:ayol_uchun_exam/features/home/presentation/widgets/home_my_courses.dart';
import 'package:ayol_uchun_exam/features/home/presentation/widgets/interview.dart';
import 'package:ayol_uchun_exam/features/home/presentation/widgets/social_network.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(HomeLoading());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AyolUchunAppBar(title: "Mohinur"),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          final socialAcc = state.socialAccounts;
          final interviews = state.interviews;
          if (state.status == HomeStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.status == HomeStatus.error) {
            return Center(child: Text("Error"));
          }
          if (state.categories == null || state.categories.isEmpty) {
            return const Center(child: Text('Kategoriya mavjud emas'));
          }
          return Container(
            color: const Color(0xFFFBF2F4),
            child: ListView(
              children: [
                const HomeMyCourses(),
                SizedBox(height: 30.h),
                Categories(),
                SizedBox(height: 30.h),
                SocialNetwork(socialAcc: socialAcc),
                InterviewList(interviews: interviews),
                SizedBox(height: 30.h),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: AyolUchunBottomNavigationBar(),
    );
  }
}
