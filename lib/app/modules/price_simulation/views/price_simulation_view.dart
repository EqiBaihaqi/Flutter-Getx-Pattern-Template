import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lppom_halal_agent_management_mobile_flutter/app/commons/widgets/custom_button.dart';
import 'package:lppom_halal_agent_management_mobile_flutter/app/commons/widgets/custom_dropdown.dart';
import 'package:lppom_halal_agent_management_mobile_flutter/app/commons/widgets/custom_image_local.dart';
import 'package:lppom_halal_agent_management_mobile_flutter/app/commons/widgets/custom_text_form_field/custom_text_form_field.dart';
import 'package:lppom_halal_agent_management_mobile_flutter/app/commons/widgets/custom_text_form_field/custom_text_form_field_with_unit.dart';
import 'package:lppom_halal_agent_management_mobile_flutter/app/constant/constant_asset.dart';
import 'package:lppom_halal_agent_management_mobile_flutter/app/core/app_colors.dart';
import 'package:lppom_halal_agent_management_mobile_flutter/app/core/app_text_styles.dart';
import 'package:lppom_halal_agent_management_mobile_flutter/app/modules/price_simulation/widgets/add_product_button_widget.dart';
import 'package:lppom_halal_agent_management_mobile_flutter/app/modules/price_simulation/widgets/auto_fill_with_unit_widget.dart';
import 'package:lppom_halal_agent_management_mobile_flutter/app/modules/price_simulation/widgets/check_box_widget.dart';
import 'package:lppom_halal_agent_management_mobile_flutter/app/modules/price_simulation/widgets/discount_widget.dart';
import 'package:lppom_halal_agent_management_mobile_flutter/app/modules/price_simulation/widgets/header_text_widget.dart';
import 'package:lppom_halal_agent_management_mobile_flutter/app/modules/price_simulation/widgets/sub_header_text_widget.dart';
import 'package:lppom_halal_agent_management_mobile_flutter/app/style/style_color.dart';

import '../controllers/price_simulation_controller.dart';

