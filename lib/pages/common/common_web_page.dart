import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sample/support/route/navigator_util.dart';
import 'package:webview_flutter/webview_flutter.dart';

///
/// author: hefei
/// time  : 2020/10/20
/// desc  : 通用web页
///
class CommonWebPage extends StatefulWidget {
  final String url;
  final String title;

  CommonWebPage({Key key, this.url, this.title}) : super(key: key);

  @override
  _CommonWebPageState createState() => _CommonWebPageState();
}

class _CommonWebPageState extends State<CommonWebPage> {
  String _currentUrl;
  String _currentTitle;

  WebViewController _webViewController;

  @override
  void initState() {
    super.initState();
    _currentUrl = widget.url;
    _currentTitle = widget.title;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _currentTitle,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        centerTitle: true,
        actions: [
          PopupMenuButton(
            onSelected: _onPopSelected,
            itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
              PopupMenuItem<String>(
                value: "refresh",
                child: ListTile(
                  contentPadding: EdgeInsets.all(0.0),
                  dense: false,
                  title: Text('刷新网页'),
                ),
              ),
              PopupMenuItem<String>(
                value: "copy",
                child: ListTile(
                  contentPadding: EdgeInsets.all(0.0),
                  dense: false,
                  title: Text('复制链接'),
                ),
              ),
              PopupMenuItem<String>(
                value: "browser",
                child: ListTile(
                  contentPadding: EdgeInsets.all(0.0),
                  dense: false,
                  title: Text('浏览器打开'),
                ),
              ),
            ],
          ),
        ],
      ),
      body: Container(
        child: IndexedStack(
          children: [
            WebView(
              initialUrl: _currentUrl,
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (WebViewController controller) {
                _webViewController = controller;
              },
              onPageStarted: (String url) {
                print("onPageStarted: $url");
              },
              onPageFinished: (String url) {
                print("onPageFinished: $url");
                _webViewController.evaluateJavascript("document.title").then((title) {
                  setState(() {
                    _currentTitle = title;
                  });
                });
              },
              navigationDelegate: (NavigationRequest navigation) {
                print("navigationDelegate: ${navigation.url}");
                return NavigationDecision.navigate;
              },
            ),
          ],
        ),
      ),
    );
  }

  void _onPopSelected(String value) {
    switch (value) {
      case "refresh":
        _webViewController.reload();
        break;
      case "copy":
        _webViewController
            .currentUrl()
            .then((value) => Clipboard.setData(ClipboardData(text: value)));
        break;
      case "browser":
        NavigatorUtil.goDefaultBrowser(_currentUrl, title: _currentTitle);
        break;
    }
  }
}
