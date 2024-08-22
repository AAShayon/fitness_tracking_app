import 'package:flutter/material.dart';

class CircularProgress extends StatelessWidget {
  final int current;
  final int total;

  const CircularProgress({
    super.key,
    required this.current,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    double progress = current / total;

    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          height: 60.0, // Adjust according to your needs
          width: 60.0,
          child: CircularProgressIndicator(
            value: progress,
            strokeWidth: 6.0,
            backgroundColor: Colors.grey[300],
            valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFFF6F00)),
          ),
        ),
        Text(
          "$current/$total",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
            color: Color(0xFF000B23),
          ),
        ),
      ],
    );
  }
}
