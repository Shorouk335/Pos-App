import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BackOfficeView extends StatefulWidget {
  const BackOfficeView({super.key});

  @override
  State<BackOfficeView> createState() => _BackOfficeViewState();
}

class _BackOfficeViewState extends State<BackOfficeView> {
  @override
  initState() {
    super.initState();
    _launchUrl('https://flutter.dev');
  }

  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox() ;
  }
}
