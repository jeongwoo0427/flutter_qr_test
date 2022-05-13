import 'package:flutter/material.dart';
import 'package:qr_test_app/qr_check_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'QR홈'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String qrResult = '';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '여기에 링크가 뜨게 됩니다.',
            ),
            Text(
              qrResult,
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onPressedFAB,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  //비동기 실행으로 QR화면이 닫히기 전까지 await으로 기다리도록 한다.
  void _onPressedFAB() async {
    dynamic result = await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return QRCheckScreen(eventKeyword: 'userId');
    }));

    if(result != null) {
      setState(() {
        //qr스캐너에서 받은 결과값을 화면의 qrResult 에 적용하도록 한다.
        qrResult = result.toString();
      });
    }
  }
}
