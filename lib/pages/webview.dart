import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class UrlReaderPage extends StatefulWidget {
  final String filePath;
  final String title;

  const UrlReaderPage({super.key, required this.filePath, required this.title});

  @override
  State<UrlReaderPage> createState() => _UrlReaderPageState();
}

class _UrlReaderPageState extends State<UrlReaderPage> {
  String localFilePath = "";
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadPDF(widget.filePath);
  }

  Future<void> _loadPDF(String url) async {
    // Check for permissions
    if (await Permission.storage.request().isGranted) {
      try {
        final file = await _downloadFile(url);
        setState(() {
          localFilePath = file.path;
          isLoading = false;
        });
      } catch (e) {
        setState(() {
          isLoading = false;
        });
        _showError("Failed to load the PDF");
      }
    } else {
      _showError("Storage permission is required");
    }
  }

  Future<File> _downloadFile(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final dir = await getApplicationDocumentsDirectory();
      final file = File("${dir.path}/temp.pdf");
      return await file.writeAsBytes(response.bodyBytes);
    } else {
      throw Exception("Failed to download file");
    }
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:
          // isLoading
          //     ? const Center(child: CircularProgressIndicator())
          //     : localFilePath.isNotEmpty
          //         ? PDFView(
          //             filePath: localFilePath,
          //             autoSpacing: true,
          //             enableSwipe: true,
          //             pageSnap: true,
          //             swipeHorizontal: true,
          //             onRender: (_) {},
          //             onError: (error) => _showError("Error loading PDF: $error"),
          //             onPageError: (page, error) =>
          //                 _showError("Error on page $page: $error"),
          //           )
          //         :
          InAppWebView(
        initialUrlRequest: URLRequest(
          url: WebUri(widget.filePath
              // "https://docs.google.com/gview?embedded=true&url=${widget.filePath}",
              // "https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf",
              ),
        ),
        initialOptions: InAppWebViewGroupOptions(
          crossPlatform: InAppWebViewOptions(),
        ),
        onLoadError: (_, __, ___, ____) {
          _showError("Failed to load WebView");
        },
      ),
    );
  }
}
