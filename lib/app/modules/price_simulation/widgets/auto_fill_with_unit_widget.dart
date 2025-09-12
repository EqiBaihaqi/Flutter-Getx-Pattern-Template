import 'package:flutter/material.dart';
import 'package:lppom_halal_agent_management_mobile_flutter/app/commons/widgets/custom_text_form_field/custom_text_form_field.dart';
import 'package:lppom_halal_agent_management_mobile_flutter/app/commons/widgets/custom_text_form_field/custom_text_form_field_with_unit.dart';
import 'package:lppom_halal_agent_management_mobile_flutter/app/core/app_colors.dart';
import 'package:lppom_halal_agent_management_mobile_flutter/app/core/app_text_styles.dart';

class AutofillWithUnitWidget extends StatelessWidget {
  final String title;
  final String hint;
  const AutofillWithUnitWidget({
    super.key,
    required this.title,
    required this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextFieldWithUnit(
      title: title,
      unitColor: AppColors.colorNetral3,
      titleStyle: AppTextStyles.semiBold14,
      unitLabel: "Rp",
      labelColor: AppColors.colorNetral9,
      unitPosition: UnitPosition.prefix,
      textFormField: CustomTextFormField(
        readOnly: true,
        // controller: controller.jobDescriptionController,
        keyboardType: TextInputType.number,
        hintText: hint,
        hintStyle: AppTextStyles.regular14,
        isFilled: true,
        fillColor: AppColors.colorGrey100,
        isBorder: true,
        borderRadius: const BorderRadius.only(
            topRight: Radius.circular(8), bottomRight: Radius.circular(8)),
        borderColor: AppColors.colorGrey100,
      ),
    );
  }
}