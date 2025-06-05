import 'package:ayol_uchun_exam/core/routing/routes.dart';
import 'package:ayol_uchun_exam/features/auth/presentation/widgets/text_container_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _LoginViewState();
}

class _LoginViewState extends State<SignUpView> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset('assets/images/background.png', fit: BoxFit.cover),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SafeArea(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return SingleChildScrollView(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom + 20,
                      top: 20,
                    ),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: constraints.maxHeight - 40,
                      ),
                      child: IntrinsicHeight(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            SizedBox(height: 50.h),
                            Center(
                              child: Text(
                                "Xush kelibsiz!",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "SF Pro Text",
                                ),
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              "O'quv platformasiga kirish uchun quyida "
                              "berilgan maydonlarni to'ldirib ro'yxatdan o'ting",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: "SF Pro Text",
                                fontWeight: FontWeight.w400,
                                fontSize: 13,
                              ),
                            ),
                            SizedBox(height: 50.h),
                            Center(
                              child: Text(
                                "Ro'yxatdan o'tish",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "SF Pro Text",
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            TextFormField(
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                hintText: "Ism",
                                hintStyle: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: Color(0xFFADB5BD),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                prefixIconConstraints: BoxConstraints(
                                  minHeight: 20,
                                  minWidth: 20,
                                  maxHeight: 24,
                                  maxWidth: 40,
                                ),
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0,
                                  ),
                                  child: SvgPicture.asset(
                                    "assets/icons/profile.svg",
                                    height: 20.h,
                                    width: 20.w,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            TextFormField(
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                hintText: "Familya",
                                hintStyle: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: Color(0xFFADB5BD),
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xff32325d26),
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                prefixIconConstraints: BoxConstraints(
                                  minHeight: 20,
                                  minWidth: 20,
                                  maxHeight: 24,
                                  maxWidth: 40,
                                ),
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0,
                                  ),
                                  child: SizedBox(
                                    child: SvgPicture.asset(
                                      "assets/icons/profile.svg",
                                      height: 20.h,
                                      width: 20.w,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 8),
                            TextFormField(
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                hintText: "Familya",
                                hintStyle: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: Color(0xFFADB5BD),
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xff32325d26),
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                prefixIconConstraints: BoxConstraints(
                                  minHeight: 20,
                                  minWidth: 20,
                                  maxHeight: 24,
                                  maxWidth: 40,
                                ),
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0,
                                  ),
                                  child: SizedBox(
                                    child: SvgPicture.asset(
                                      "assets/icons/email.svg",
                                      height: 20.h,
                                      width: 20.w,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Parolni unutdingizmi?',
                                style: TextStyle(
                                  color: Color(0xFFCED4DA),
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Open Sans",
                                ),
                              ),
                            ),
                            SizedBox(height: 130.h),
                            Divider(color: Colors.white),
                            SizedBox(height: 15.h),
                            Center(
                              child: Text(
                                textAlign: TextAlign.center,
                                "Tizimga kirish orqali siz foydalanish shartlari"
                                " va maxfiylik siyosatiga roziligingizni tasdiqlaysiz ",
                                style: TextStyle(
                                  color: Color(0xFF8898AA),
                                  fontFamily: "Open Sans",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            SizedBox(height: 15.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    width: 163.w,
                                    height: 44.h,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Center(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset(
                                            "assets/icons/google.svg",
                                          ),
                                          SizedBox(width: 5),
                                          Text(
                                            "Google",
                                            style: TextStyle(
                                              color: Color(0xFF172B4D),
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14,
                                              fontFamily: "Open Sans",
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    width: 163.w,
                                    height: 44.h,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Center(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset(
                                            "assets/icons/Apple.svg",
                                          ),
                                          SizedBox(width: 5),
                                          Text(
                                            "Apple",
                                            style: TextStyle(
                                              color: Color(0xFF172B4D),
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14,
                                              fontFamily: "Open Sans",
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10.h),
                            TextContainerButton(
                              text: "Davom Etish",
                              callback: () => context.go(Routes.enterPhoneNum),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
