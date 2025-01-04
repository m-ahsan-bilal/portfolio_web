import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback onPressed;
  final bool isOutlined;
  final Color textColor;

  const CustomButton({
    super.key,
    required this.text,
    required this.color,
    required this.onPressed,
    this.isOutlined = false,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    double horizontalPadding = screenWidth > 1024
        ? 40
        : screenWidth > 768
            ? 30
            : 20;
    double verticalPadding = screenWidth > 1024
        ? 25
        : screenWidth > 768
            ? 15
            : 10;
    double fontSize = screenWidth > 1024
        ? 18
        : screenWidth > 768
            ? 16
            : 14;

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: isOutlined ? Colors.white : color,
        elevation: isOutlined ? 0 : 4,
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: verticalPadding,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          color: isOutlined ? color : Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: fontSize,
        ),
      ),
    );
  }
}
