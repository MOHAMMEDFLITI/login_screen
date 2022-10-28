import 'package:flutter/material.dart';
import 'package:login_screen/shared/styles/colors.dart';

Widget defaultTextFromField({
  required TextEditingController controller,
  required TextInputType type,
  Function? onChange,
  Function? onSubmit,
  Function? onTap,
  bool isPassword = false,
  required Function validate,
  required String label,
  required IconData prefix,
  IconData? suffix,
  Function? onPress,
  bool isClickable = true,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      onFieldSubmitted: (s) {
        onSubmit!(s);
      },
      onChanged: (s) {
        onChange!(s);
      },
      onTap: () {
        onTap!();
      },
      validator: (s) {
        return validate(s);
      },
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(prefix),
        suffixIcon: suffix != null
            ? IconButton(
                icon: Icon(suffix),
                onPressed: () {
                  onPress!();
                },
              )
            : null,
        border: const OutlineInputBorder(),
        enabled: isClickable,
      ),
    );


Widget defaultButton({
  double width =double.infinity,
  Color background = defaultColor ,
  bool isUpperCase = true,
  double radius=0,
  required Function function ,
  required String text,

}) => Container(
  width: width,
  height: 40,
  decoration:BoxDecoration(
    borderRadius: BorderRadius.circular(radius),
    color: background,
  ),
  child: MaterialButton(
    onPressed: ()
    {
      function();
    },
    child: Text(
      isUpperCase ? text.toUpperCase() : text,
      style: const TextStyle(
        color: Colors.white,
      ),
    ),
  ),
);