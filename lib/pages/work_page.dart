// Work Page
import 'dart:math';

import 'package:ahsan_dev/widgets/contact_me_button.dart';
import 'package:ahsan_dev/widgets/footer.dart';
import 'package:ahsan_dev/widgets/header.dart';
import 'package:ahsan_dev/widgets/my_poject_card.dart';
import 'package:ahsan_dev/widgets/project_row_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WorkPage extends StatelessWidget {
  const WorkPage({super.key});

  @override
  Widget build(BuildContext context) {
    // final textTheme = Theme.of(context).textTheme;
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Header(),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 80),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: screenHeight * 0.20,
                    ),
                    Text(
                      'Work',
                      style: TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Roboto',
                      ),

                      // style: textTheme.displayLarge,
                    ),
                    SizedBox(
                      height: screenHeight * 0.25,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          spacing: 30,
                          children: [
                            Text(
                              "All",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal,
                                  fontFamily: 'Roboto'),
                            ),
                            Text(
                              "Mobile",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal,
                                  fontFamily: 'Roboto'),
                            ),
                            Text(
                              "Web",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal,
                                  fontFamily: 'Roboto'),
                            ),
                          ],
                        ),
                        Divider(
                          thickness: 2,
                          color: const Color.fromARGB(255, 186, 182, 182),
                        ),
                        SizedBox(height: 30),
                        ProjectRowWidget(),
                        ProjectRowWidget(),
                        ProjectRowWidget(),
                        SizedBox(
                          height: 40,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Do you like my work? You can simply ',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: 'Roboto')),
                            SizedBox(
                              width: 10,
                            ),
                            HoverButton(
                              text: 'contact me',
                              onPressed: () {
                                context.go('/contact');
                              },
                              color: const Color.fromARGB(255, 3, 86, 153),
                              isOutlined: false,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // const Footer(),
          ],
        ),
      ),
    );
  }
}
