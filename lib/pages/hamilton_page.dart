import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HamiltonPage extends StatefulWidget {
  @override
  HamiltonPageState createState() => HamiltonPageState();
}

class HamiltonPageState extends State<HamiltonPage> {
  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl:
          'https://docs.google.com/forms/d/e/1FAIpQLSd-2Cmf2eQGrEgcXyZVMX1kNoGWDMeD3hCLmUg7RHSs9tXQHg/viewform',
    );
  }
}
