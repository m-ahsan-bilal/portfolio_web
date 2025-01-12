import 'package:ahsan_dev/widgets/footer.dart';
import 'package:ahsan_dev/widgets/header.dart';
import 'package:ahsan_dev/widgets/pdf_view.dart';
import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';

class ResumePage extends StatelessWidget {
  const ResumePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Header(),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'My Resume',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 20),
            PDFViewPage(),
            // SizedBox(
            //   height: 700,
            //   width: double.infinity,
            //   child: PdfView(
            //     controller: PdfController(
            //       document: PdfDocument.openAsset('assets/images/resume.pdf'),
            //       initialPage: 1,
            //     ),
            //   ),
            // ),
            SizedBox(height: 50),
            Footer(),
          ],
        ),
      ),
    );
  }
}
