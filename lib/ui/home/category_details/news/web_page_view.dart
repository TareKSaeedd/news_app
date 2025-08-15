import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebPageView extends StatefulWidget {
  final String url;
  const WebPageView({super.key, required this.url});

  @override
  State<WebPageView> createState() => _WebPageViewState();
}

class _WebPageViewState extends State<WebPageView> {
  late final WebViewController _controller;
  double _progress = 0;

  @override
  void initState() {
    super.initState();
    _controller =
        WebViewController()
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..setNavigationDelegate(
            NavigationDelegate(
              onProgress: (progress) {
                setState(() => _progress = progress / 100);
              },
            ),
          )
          ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.url)),
      body: Stack(
        children: [
          WebViewWidget(controller: _controller),
          if (_progress < 1) LinearProgressIndicator(value: _progress),
        ],
      ),
    );
  }
}
