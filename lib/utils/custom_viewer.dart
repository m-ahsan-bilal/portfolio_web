import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:io';

class CustomPDFViewer extends StatefulWidget {
  const CustomPDFViewer({super.key});

  @override
  _CustomPDFViewerState createState() => _CustomPDFViewerState();
}

class _CustomPDFViewerState extends State<CustomPDFViewer> {
  String? localPath;
  int totalPages = 0;
  int currentPage = 0;
  final Completer<PDFViewController> _pdfController = Completer();

  @override
  void initState() {
    super.initState();
    loadPDF();
  }

  Future<void> loadPDF() async {
    try {
      // Copy PDF file from assets to a temporary location
      final bytes = await rootBundle.load('assets/images/resume.pdf');
      final dir = await getTemporaryDirectory();
      final file = File('${dir.path}/resume.pdf');
      await file.writeAsBytes(bytes.buffer.asUint8List());
      setState(() {
        localPath = file.path;
      });
    } catch (e) {
      debugPrint('Error loading PDF: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PDF Viewer"),
      ),
      body: localPath == null
          ? const Center(child: CircularProgressIndicator())
          : PDFView(
              filePath: localPath,
              enableSwipe: true,
              swipeHorizontal: false,
              autoSpacing: true,
              pageSnap: true,
              onRender: (pages) {
                setState(() {
                  totalPages = pages!;
                });
              },
              onViewCreated: (PDFViewController pdfViewController) {
                _pdfController.complete(pdfViewController);
              },
              onPageChanged: (current, total) {
                setState(() {
                  currentPage = current!;
                });
              },
            ),
      bottomNavigationBar: localPath != null
          ? BottomAppBar(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Page ${currentPage + 1} of $totalPages",
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            )
          : null,
    );
  }
}
