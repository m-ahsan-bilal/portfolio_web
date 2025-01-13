import 'package:flutter/material.dart';

class ContainerProject extends StatelessWidget {
  final String imagePath;

  const ContainerProject({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 200,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          imagePath,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
