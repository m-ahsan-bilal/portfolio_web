import 'package:ahsan_dev/utils/app_resources.dart';
import 'package:ahsan_dev/widgets/contact_me_button.dart';
import 'package:ahsan_dev/widgets/expandable_textfield.dart';
import 'package:ahsan_dev/widgets/footer.dart';
import 'package:ahsan_dev/widgets/header.dart';
import 'package:ahsan_dev/widgets/hover_icon.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContactPage extends StatefulWidget {
  ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final emailController = TextEditingController();
  final emailFocus = FocusNode();
  final messageController = TextEditingController();
  final messageFocus = FocusNode();
  final subjectController = TextEditingController();
  final subjectFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Header(),
            const SizedBox(height: 60),
            const Center(
              child: Text(
                'Contact',
                style: TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.w900,
                  fontFamily: 'roboto',
                ),
                textAlign: TextAlign.center,
                textDirection: TextDirection.ltr,
              ),
            ),
            const SizedBox(height: 40),
            Container(
              constraints:
                  const BoxConstraints(maxWidth: 1050), // Constrain Row width
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(width: screenWidth * 0.1),
                  // SizedBox(width: 150),
                  // Social Media Icons Section
                  const Expanded(
                    flex: 1,
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        HoverIcon(
                            icon: FontAwesomeIcons.linkedinIn,
                            label: 'LinkedIn'),
                        SizedBox(height: 15),
                        HoverIcon(
                            icon: FontAwesomeIcons.github, label: 'GitHub'),
                        SizedBox(height: 15),
                        HoverIcon(
                            icon: FontAwesomeIcons.medium, label: 'Medium'),
                        SizedBox(height: 15),
                        HoverIcon(
                            icon: FontAwesomeIcons.stackOverflow,
                            label: 'Stack Overflow'),
                      ],
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.1),
                  // Contact Form Section
                  Expanded(
                    flex: 2,
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.
                      children: [
                        // Email Field
                        TextFormField(
                          controller: emailController,
                          focusNode: emailFocus,
                          textInputAction: TextInputAction.next,
                          maxLines: 1,
                          decoration: AppResources.decoration.fieldDecoration(
                            context: context,
                            hintText: "Email Address",
                          ),
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 20),
                        // Subject Field
                        TextFormField(
                          controller: subjectController,
                          focusNode: subjectFocus,
                          textInputAction: TextInputAction.next,
                          maxLines: 1,
                          decoration: AppResources.decoration.fieldDecoration(
                            context: context,
                            hintText: "Subject",
                          ),
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 20),
                        // Message Field
                        const ExpandableTextField(
                          height: 250,
                          maxHeight: 400,
                          dividerHeight: 20,
                          dividerSpace: 2,
                          key: Key('message'),
                        ),
                      ],
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
