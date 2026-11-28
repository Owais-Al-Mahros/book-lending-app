import 'package:flutter/material.dart';
import 'package:mobile/features/pages/colors.dart';

class MyTextField extends StatelessWidget {
  final String hint;
  final IconData icon;
  final bool obscure;
  final Widget? suffix;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const MyTextField({
    super.key,
    required this.hint,
    required this.icon,
    this.obscure = false,
    this.suffix,
    this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      child: TextFormField(
        controller: controller,
        validator: validator,
        obscureText: obscure,
        decoration: InputDecoration(
          filled: true,
          fillColor: MyColors.color3,
          hintText: hint,
          hintStyle: TextStyle(color: MyColors.hintColor),
          prefixIcon: Icon(icon, color: MyColors.basicColor, size: 25),
          suffixIcon: suffix,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(color: MyColors.color2, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(color: MyColors.color2, width: 3),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(color: Colors.red, width: 2),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(color: Colors.red, width: 3),
          ),
        ),
      ),
    );
  }
}

class LineText extends StatelessWidget {
  final String text;

  const LineText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(height: 1, width: 70, color: MyColors.color2),
        SizedBox(width: 5),
        Text(
          text,
          style: TextStyle(
            color: MyColors.basicColor,
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(width: 5),
        Container(height: 1, width: 70, color: MyColors.color2),
      ],
    );
  }
}
