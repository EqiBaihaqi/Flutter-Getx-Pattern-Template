import 'package:flutter/material.dart';
import 'package:lppom_halal_agent_management_mobile_flutter/app/commons/widgets/custom_text_form_field/custom_text_form_field.dart';
import 'package:lppom_halal_agent_management_mobile_flutter/app/commons/widgets/custom_text_form_field/custom_text_form_field_with_unit.dart';
import 'package:lppom_halal_agent_management_mobile_flutter/app/core/app_colors.dart';
import 'package:lppom_halal_agent_management_mobile_flutter/app/core/app_text_styles.dart';
import 'package:lppom_halal_agent_management_mobile_flutter/app/style/style_color.dart';

class DiscountWidget extends StatelessWidget {
  const DiscountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextFieldWithUnit(
      title: 'Discount',
      unitColor: AppColors.colorNetral3,
      titleStyle: AppTextStyles.semiBold14,
      unitLabel: "%",
      labelColor: AppColors.colorNetral9,
      unitPosition: UnitPosition.prefix,
      textFormField: CustomTextFormField(
        readOnly: false,
        // controller: controller.jobDescriptionController,
        keyboardType: TextInputType.number,
        hintText: 'ex 0,0001',
        hintStyle: AppTextStyles.regular14.copyWith(color: CustomColor.netral6),
        isFilled: true,

        fillColor: AppColors.colorNetral3,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
    );
  }
}
