import 'package:flutter/material.dart';

class NavButton extends StatelessWidget {
  final String title;
  final Function() onTap;
  const NavButton({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        title,
        style: const TextStyle(
            color: Color(0xff3D5EFC),
            fontSize: 18,
            fontFamily: 'roboto',
            fontWeight: FontWeight.w700),
      ),
    );
  }
}
