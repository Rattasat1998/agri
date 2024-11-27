import 'package:agri/utils/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PolicyPage extends StatefulWidget {
  final bool isAccepted;
  const PolicyPage({super.key,  this.isAccepted = true});

  @override
  State<PolicyPage> createState() => _PolicyPageState();
}

class _PolicyPageState extends State<PolicyPage> {


  final controller = WebViewController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse('https://agri-app.extremesofts.com/policy'));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: WebViewWidget(controller: controller),
      bottomNavigationBar: Visibility(
        visible: widget.isAccepted,
        child: BottomAppBar(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [


                CupertinoButton(
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                  child: const Text('ไม่ยอมรับ', style: TextStyle(color: Colors.red)),
                ),
                const SizedBox(width: 16),
                CupertinoButton(
                  color: ThemeConfig.subPrimary,
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                  child: const Text('ยอมรับ', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
