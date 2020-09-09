import 'package:flutter/material.dart';
import 'package:jumio_mobile_sdk_flutter/jumio_mobile_sdk_flutter.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xff045183)
      ),
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


  initAuth()async{
    await JumioMobileSDK.initAuthentication("38ab59d7-2405-4828-bee2-952bdc73012a", "V6Alx9z6ex5rl86dISCO9hJZoDfTyyK2", "US", {
      "enrollmentTransactionReference": "086f0d32-9f69-4924-9031-7b7ab55d22b7",
      //"userReference": "UserReference",
      //"callbackUrl": "URL",
      //"authenticationTransactionReference": "AuthenticationTransactionReference",
    },
        {
          "positiveButtonBackgroundColor":"#045183",
          "negativeButtonBorderColor" :"#045183",
          "foregroundColor":"#045183",
          "scanOverlayBorderColor":"#045183",
          "scanOverlayValidColor":"#045183",
          "scanOverlayInnalidColor":"#045183",
          "scanOverlayStandardColor":"#045183",
        }
    );
  }

  jumioInit() {

    debugPrint("JumioINIT PRESSED");
    JumioMobileSDK.initNetverify("38ab59d7-2405-4828-bee2-952bdc73012a", "V6Alx9z6ex5rl86dISCO9hJZoDfTyyK2", "US", {
      "enableVerification": true,
      "enableIdentityVerification": true,
      "cameraPosition": "back",
      "documentTypes": ["DRIVER_LICENSE", "PASSPORT", "IDENTITY_CARD", "VISA"],
    }, {
      "positiveButtonBackgroundColor":"#045183",
      "negativeButtonBorderColor" :"#045183",
      "foregroundColor":"#045183",
      "scanOverlayBorderColor":"#045183",
      "scanOverlayValidColor":"#045183",
      "scanOverlayInnalidColor":"#045183",
      "scanOverlayStandardColor":"#045183",
    }
    );
    

  }

  @override
  void initState() {

//    private String apiToken = "38ab59d7-2405-4828-bee2-952bdc73012a";
//    private String apiSecret = "V6Alx9z6ex5rl86dISCO9hJZoDfTyyK2";

    jumioInit();
    initAuth();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              onPressed: ()async{
                Map<dynamic,dynamic>data =   await JumioMobileSDK.startNetverify();
                debugPrint("JUMIODATA : NETVERITY $data");
              },
              child: Text("Netverify"),
            ),
            RaisedButton(
              onPressed: ()async{
                Map<dynamic,dynamic>data =   await JumioMobileSDK.startAuthentication();
                debugPrint("JUMIODATA : AUTH $data");
              },
              child: Text("Authentication"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          initAuth();
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}

