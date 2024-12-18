import 'package:e_ticket_app/shared/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';


class WebPageView extends StatefulWidget {
  const WebPageView({super.key , required this.url}); 
  final String? url ; 

  @override
  State<WebPageView> createState() => _WebPageViewState();
}

class _WebPageViewState extends State<WebPageView> { 

    Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse("https://flutter.dev"))) {
      throw Exception('Could not launch $url');
    }
  } 
 WebViewController controller = WebViewController()
  ..setJavaScriptMode(JavaScriptMode.unrestricted)
  ..setNavigationDelegate(
    NavigationDelegate(
      onProgress: (int progress) {
        // Update loading bar.
      },
      onPageStarted: (String url) {},
      onPageFinished: (String url) {},
      onHttpError: (HttpResponseError error) {},
      onWebResourceError: (WebResourceError error) {},
      onNavigationRequest: (NavigationRequest request) {
        if (request.url.startsWith('https://www.youtube.com/')) {
          return NavigationDecision.prevent;
        }
        return NavigationDecision.navigate;
      },
    ),
  )
  ..loadRequest(Uri.parse('https://flutter.dev'));

 

  @override
  Widget build(BuildContext context) { 
    return Scaffold(
      appBar: CustomDarkAppBar(
        title: widget.url ?? 'https://flutter.dev',
        iconBack: Icons.close, 
      
        
        actions: [
          IconButton(
            onPressed: (){
               _launchUrl('https://flutter.dev');
            }
          , icon: const Icon(
             Icons.open_in_browser , 
             color: Colors.white,
             size: 30.0,
             
          ))
        ],
      ), 
      body: WebViewWidget( 
          controller: controller,
        ),
    ) ; 
  }
}