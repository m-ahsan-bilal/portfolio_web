import 'package:ahsan_dev/widgets/nav_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = constraints.maxWidth;

        if (screenWidth >= 1280 && screenWidth <= 1439) {
          // Laptop view
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NavButton(
                  title: "About",
                  onTap: () {
                    context.go('/');
                  },
                ),
                const Spacer(),
                NavButton(
                  title: "Work",
                  onTap: () {
                    context.go('/work');
                  },
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    context.go('/');
                  },
                  child: const Text(
                    'Ahsan Bilal',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'roboto',
                      fontWeight: FontWeight.w300,
                      height: 1.2,
                      fontSize: 40,
                    ),
                  ),
                ),
                const Spacer(),
                NavButton(
                  title: "Resume",
                  onTap: () {
                    context.go('/resume');
                  },
                ),
                const Spacer(),
                NavButton(
                  title: "Contact",
                  onTap: () {
                    context.go('/contact');
                  },
                ),
              ],
            ),
          );
        } else if (screenWidth >= 768 && screenWidth <= 1023) {
          // Tablet view
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    context.go('/');
                  },
                  child: const Text(
                    'Ahsan Bilal',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'roboto',
                      fontWeight: FontWeight.w300,
                      height: 1.2,
                      fontSize: 35,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    NavButton(
                      title: "About",
                      onTap: () {
                        context.go('/');
                      },
                    ),
                    NavButton(
                      title: "Work",
                      onTap: () {
                        context.go('/work');
                      },
                    ),
                    NavButton(
                      title: "Resume",
                      onTap: () {
                        context.go('/resume');
                      },
                    ),
                    NavButton(
                      title: "Contact",
                      onTap: () {
                        context.go('/contact');
                      },
                    ),
                  ],
                ),
              ],
            ),
          );
        } else if (screenWidth >= 320 && screenWidth <= 480) {
          // Mobile view
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    context.go('/');
                  },
                  child: const Text(
                    'Ahsan Bilal',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'roboto',
                      fontWeight: FontWeight.w300,
                      height: 1.2,
                      fontSize: 28,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Column(
                  children: [
                    NavButton(
                      title: "About",
                      onTap: () {
                        context.go('/');
                      },
                    ),
                    const SizedBox(height: 10),
                    NavButton(
                      title: "Work",
                      onTap: () {
                        context.go('/work');
                      },
                    ),
                    const SizedBox(height: 10),
                    NavButton(
                      title: "Resume",
                      onTap: () {
                        context.go('/resume');
                      },
                    ),
                    const SizedBox(height: 10),
                    NavButton(
                      title: "Contact",
                      onTap: () {
                        context.go('/contact');
                      },
                    ),
                  ],
                ),
              ],
            ),
          );
        } else {
          // Default view
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    context.go('/');
                  },
                  child: const Text(
                    'Ahsan Bilal',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'roboto',
                      fontWeight: FontWeight.w300,
                      height: 1.2,
                      fontSize: 35,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    NavButton(
                      title: "About",
                      onTap: () {
                        context.go('/');
                      },
                    ),
                    NavButton(
                      title: "Work",
                      onTap: () {
                        context.go('/work');
                      },
                    ),
                    NavButton(
                      title: "Resume",
                      onTap: () {
                        context.go('/resume');
                      },
                    ),
                    NavButton(
                      title: "Contact",
                      onTap: () {
                        context.go('/contact');
                      },
                    ),
                  ],
                ),
              ],
            ),
          );
          // return Container();
        }
      },
    );
  }
}
