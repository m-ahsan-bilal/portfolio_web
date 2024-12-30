// Work Page
import 'package:ahsan_dev/widgets/footer.dart';
import 'package:ahsan_dev/widgets/header.dart';
import 'package:ahsan_dev/widgets/my_poject_card.dart';
import 'package:flutter/material.dart';

class WorkPage extends StatelessWidget {
  const WorkPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Header(),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Work',
                      style: textTheme.displayLarge,
                    ),
                    const SizedBox(height: 50),
                    // Dummy project showcases
                    SizedBox(
                      height: 200,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 20,
                        children: [
                          Container(
                            width: size.width * 0.15,
                            height: size.width * 0.025,
                            color: Colors.white,
                          ),
                          Container(
                            width: size.width * 0.15,
                            height: size.width * 0.025,
                            color: Colors.white,
                          ),
                        ],
                      ),

                      // LIST OF PROJECTS STARTS HERE
                    ),
                    const MyPojectCard(
                        title: "Project 1",
                        description: 'Description of project 1'),

                    const SizedBox(height: 20),
                    const MyPojectCard(
                        title: "Project 2",
                        description: 'Description of project 2'),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Back to Home'),
                    ),
                  ],
                ),
              ),
            ),
            const Footer(),
          ],
        ),
      ),
    );
  }
}
