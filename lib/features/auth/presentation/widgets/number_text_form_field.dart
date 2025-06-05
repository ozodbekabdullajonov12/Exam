import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../manager/login/login_bloc.dart';

class NumberTextFormField extends StatelessWidget {
  const NumberTextFormField({super.key, required this.bloc,required this.svg});

  final LoginBloc bloc;
  final String svg;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: bloc.phoneNumController,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: "90 123 45 67",
        prefixText: '+998',
        enabled: true,
        prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: SvgPicture.asset(
            svg,
            height: 20.h,
            width: 20.w,
            fit: BoxFit.cover,
          ),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Telefon raqamini kiriting';
        }
        return null;
      },
    );
  }
}
