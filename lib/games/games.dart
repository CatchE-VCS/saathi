import 'package:flutter/material.dart';

import 'games_service.dart';

class Games extends StatelessWidget {
  final _links = ['https://skribbl.io/'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
                child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: _links.map((link) => _urlButton(context, link)).toList(),
    ))));
  }

  Widget _urlButton(BuildContext context, String url) {
    return Container(
        padding: const EdgeInsets.all(20.0),
        child: ElevatedButton(
          child: Text(url),
          onPressed: () => _handleURLButtonPress(context, url),
        ));
  }

  void _handleURLButtonPress(BuildContext context, String url) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => WebViewContainer(url)));
  }
}
