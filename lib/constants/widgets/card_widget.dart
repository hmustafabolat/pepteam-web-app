import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../viewModel/dashboard_viewModel.dart';
import '../project_custom_colors.dart';
import '../project_paddings.dart';
import '../project_text_styles.dart';

class CardWidgets extends StatelessWidget {
  final String itemTextState;
  final StreamBuilder<List> containerChildState;

  const CardWidgets({
    super.key,
    required this.itemTextState,
    required this.containerChildState,
  });

  @override
  Widget build(BuildContext context) {
    final DashboardViewModel controller = Get.put(DashboardViewModel());

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        () {
          return Container(
            width: 450,
            height: 130,
            decoration: BoxDecoration(
                border: Border.all(
                    width: 2, color: ProjectCustomColors().customGrey2),
                borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: ProjectPaddings().only_lT,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        itemTextState,
                        style: ProjectTextStyles().black_w400_s12,
                      ),
                      Container(
                          height: 50, width: 300, child: containerChildState),
                    ],
                  ),
                ],
              ),
            ),
          );
        }(),
      ],
    );
  }
}

class CardWidget extends StatelessWidget {
  const CardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 450,
      height: 130,
      decoration: BoxDecoration(
          border:
              Border.all(width: 2, color: ProjectCustomColors().customGrey2),
          borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: ProjectPaddings().only_lT,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Cihaz Konumu",
                  style: ProjectTextStyles().black_w400_s12,
                ),
                Text(
                  "Ankara",
                  style: ProjectTextStyles().darkBlue_w600_s30,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
