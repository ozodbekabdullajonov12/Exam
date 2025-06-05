import 'package:ayol_uchun_exam/core/routing/routes.dart';
import 'package:ayol_uchun_exam/features/auth/presentation/widgets/text_container_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class EnterPhoneNumberView extends StatelessWidget {
  EnterPhoneNumberView({super.key});

  final phoneController = TextEditingController();

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
                              "O‘quv platformasiga kirish "
                              "uchun telefon raqamingizni kiriting",
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
                                "Kirish",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "SF Pro Text",
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            TextFormField(
                              controller: phoneController,
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                hintText: "90 123 45 67",
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
                                    "assets/icons/phone.svg",
                                    height: 20.h,
                                    width: 20.w,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                prefixText: '+998 ',
                                prefixStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFFADB5BD),
                                ),
                              ),
                            ),
                            SizedBox(height: 380.h),
                            TextContainerButton(
                              callback: () => context.go(Routes.confirmCode),
                              text: "Kirish",
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
