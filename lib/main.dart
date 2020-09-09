import 'package:flutter/material.dart';
import 'package:jumio_mobile_sdk_flutter/jumio_mobile_sdk_flutter.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  jumioInit() {

    debugPrint("JumioINIT PRESSED");
    JumioMobileSDK.initNetverify("38ab59d7-2405-4828-bee2-952bdc73012a", "V6Alx9z6ex5rl86dISCO9hJZoDfTyyK2", "US", {
      "enableVerification": true,
      "enableIdentityVerification": true,
      "cameraPosition": "back",
      "documentTypes": ["DRIVER_LICENSE", "PASSPORT", "IDENTITY_CARD", "VISA"],
    }, {
      "documentSelectionHeaderBackgroundColor":"#045183",
      "positiveButtonBackgroundColor":"#045183",
      "negativeButtonBorderColor" :"#045183",
      "disableBlur": true,
    }
    );
    

  }

  @override
  void initState() {

//    private String apiToken = "38ab59d7-2405-4828-bee2-952bdc73012a";
//    private String apiSecret = "V6Alx9z6ex5rl86dISCO9hJZoDfTyyK2";

    jumioInit();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: ()async{
            Map<dynamic,dynamic>data =   await JumioMobileSDK.startNetverify();
            debugPrint("JUMIODATA $data");
          },
          child: Text("Netverify"),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          jumioInit();
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}

