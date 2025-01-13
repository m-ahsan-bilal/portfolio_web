// ignore_for_file: avoid_web_libraries_in_flutter, unused_local_variable

import 'package:ahsan_dev/utils/app_images.dart';
import 'package:ahsan_dev/widgets/contact_me_button.dart';
import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';
import 'package:flutter/services.dart';
import 'dart:html' as html;

class PDFViewPage extends StatelessWidget {
  final String pdfPath = AppImages.resume;
  PDFViewPage({super.key});
  //
  // Function to download the PDF
  Future<void> _downloadResume() async {
    // Load the PDF file as bytes from the assets
    final byteData = await rootBundle.load(pdfPath);
    final buffer = byteData.buffer.asUint8List();

    // Blob object from the bytes
    final blob = html.Blob([
      html.File([buffer], 'resume.pdf')
    ]);

    // Create an anchor element and trigger the download
    final url = html.Url.createObjectUrlFromBlob(blob);
    final anchor = html.AnchorElement(href: url)
      ..setAttribute('download', 'resume.pdf')
      ..click();

    // Clean up the URL after download
    html.Url.revokeObjectUrl(url);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Container(
              height: 1000,
              width: 700,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black87,
                    blurRadius: .7,
                    offset: Offset(.3, .7),
                  ),
                ],
                borderRadius: BorderRadius.circular(15),
              ),
              child: FutureBuilder<PdfDocument>(
                future: PdfDocument.openAsset(pdfPath),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasError) {
                      return Center(
                          child: Text('Error loading PDF: ${snapshot.error}'));
                    }
                    // Successfully loaded PDF document
                    return PdfView(
                      controller: PdfController(
                        document: Future.value(
                            snapshot.data!), // Wrap PdfDocument in Future.value
                      ),
                      onPageChanged: (page) {
                        debugPrint('Page $page');
                      },
                    );
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return const Center(child: Text('Unexpected error.'));
                  }
                },
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        HoverButton(text: " Download my resume ", onPressed: _downloadResume),
      ],
    );
  }
}
