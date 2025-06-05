import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ConfirmCodeView extends StatefulWidget {
  final String? toastMessage;

  const ConfirmCodeView({super.key, this.toastMessage});

  @override
  State<ConfirmCodeView> createState() => _ConfirmCodeViewState();
}

class _ConfirmCodeViewState extends State<ConfirmCodeView> {
  @override
  void initState() {
    super.initState();
    if (widget.toastMessage?.isNotEmpty == true) {
      Future.delayed(Duration(seconds: 10), () {
        Fluttertoast.showToast(
          msg: widget.toastMessage!,
        );
      });
    }
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
                              'O‘quv platformasiga kirish uchun quyida telefon'
                              ' raqamingizga yuborilgan tasdiqlash kodini kiriting',
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
                                "Tasdiqlash kodi",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "SF Pro Text",
                                ),
                              ),
                            ),
                            SizedBox(height: 10.h),
                            Pinput(length: 6, defaultPinTheme: defaultPinTheme),
                            SizedBox(height: 470),
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                height: 43.h,
                                width: 335.w,
                                decoration: BoxDecoration(
                                  color: Color(0xFFF5365C),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Center(
                                  child: Text(
                                    "Kirish",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "SF Pro Text",
                                    ),
                                  ),
                                ),
                              ),
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

final defaultPinTheme = PinTheme(
  width: 50.w,
  height: 50.h,
  textStyle: TextStyle(
    fontSize: 26,
    color: Color(0xFF172B4D),
    fontWeight: FontWeight.w600,
  ),
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(4),
  ),
);
