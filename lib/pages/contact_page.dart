import 'package:ahsan_dev/widgets/header.dart';
import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 100),
          child: Column(
            children: [
              const Header(),
              const SizedBox(height: 100),
              const Text(
                'Contact',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Container(
                        height: 400,
                        width: 400,
                        color: Colors.pink.shade300,
                      ),
                    ],
                  ),
                  Form(
                    child: Column(
                      children: [
                        Container(
                          height: 400,
                          width: 400,
                          color: Colors.pink.shade300,
                        ),
                        //   TextFormField(
                        //     decoration: const InputDecoration(
                        //       labelText: 'Name',
                        //     ),
                        //   ),
                        //   TextFormField(
                        //     decoration: const InputDecoration(
                        //       labelText: 'Email',
                        //     ),
                        //   ),
                        //   TextFormField(
                        //     decoration: const InputDecoration(
                        //       labelText: 'Message',
                        //     ),
                        //   ),
                        //   ElevatedButton(
                        //     onPressed: () {},
                        //     child: const Text('Submit'),
                        //   ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
