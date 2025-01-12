import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class PDFViewPage extends StatelessWidget {
  final String pdfPath = 'assets/images/resume.pdf';

  const PDFViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PDFView(
      filePath: pdfPath,
      enableSwipe: true,
      swipeHorizontal: true,
      autoSpacing: false,
      pageFling: false,
      onError: (error) {
        debugPrint(error);
      },
      onPageChanged: (page, total) {
        debugPrint('Page $page of $total');
      },
    );
  }
}
