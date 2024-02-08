import 'package:flutter/material.dart';

import '../../utility/app_colors.dart';

RichText shopyBayText(BuildContext context, {double fontSize = 28}) {
  return RichText(
    text: TextSpan(
      text: 'Shopy',
      style: Theme.of(context).textTheme.titleLarge!.copyWith(
          color: AppColors.primaryColor,
          fontStyle: FontStyle.italic,
          fontSize: fontSize),
      children: <TextSpan>[
        TextSpan(
            text: 'Bay',
            style: TextStyle(
                color: Colors.amber,
                fontStyle: FontStyle.italic,
                fontSize: fontSize)),
      ],
    ),
  );
}
