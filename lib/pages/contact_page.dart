import 'package:ahsan_dev/utils/app_resources.dart';
import 'package:ahsan_dev/widgets/expandable_textfield.dart';
import 'package:ahsan_dev/widgets/footer.dart';
import 'package:ahsan_dev/widgets/header.dart';
import 'package:ahsan_dev/widgets/hover_icon.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  // controllers
  final emailController = TextEditingController();
  final messageController = TextEditingController();
  final subjectController = TextEditingController();
  // focus nodes
  final subjectFocus = FocusNode();
  final emailFocus = FocusNode();
  final messageFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(builder: (context, constraints) {
        return SingleChildScrollView(
          child: Column(
            children: [
              const Header(),
              SizedBox(height: screenHeight * 0.1),
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
              SizedBox(height: screenHeight * 0.1),
              Container(
                constraints: BoxConstraints(maxWidth: screenWidth * 0.9),
                child: screenWidth > 900
                    ? Row(
                        children: [
                          // Row layout for wider screens
                          SizedBox(width: screenWidth * 0.1),
                          // Social Media Icons Section
                          Expanded(
                            flex: 1,
                            child: Column(
                              spacing: screenHeight * 0.02,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                HoverIcon(
                                    icon: FontAwesomeIcons.linkedinIn,
                                    label: 'LinkedIn'),
                                HoverIcon(
                                    icon: FontAwesomeIcons.github,
                                    label: 'GitHub'),
                                HoverIcon(
                                    icon: FontAwesomeIcons.medium,
                                    label: 'Medium'),
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
                            child: ConstrainedBox(
                              constraints: BoxConstraints(
                                maxHeight:
                                    MediaQuery.of(context).size.height * 0.9,
                              ),
                              child: Column(
                                spacing: screenHeight * 0.02,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Email Field
                                  SizedBox(
                                    height: screenHeight * 0.08,
                                  ),
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
                                  // Message Field
                                  ExpandableTextField(
                                    height: screenHeight * 0.4,
                                    maxHeight: screenHeight * 0.5,
                                    dividerHeight: 20,
                                    dividerSpace: 10,
                                    key: const Key('message'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          // Column layout for narrow screens
                          SizedBox(width: screenHeight * 0.1),

                          // Social Media Icons Section
                          Column(
                            spacing: screenHeight * 0.02,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              HoverIcon(
                                  icon: FontAwesomeIcons.linkedinIn,
                                  label: 'LinkedIn'),
                              HoverIcon(
                                  icon: FontAwesomeIcons.github,
                                  label: 'GitHub'),
                              HoverIcon(
                                  icon: FontAwesomeIcons.medium,
                                  label: 'Medium'),
                              HoverIcon(
                                  icon: FontAwesomeIcons.stackOverflow,
                                  label: 'Stack Overflow'),
                            ],
                          ),
                          SizedBox(width: screenHeight * 0.1),
                          // Contact Form Section
                          ConstrainedBox(
                            constraints: BoxConstraints(
                              maxHeight:
                                  MediaQuery.of(context).size.height * 0.9,
                            ),
                            child: Column(
                              spacing: screenHeight * 0.02,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Email Field
                                SizedBox(
                                  height: screenHeight * 0.08,
                                ),
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

                                // Message Field
                                ExpandableTextField(
                                  height: screenHeight * 0.4,
                                  maxHeight: screenHeight * 0.5,
                                  dividerHeight: 20,
                                  dividerSpace: 10,
                                  key: const Key('message'),
                                ),
                                // SizedBox(height: 40),
                              ],
                            ),
                          ),
                        ],
                      ),
              ),
              const Footer(),
            ],
          ),
        );
      }),
    );
  }
}
