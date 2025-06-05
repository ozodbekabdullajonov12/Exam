import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../manager/login/login_bloc.dart';
import '../manager/login/login_state.dart';

class AyolUchunTextFormField extends StatelessWidget {
  const AyolUchunTextFormField({
    super.key,
    required this.bloc,
    required this.hintText,
    required this.svg,
    required this.errorMessage
  });

  final LoginBloc bloc;
  final String hintText;
  final String svg, errorMessage;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) => TextFormField(
        controller: bloc.passwordController,
        obscureText: state.showPassword,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: hintText,
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: IconButton(
              onPressed: () {
                context.read<LoginBloc>().add(ShowPassword());
              },
              icon: SvgPicture.asset(
                svg,
                height: 20.h,
                width: 20.w,
                fit: BoxFit.cover,
              ),
            ),
          ),
          suffixIcon: IconButton(
            icon: Icon(
              state.showPassword ? Icons.visibility_off : Icons.visibility,
            ),
            onPressed: () {},
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return errorMessage;
          }
          return null;
        },
      ),
    );
  }
}
