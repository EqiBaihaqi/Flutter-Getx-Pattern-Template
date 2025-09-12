import 'package:flutter/material.dart';
import 'package:lppom_halal_agent_management_mobile_flutter/app/commons/widgets/custom_image_local.dart';
import 'package:lppom_halal_agent_management_mobile_flutter/app/constant/constant_asset.dart';
import 'package:lppom_halal_agent_management_mobile_flutter/app/core/app_text_styles.dart';

class AddProductButtonWidget extends StatelessWidget {
  final VoidCallback onTap;
  const AddProductButtonWidget({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const CustomImageLocal(
            imagePath: ConstantAsset.plusIcon,
          ),
          const SizedBox(
            width: 2.5,
          ),
          Text(
            'Add Product',
            style: AppTextStyles.semiBold14
                .copyWith(color: const Color(0xFFA31AF2)),
          ),
        ],
      ),
    );
  }
}
