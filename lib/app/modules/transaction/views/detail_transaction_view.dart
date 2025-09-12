import 'package:flutter/material.dart';
import 'package:lppom_halal_agent_management_mobile_flutter/app/core/app_text_styles.dart';
import 'package:lppom_halal_agent_management_mobile_flutter/app/style/style_color.dart';

class DetailTransactionView extends StatelessWidget {
  const DetailTransactionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Detail Transaction',
          style: AppTextStyles.medium20,
        ),
      ),
      body: Padding(
        padding:
            const EdgeInsetsGeometry.symmetric(horizontal: 24, vertical: 16),
        child: Material(
          elevation: 1,
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsetsGeometry.symmetric(
                horizontal: 16, vertical: 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Status',
                      style: AppTextStyles.regular14
                          .copyWith(color: CustomColor.netral7),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: CustomColor.purple500,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                        child: Text(
                          'Raw Leads',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 6,
                ),
                const RowBuilder(
                    description: 'Submit Date', value: '2 August 2025'),
                const RowBuilder(description: 'PIC', value: 'Asyraf Darma'),
                const RowBuilder(description: 'Phone', value: '082345678901'),
                const RowBuilder(
                    description: 'Email', value: 'darmaasyraf@gmail.com'),
                const RowBuilder(
                    description: 'Company Name', value: 'PT Maju Bersama'),
                const RowBuilder(description: 'Business Scale', value: 'Mikro'),
                const RowBuilder(
                    description: 'Product Type', value: 'Medical Device'),
                const RowBuilder(description: 'Company Status', value: 'New'),
                const RowBuilder(
                    description: 'Update Date', value: '9 Aug 2025'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RowBuilder extends StatelessWidget {
  final String description;
  final String value;

  const RowBuilder({super.key, required this.description, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            description,
            style: AppTextStyles.regular14.copyWith(color: CustomColor.netral7),
          ),
          Text(
            value,
            style:
                AppTextStyles.semiBold14.copyWith(color: CustomColor.netral9),
          )
        ],
      ),
    );
  }
}
