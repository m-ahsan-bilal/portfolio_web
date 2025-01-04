import 'package:ahsan_dev/widgets/nav_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          NavButton(
            title: "About",
            onTap: () {
              context.go('/');
            },
          ),
          Spacer(flex: 1), // Adjust spacing for consistency
          NavButton(
            title: "Work",
            onTap: () {
              context.go('/work');
            },
          ),
          Spacer(flex: 1),
          Align(
            alignment: Alignment.center,
            child: InkWell(
              onTap: () {
                context.go('/');
              },
              child: const Text(
                'Ahsan Bilal',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'roboto',
                  fontWeight: FontWeight.w300,
                  height: 1.2, // Adjust the line height
                  fontSize: 50,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Spacer(flex: 1),
          NavButton(
            title: "Resume",
            onTap: () {
              context.go('/resume');
            },
          ),
          Spacer(flex: 1), // Adjust spacing for consistency
          NavButton(
            title: "Contact",
            onTap: () {
              context.go('/contact');
            },
          ),
        ],
      ),
    );
  }
}
