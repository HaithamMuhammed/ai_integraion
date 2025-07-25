// lib/View/widgets/graph_widget.dart

import 'package:flutter/material.dart';

class GraphWidget extends StatelessWidget {
  final List<double> graphPoints;

  const GraphWidget({super.key, required this.graphPoints});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: const Color(0xFF1A2A54),
        borderRadius: BorderRadius.circular(20),
      ),
      child: CustomPaint(
        painter: LineChartPainter(graphPoints: graphPoints),
        child: Container(),
      ),
    );
  }
}

class LineChartPainter extends CustomPainter {
  final List<double> graphPoints;

  LineChartPainter({required this.graphPoints});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blueAccent
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final fillPaint = Paint()
      ..color = Colors.blueAccent.withOpacity(0.2)
      ..style = PaintingStyle.fill;

    final List<Offset> points = List.generate(graphPoints.length, (index) {
      double x = size.width * (index / (graphPoints.length - 1));
      double y = size.height * (1 - graphPoints[index]);
      return Offset(x, y);
    });

    final path = Path();
    if (points.isNotEmpty) {
      path.moveTo(points[0].dx, points[0].dy);
      for (int i = 1; i < points.length; i++) {
        path.lineTo(points[i].dx, points[i].dy);
      }
    }
    canvas.drawPath(path, paint);

    final fillPath = Path.from(path);
    if (points.isNotEmpty) {
      fillPath.lineTo(size.width, size.height);
      fillPath.lineTo(0, size.height);
      fillPath.close();
      canvas.drawPath(fillPath, fillPaint);
    }

    final textPainter = TextPainter(
      textDirection: TextDirection.ltr,
    );
    const textStyle = TextStyle(color: Colors.white54, fontSize: 10);

    List<String> yAxisLabels = ["100", "80", "60", "40", "20", "0"];
    double labelSpacing = size.height / (yAxisLabels.length - 1);

    for (int i = 0; i < yAxisLabels.length; i++) {
      textPainter.text = TextSpan(text: yAxisLabels[i], style: textStyle);
      textPainter.layout();
      textPainter.paint(
          canvas,
          Offset(-textPainter.width - 5,
              (size.height - labelSpacing * i) - textPainter.height / 2));
    }
  }

  @override
  bool shouldRepaint(covariant LineChartPainter oldDelegate) {
    return oldDelegate.graphPoints != graphPoints;
  }
}
