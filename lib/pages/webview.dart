import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class UrlReaderPage extends StatefulWidget {
  final String filePath;
  final String title;
  const UrlReaderPage({super.key, required this.filePath, required this.title});

  @override
  State<UrlReaderPage> createState() => _UrlReaderPageState();
}

class _UrlReaderPageState extends State<UrlReaderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: InAppWebView(
          initialUrlRequest: URLRequest(url: WebUri(widget.filePath))),
    );
  }
}
