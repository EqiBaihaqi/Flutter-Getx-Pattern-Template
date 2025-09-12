import 'package:flutter/material.dart';
import 'package:lppom_halal_agent_management_mobile_flutter/app/core/app_text_styles.dart';

class SubHeaderTextWidget extends StatelessWidget {
  final String text;
  const SubHeaderTextWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppTextStyles.semiBold14,
    );
  }
}
