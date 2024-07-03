import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_pallete.dart';

class AuthGridentButton extends StatelessWidget {
  final String ButtonText ;
  const AuthGridentButton({super.key, required this.ButtonText});

  @override
  Widget build(BuildContext context) {
    return Container(
    decoration: BoxDecoration(
      gradient: const LinearGradient(
        colors: [AppPallete.gradient1, AppPallete.gradient3],
        begin: Alignment.bottomLeft,
        end: Alignment.topRight
      ),
      borderRadius: BorderRadius.circular(10)
    ),
      child: ElevatedButton(
        onPressed: (){},
        style: ElevatedButton.styleFrom(
          backgroundColor: AppPallete.transparentColor,
         fixedSize: const Size(390, 50),
          shadowColor: AppPallete.transparentColor
        ),
        child: Text ("$ButtonText",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600
        ),
      ),
    ),);
  }
}
