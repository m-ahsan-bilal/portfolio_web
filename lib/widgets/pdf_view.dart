import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class PDFViewPage extends StatelessWidget {
  final String pdfPath = 'assets/images/resume.pdf';

  const PDFViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 700,
      width: 500,
      constraints: const BoxConstraints(),
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.all(15),
      decoration: const BoxDecoration(
          color: Colors.white,
          // border: Border.all(color: Colors.black87),
          // shape: BoxShape.rectangle,
          boxShadow: [
            BoxShadow(
                color: Colors.black87, blurRadius: .7, offset: Offset(.3, .7)
                // blurStyle: BlurStyle.outer,
                ),
          ]),
    );
    //  PDFView(
    //   filePath: pdfPath,
    //   enableSwipe: true,
    //   swipeHorizontal: true,
    //   autoSpacing: false,
    //   pageFling: false,
    //   onError: (error) {
    //     debugPrint(error);
    //   },
    //   onPageChanged: (page, total) {
    //     debugPrint('Page $page of $total');
    //   },
    // );
  }
}
