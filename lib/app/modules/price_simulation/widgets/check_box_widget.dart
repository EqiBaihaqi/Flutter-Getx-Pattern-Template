import 'package:flutter/material.dart';
import 'package:lppom_halal_agent_management_mobile_flutter/app/core/app_text_styles.dart';
import 'package:lppom_halal_agent_management_mobile_flutter/app/style/style_color.dart';

class CheckBoxWidget extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;
  const CheckBoxWidget(
      {super.key,
      required this.title,
      required this.isSelected,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              border: Border.all(color: CustomColor.grey50, width: 1),
              gradient: LinearGradient(
                colors: isSelected
                    ? [
                        CustomColor.blueGradient,
                        CustomColor.purpleGradient,
                      ]
                    : [CustomColor.netral3, CustomColor.netral3],
              ),
            ),
            child: isSelected
                ? const Icon(Icons.check, size: 16, color: CustomColor.netral1)
                : null,
          ),
          const SizedBox(width: 8),
          Text(title, style: AppTextStyles.semiBold14),
        ],
      ),
    );
  }
}
