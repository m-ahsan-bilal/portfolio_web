import 'package:ahsan_dev/widgets/footer.dart';
import 'package:ahsan_dev/widgets/header.dart';
import 'package:ahsan_dev/widgets/pdf_view.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:pdfx/pdfx.dart';

class ResumePage extends StatelessWidget {
  const ResumePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Header(),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'My Resume',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            PDFViewPage(),
            const SizedBox(height: 50),
            const Footer(),
          ],
        ),
      ),
    );
  }
}
