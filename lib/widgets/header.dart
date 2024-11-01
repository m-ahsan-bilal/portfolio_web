import 'package:ahsan_dev/widgets/nav_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 60, right: 60, top: 60),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          NavButton(
              title: "about",
              onTap: () {
                context.go('/');
              }),
          NavButton(
              title: "Work",
              onTap: () {
                context.go('/work');
              }),
          const Text(
            'Ahsan Bilal',
            style: TextStyle(
              color: Colors.black,
              fontSize: 50,
            ),
          ),
          NavButton(
              title: "Resume",
              onTap: () {
                context.go('/resume');
              }),
          NavButton(title: "Contact", onTap: () => context.go('/contact')),
        ],
      ),
    );
  }
}
