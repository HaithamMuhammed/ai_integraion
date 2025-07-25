// lib/View/widgets/metric_cards_widget.dart

import 'package:flutter/material.dart';
import 'package:new_ai_project/View/Widgets/Circlecard.dart';



class MetricCardsWidget extends StatelessWidget {
  final double km;
  final int heartRate;
  final int cal;

  const MetricCardsWidget({
    super.key,
    required this.km,
    required this.heartRate,
    required this.cal,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        MetricCircleCard(value: km.toStringAsFixed(1), label: "KM"),
        MetricCircleCard(value: "$heartRate", label: "Heart Rate"),
        MetricCircleCard(value: "$cal", label: "CAL"),
      ],
    );
  }
}