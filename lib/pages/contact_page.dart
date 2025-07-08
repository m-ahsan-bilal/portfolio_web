// ignore_for_file: use_build_context_synchronously

import 'package:ahsan_dev/utils/app_resources.dart';
import 'package:ahsan_dev/utils/zbot_toast.dart';
import 'package:ahsan_dev/widgets/expandable_textfield.dart';
import 'package:ahsan_dev/widgets/footer.dart';
import 'package:ahsan_dev/widgets/header.dart';
import 'package:ahsan_dev/widgets/hover_icon.dart';
import 'package:ahsan_dev/services/contact_service.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bot_toast/bot_toast.dart';

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

  // Validation functions
  String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email is required';
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? validateTopic(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Topic is required';
    }
    if (value.trim().length < 2) {
      return 'Topic must be at least 2 characters';
    }
    if (value.length > 100) {
      return 'Topic must be less than 100 characters';
    }
    return null;
  }

  String? validateMessage(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Message is required';
    }
    if (value.trim().length < 10) {
      return 'Message must be at least 10 characters';
    }
    if (value.length > 2000) {
      return 'Message must be less than 2000 characters';
    }
    return null;
  }

  // Form submission method
  Future<void> _submitForm() async {
    // Client-side validation
    final emailError = validateEmail(emailController.text);
    final topicError = validateTopic(subjectController.text);
    final messageError = validateMessage(messageController.text);

// validating the conttact form
// email
    if (emailError != null) {
      debugPrint('Validation error: $emailError');
      CustomBotToast.show(
        message: "Invalid Email",
        backgroundColor: Colors.red,
        textColor: Colors.white,
        align: Alignment.topCenter,
      );
      // ScaffoldMessenger.of(context).showSnackBar(
      //   const SnackBar(
      //     content: Text('Invalid email', style: TextStyle(fontSize: 13)),
      //     backgroundColor: Colors.orange,
      //     behavior: SnackBarBehavior.floating,
      //   ),
      // );
      return;
    }
    if (topicError != null) {
      // topic
      debugPrint('Validation error: $topicError');

      CustomBotToast.show(
        message: "Invalid Topic",
        backgroundColor: Colors.red,
        textColor: Colors.white,
        align: Alignment.center,
      );
      // ScaffoldMessenger.of(context).showSnackBar(
      //   const SnackBar(
      //     content: Text('Invalid topic', style: TextStyle(fontSize: 13)),
      //     backgroundColor: Colors.orange,
      //     behavior: SnackBarBehavior.floating,
      //   ),
      // );
      return;
    }
    if (messageError != null) {
      // message
      debugPrint('Validation error: $messageError');

      // ScaffoldMessenger.of(context).showSnackBar(
      //   const SnackBar(
      //     content: Text('Invalid message', style: TextStyle(fontSize: 13)),
      //     backgroundColor: Colors.orange,
      //     behavior: SnackBarBehavior.floating,
      //   ),
      // );
      CustomBotToast.show(
        message: "Invalid Message",
        backgroundColor: Colors.red,
        textColor: Colors.white,
        align: Alignment.center,
      );
      return;
    }

    try {
      // Show loading indicator (optional)
      BotToast.showLoading();
      final result = await ContactService.submitContactForm(
        email: emailController.text,
        topic: subjectController.text,
        message: messageController.text,
      );
      BotToast.closeAllLoading();
      debugPrint('Submission success: ${result['message']}');
      // Show success toast
      CustomBotToast.show(
        message: "Form Submitted",
        backgroundColor: Colors.green,
        textColor: Colors.white,
        align: Alignment.center,
      );

      // Clear form
      emailController.clear();
      subjectController.clear();
      messageController.clear();
    } catch (e) {
      BotToast.closeAllLoading();
      String errorMessage = e.toString();
      debugPrint('Submission error: $errorMessage');
      String snackText = 'Error sending message.';
      if (errorMessage.contains('Validation error:')) {
        snackText = 'Please check your input.';
      } else if (errorMessage.contains('Rate limit')) {
        snackText = 'Too many submissions. Please wait.';
      } else if (errorMessage.contains('Connection error')) {
        snackText = 'Network error. Try again.';
      }

      CustomBotToast.show(
        message: snackText,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        align: Alignment.topCenter,
      );
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(
      //     content: Text(snackText, style: const TextStyle(fontSize: 13)),
      //     backgroundColor: Colors.red,
      //     behavior: SnackBarBehavior.floating,
      //   ),
      // );
    }
  }

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
                    color: Colors.black87,
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
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.black87,
                                    ),
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
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  // Message Field
                                  ExpandableTextField(
                                    height: screenHeight * 0.4,
                                    maxHeight: screenHeight * 0.5,
                                    dividerHeight: 20,
                                    dividerSpace: 10,
                                    key: const Key('message'),
                                    controller: messageController,
                                    onSendPressed: _submitForm,
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
                                  controller: messageController,
                                  onSendPressed: _submitForm,
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
