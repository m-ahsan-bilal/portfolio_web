import 'package:flutter/material.dart';

class NavButton extends StatelessWidget {
  final String title;
  final Function() onTap;
  const NavButton({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(
        title,
        style: const TextStyle(
            color: Color(0xff3D5EFC),
            fontSize: 18,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
