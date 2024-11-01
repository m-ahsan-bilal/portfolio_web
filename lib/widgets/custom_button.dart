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
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: isOutlined ? Colors.white : color,
        // side: isOutlined ? BorderSide(color: color, width: 2) : BorderSide.none,
        elevation: isOutlined ? 0 : 4,
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(2),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          color:
              //  Color(0xff0B3FF7),
              isOutlined ? color : Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
