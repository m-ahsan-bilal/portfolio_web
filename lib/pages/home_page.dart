import 'package:ahsan_dev/utils/app_images.dart';
import 'package:ahsan_dev/widgets/custom_button.dart';
import 'package:ahsan_dev/widgets/footer.dart';
import 'package:ahsan_dev/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ahsan_dev/widgets/floating_chat_bubble.dart';
import 'package:ahsan_dev/utils/chatbot_overlay.dart';

class PortfolioHome extends StatelessWidget {
  const PortfolioHome({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    double titleFontSize = screenWidth > 1024
        ? 70
        : screenWidth > 768
            ? 50
            : 40;
    double subtitleFontSize = screenWidth > 1024
        ? 50
        : screenWidth > 768
            ? 40
            : 30;
    double contentFontSize = screenWidth > 1024
        ? 28
        : screenWidth > 768
            ? 24
            : 18;
    double paragraphFontSize = screenWidth > 1024
        ? 16
        : screenWidth > 768
            ? 14
            : 12;

    EdgeInsetsGeometry contentPadding = EdgeInsets.symmetric(
      horizontal: screenWidth > 1024
          ? 50
          : screenWidth > 768
              ? 30
              : 15,
    );

    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              children: [
                const Header(),
                SizedBox(
                  height: screenWidth > 1024
                      ? 180
                      : screenWidth > 768
                          ? 120
                          : 80,
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'A developer',
                        style: TextStyle(
                          fontSize: titleFontSize,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        'you need.',
                        style: TextStyle(
                          fontSize: subtitleFontSize,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: screenWidth > 1024 ? 190 : 120),
                      Padding(
                        padding: contentPadding,
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'I’m Ahsan Bilal, a passionate developer.',
                                        style: TextStyle(
                                          fontSize: contentFontSize,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 20),
                                      Text(
                                        'I discovered my love for programming during bachelors, and it has transformed a curiosity into a fulfilling career.',
                                        style: TextStyle(
                                          fontSize: paragraphFontSize,
                                          color: Colors.black,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        'Specialized in Flutter development, I bring ideas to life through beautiful and functional applications, allowing me to create seamless experiences across platforms.',
                                        style: TextStyle(
                                          fontSize: paragraphFontSize,
                                          color: Colors.black,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        'When I’m not coding, you’ll likely find me exploring nature on my bike or enjoying a good book under the open sky, drawing inspiration from the world around me.',
                                        style: TextStyle(
                                          fontSize: paragraphFontSize,
                                          color: Colors.black,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 20),
                                if (screenWidth > 768)
                                  Expanded(
                                    child: Image.asset(
                                      // 'assets/images/photo.png',
                                      AppImages.photo,
                                      height: screenWidth > 1024 ? 300 : 200,
                                    ),
                                  ),
                              ],
                            ),
                            if (screenWidth <= 768)
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Image.network(
                                  'assets/images/photo.png',
                                  height: 200,
                                ),
                              ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: screenWidth > 1024
                            ? 80
                            : screenWidth > 768
                                ? 50
                                : 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 80,
                        ),
                        child: screenWidth >= 768
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomButton(
                                    textColor: const Color(0xff0B3FF7),
                                    text: 'Explore my resume',
                                    color: const Color.fromARGB(
                                        255, 139, 162, 246),
                                    onPressed: () {
                                      context.go('/resume');
                                    },
                                  ),
                                  SizedBox(width: screenWidth * 0.05),
                                  const Text("or"),
                                  SizedBox(width: screenWidth * 0.05),
                                  CustomButton(
                                    textColor: Colors.white,
                                    text: 'contact me',
                                    color: const Color(0xff0B3FF7),
                                    onPressed: () {
                                      context.go('/contact');
                                    },
                                  ),
                                ],
                              )
                            : Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomButton(
                                    textColor: const Color(0xff0B3FF7),
                                    text: 'Explore my resume',
                                    color: const Color.fromARGB(
                                        255, 139, 162, 246),
                                    onPressed: () {
                                      context.go('/resume');
                                    },
                                  ),
                                  SizedBox(width: screenWidth * 0.05),
                                  const Text("or"),
                                  SizedBox(width: screenWidth * 0.05),
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
                    ],
                  ),
                ),
                const Footer(),
              ],
            ),
          ),
        ),
        FloatingChatBubble(
          onTap: () {
            ChatbotOverlay.show(context);
          },
        ),
      ],
    );
  }
}
