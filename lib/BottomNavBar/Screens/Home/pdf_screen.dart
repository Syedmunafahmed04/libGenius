import 'package:flutter/material.dart';
import 'package:libgenius/Widgets/my_appbar.dart';
import 'package:no_screenshot/no_screenshot.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfScreen extends StatefulWidget {
  final String pdfUrl, title;

  const PdfScreen({required this.pdfUrl, required this.title});

  @override
  State<PdfScreen> createState() => _PdfScreenState();
}

class _PdfScreenState extends State<PdfScreen> {
  final NoScreenshot _noScreenshot = NoScreenshot.instance;

  @override
  void initState() {
    super.initState();
    _disableScreenshots();
  }

  @override
  void dispose() {
    _enableScreenshots();
    super.dispose();
  }

  Future<void> _disableScreenshots() async {
    bool result = await _noScreenshot.screenshotOff();
    
    debugPrint('Screenshots disabled: $result');
  }

  Future<void> _enableScreenshots() async {
    bool result = await _noScreenshot.screenshotOn();
    debugPrint('Screenshots enabled: $result');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(title: widget.title),
      body: SfPdfViewer.network(widget.pdfUrl, canShowPaginationDialog: true),
    );
  }
}
