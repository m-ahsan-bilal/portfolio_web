import 'package:ahsan_dev/widgets/custom_button.dart';
import 'package:ahsan_dev/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PortfolioHome extends StatelessWidget {
  const PortfolioHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Header(),
            const SizedBox(
              height: 180,
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'A developer',
                    style: TextStyle(
                      fontSize: 70,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const Text(
                    'you need.',
                    style: TextStyle(fontSize: 50, color: Colors.black),
                  ),
                  const SizedBox(height: 190),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Expanded(
                          // Use Expanded for better layout
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment
                                .start, // Align text to the left
                            children: [
                              Text(
                                'I’m Ahsan Bilal, a passionate developer.',
                                style: TextStyle(
                                    fontSize: 28,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Text(
                                'I discovered my love for programming during bachhelors, and it has transformed a curiosity into a fulfilling career.',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                                textAlign: TextAlign.left,
                              ),
                              SizedBox(height: 10),
                              Text(
                                'I Specialized in Flutter development, I bring ideas to life through beautiful and functional applications, allowing me to create seamless experiences across platforms.',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                                textAlign: TextAlign.left,
                              ),
                              SizedBox(height: 10),
                              Text(
                                'When I’m not coding, you’ll likely find me exploring nature on my bike or enjoying a good book under the open sky, drawing inspiration from the world around me.',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Image.asset(
                            'assets/images/photo.jpg',
                            height: 300,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 80),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomButton(
                          textColor: const Color(0xff0B3FF7),
                          text: 'Explore my resume',
                          color: const Color.fromARGB(255, 139, 162, 246),
                          onPressed: () {
                            context.go('/resume');
                          },
                          // isOutlined: true, // Outlined style
                        ),
                        const SizedBox(width: 30),
                        const Text("or"),
                        const SizedBox(width: 30),
                        CustomButton(
                          textColor: Colors.white,
                          text: 'contact me',
                          color: const Color(0xff0B3FF7),
                          onPressed: () {
                            context.go('/contact');
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 50),
                  // const Footer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
