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
                children: [
                  const SizedBox(width: 200), // Adjusted padding on the left

                  // Social Media Icons Section
                  const Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
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

                  const SizedBox(width: 50),

                  // Contact Form Section
                  Column(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Form(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Email Field
                              TextFormField(
                                controller: emailController,
                                focusNode: emailFocus,
                                textInputAction: TextInputAction.next,
                                maxLines: 1,
                                decoration:
                                    AppResources.decoration.fieldDecoration(
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
                                decoration:
                                    AppResources.decoration.fieldDecoration(
                                  context: context,
                                  hintText: "Subject",
                                ),
                                style: const TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 20),

                              // Message Field with Expandable TextField
                              ExpandableTextField(
                                height: 100,
                                maxHeight: 300,
                                dividerHeight: 20,
                                dividerSpace: 2,
                                key: const Key('message'),
                                child: TextFormField(
                                  controller: messageController,
                                  focusNode: messageFocus,
                                  maxLines: null,
                                  expands: true,
                                  decoration:
                                      AppResources.decoration.fieldDecoration(
                                    context: context,
                                    hintText: "Message",
                                  ),
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ),

                              // Row to keep the button next to the fields
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 50),
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
