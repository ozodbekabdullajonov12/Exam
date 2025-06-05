import 'package:ayol_uchun_exam/features/auth/presentation/widgets/ayol_uchun_tect_form_field.dart';
import 'package:ayol_uchun_exam/features/auth/presentation/widgets/number_text_form_field.dart';
import 'package:ayol_uchun_exam/features/auth/presentation/widgets/text_container_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routing/routes.dart';
import '../manager/login/login_bloc.dart';
import '../manager/login/login_state.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      body: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          final bloc = context.read<LoginBloc>();
          return Stack(
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
                        child: Form(
                          key: bloc.formKey,
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
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 24,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    "O'quv platformasiga kirish uchun quyida"
                                    " elektron pochtangiz va parolingizni kiriting",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                    ),
                                  ),
                                  SizedBox(height: 50.h),
                                  NumberTextFormField(bloc: bloc,svg: "assets/icons/phone.svg",),
                                  SizedBox(height: 10),
                                  AyolUchunTextFormField(
                                    bloc: bloc,
                                    hintText: "parol",
                                    errorMessage: "Parolni kiriting",
                                    svg: "assets/icons/password.svg",
                                  ),
                                  SizedBox(height: 8),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Parolni unutdingizmi?',
                                      style: TextStyle(
                                        color: Color(0xFFCED4DA),
                                        fontSize: 13,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 270.h),
                                  TextContainerButton(
                                    text: "Kirish",
                                    callback: () => bloc.add(LoginUser()),
                                  ),
                                  SizedBox(height: 10.h),
                                  GestureDetector(
                                    onTap: () {
                                      context.go(Routes.signUp);
                                    },
                                    child: Container(
                                      height: 43.h,
                                      decoration: BoxDecoration(
                                        color: Color(0xFF3F5170),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Ro'yxatdan o'tish",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
