import 'package:ahsan_dev/utils/app_resources.dart';
import 'package:ahsan_dev/widgets/footer.dart';
import 'package:ahsan_dev/widgets/header.dart';
import 'package:ahsan_dev/widgets/hover_icon.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContactPage extends StatelessWidget {
  ContactPage({super.key});

  final emailController = TextEditingController();
  final emailFocus = FocusNode();
  final messageController = TextEditingController();
  final messageFocus = FocusNode();
  final subjectController = TextEditingController();
  final subjectFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Header(),
            const SizedBox(height: 60),
            const Text(
              'Contact Us',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment,
                children: [
                  // Social Media Icons Section
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        HoverIcon(
                          icon: FontAwesomeIcons.linkedinIn,
                          label: 'LinkedIn',
                        ),
                        SizedBox(height: 15),
                        HoverIcon(
                          icon: FontAwesomeIcons.github,
                          label: 'GitHub',
                        ),
                        SizedBox(height: 15),
                        HoverIcon(
                          icon: FontAwesomeIcons.medium,
                          label: 'Medium',
                        ),
                        SizedBox(height: 15),
                        HoverIcon(
                          icon: FontAwesomeIcons.stackOverflow,
                          label: 'Stack Overflow',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 30),
                  // Contact Form Section
                  Expanded(
                    flex: 2,
                    child: Form(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFormField(
                            controller: emailController,
                            focusNode: emailFocus,
                            textInputAction: TextInputAction.next,
                            maxLines: 1,
                            decoration: AppResources.decoration.fieldDecoration(
                              context: context,
                              hintText: "Email Address",
                            ),
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            controller: subjectController,
                            focusNode: subjectFocus,
                            textInputAction: TextInputAction.next,
                            maxLines: 1,
                            decoration: AppResources.decoration.fieldDecoration(
                              context: context,
                              hintText: "Subject",
                            ),
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            controller: messageController,
                            focusNode: messageFocus,
                            maxLines: 4,
                            decoration: AppResources.decoration.fieldDecoration(
                              context: context,
                              hintText: "Message",
                            ),
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 30),
                          ElevatedButton(
                            onPressed: () {
                              // Add form submission logic here
                            },
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 32, vertical: 16),
                              backgroundColor: Colors.blue,
                            ),
                            child: const Text(
                              'Send Message',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 80),
            const Footer(),
          ],
        ),
      ),
    );
  }
}