class PriceSimulationView extends GetView<PriceSimulationController> {
  const PriceSimulationView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Price Simulation', style: AppTextStyles.medium20),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Material(
              elevation: 1,
              borderRadius: BorderRadius.circular(6),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Obx(
                  () => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SubHeaderTextWidget(text: 'Province'),
                      const SizedBox(
                        height: 8,
                      ),
                      CustomDropdown(
                        contentPadding: const EdgeInsets.all(12),
                        hint: 'Select Province',
                        hintStyle: AppTextStyles.regular14
                            .copyWith(color: CustomColor.netral6),
                        textStyle: AppTextStyles.regular14,
                        items: const [
                          'Jawa Timur',
                          'Jawa Barat',
                          'Jawa Tengah'
                        ],
                        itemLabel: (item) => item,
                        borderRadius: BorderRadius.circular(8),
                        fillColor: CustomColor.netral3,
                        borderColor: CustomColor.netral3,
                        isFilled: true,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CheckBoxWidget(
                                title: 'Hotel',
                                isSelected: controller.isHotelSelected.value,
                                onTap: () {
                                  controller.isHotelSelected.toggle();
                                }),
                            CheckBoxWidget(
                                title: 'Flight',
                                isSelected: controller.isFlightSelected.value,
                                onTap: () {
                                  controller.isFlightSelected.toggle();
                                }),
                            CheckBoxWidget(
                                title: 'KF Auditor',
                                isSelected:
                                    controller.isKfAuditorSelected.value,
                                onTap: () {
                                  controller.isKfAuditorSelected.toggle();
                                }),
                          ]),
                      const SizedBox(
                        height: 12,
                      ),
                      const HeaderTextWidget(text: 'Unit Cost & Mandays'),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SubHeaderTextWidget(text: 'Product Group'),
                          InkWell(
                            onTap: () {},
                            child: const CustomImageLocal(
                              imagePath: ConstantAsset.icTrash2,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      CustomDropdown(
                        contentPadding: const EdgeInsets.all(12),
                        hint: 'Select Product Group',
                        hintStyle: AppTextStyles.regular14
                            .copyWith(color: CustomColor.netral6),
                        textStyle: AppTextStyles.regular14,
                        items: const ['Milk', 'Bread', 'Seed'],
                        itemLabel: (item) => item,
                        borderRadius: BorderRadius.circular(8),
                        fillColor: CustomColor.netral3,
                        borderColor: CustomColor.netral3,
                        isFilled: true,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      const AutofillWithUnitWidget(
                        title: 'Unit Cost',
                        hint: 'Autofill by product group',
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      const HeaderTextWidget(text: 'Mandays Product'),
                      const SizedBox(
                        height: 12,
                      ),
                      CustomTextFormField(
                        hintText: 'Autofill by product group',
                        hintStyle: AppTextStyles.regular14,
                        readOnly: true,
                        borderRadius: BorderRadius.circular(8),
                        isFilled: true,
                        fillColor: AppColors.colorGrey100,
                        isBorder: true,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      AddProductButtonWidget(onTap: () {}),
                      const SizedBox(
                        height: 12,
                      ),
                      const HeaderTextWidget(text: 'Main Costs'),
                      const SizedBox(
                        height: 12,
                      ),
                      const AutofillWithUnitWidget(
                          title: 'BLU BPJH', hint: 'Autofill by product group'),
                      const SizedBox(
                        height: 12,
                      ),
                      const AutofillWithUnitWidget(
                          title: 'Inspection Costs',
                          hint: 'Autofill by business scale'),
                      const SizedBox(
                        height: 12,
                      ),
                      const DiscountWidget(),
                      const SizedBox(
                        height: 12,
                      ),
                      const AutofillWithUnitWidget(
                          title: 'Operational Costs',
                          hint: 'Autofill by business scale'),
                      const SizedBox(
                        height: 12,
                      ),
                      const DiscountWidget(),
                      const SizedBox(
                        height: 12,
                      ),
                      const AutofillWithUnitWidget(
                          title: 'Total Main Cost', hint: 'Autofill'),
                      const SizedBox(
                        height: 12,
                      ),
                      const HeaderTextWidget(text: 'Supporting Costs'),
                      const SizedBox(
                        height: 12,
                      ),
                      const AutofillWithUnitWidget(
                          title: 'Hotel', hint: 'Autofill by province'),
                      const SizedBox(
                        height: 12,
                      ),
                      const DiscountWidget(),
                      const SizedBox(
                        height: 12,
                      ),
                      const AutofillWithUnitWidget(
                          title: 'Transportation',
                          hint: 'Autofill by province'),
                      const SizedBox(
                        height: 12,
                      ),
                      const DiscountWidget(),
                      const SizedBox(
                        height: 12,
                      ),
                      const AutofillWithUnitWidget(
                          title: 'UPHD',
                          hint: 'Autofill by in city or outside city'),
                      const SizedBox(
                        height: 12,
                      ),
                      const DiscountWidget(),
                      const SizedBox(
                        height: 12,
                      ),
                      const AutofillWithUnitWidget(
                          title: 'Flight', hint: 'Autofill by province'),
                      const SizedBox(
                        height: 12,
                      ),
                      const DiscountWidget(),
                      const SizedBox(
                        height: 12,
                      ),
                      const AutofillWithUnitWidget(
                          title: 'Total Supporting Cost', hint: 'Autofill'),
                      const SizedBox(
                        height: 12,
                      ),
                      const SubHeaderTextWidget(text: 'Notes'),
                      const SizedBox(
                        height: 8,
                      ),
                      CustomTextFormField(
                        hintText: 'Input',
                        hintStyle: AppTextStyles.regular14
                            .copyWith(color: CustomColor.netral6),
                        readOnly: false,
                        borderRadius: BorderRadius.circular(8),
                        isFilled: true,
                        fillColor: AppColors.colorNetral3,
                        isBorder: true,
                        borderColor: AppColors.colorNetral3,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      AddProductButtonWidget(onTap: () {}),
                      const SizedBox(
                        height: 12,
                      ),
                      const HeaderTextWidget(text: 'Total Costs'),
                      const SizedBox(
                        height: 12,
                      ),
                      const AutofillWithUnitWidget(
                          title: 'Halal Certification', hint: 'Autofill'),
                      const SizedBox(
                        height: 12,
                      ),
                      const AutofillWithUnitWidget(
                          title: 'LPPOM Service', hint: 'Autofill'),
                      const SizedBox(
                        height: 12,
                      ),
                      const AutofillWithUnitWidget(
                          title: 'Total Accumulation', hint: 'Autofill'),
                      const SizedBox(
                        height: 12,
                      ),
                      const AutofillWithUnitWidget(
                          title: 'Total Accumulation + 1%', hint: 'Autofill'),
                      const SizedBox(
                        height: 12,
                      ),
                      AddProductButtonWidget(onTap: () {}),
                      const SizedBox(
                        height: 12,
                      ),
                      CustomButton(
                        label: 'Submit',
                        onPressed: () {},
                        gradientColors: const [
                          CustomColor.blueGradient,
                          CustomColor.purpleGradient,
                        ],
                        isGradient: true,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
