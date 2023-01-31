import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:meetup_events/event_list_tile.dart';
import 'package:meetup_events/models/events.dart';
import 'package:meetup_events/screens/user_profile_screen.dart';

class MeetupEvents extends StatefulWidget {

  @override
  State<MeetupEvents> createState() => _MeetupEventsState();
}

class _MeetupEventsState extends State<MeetupEvents> {
  final finalEvents = Events();
  var qrResult = "QR Code Result";

  void scanQRCode() async{
    print("QR Scan function called");
    try{
      final qrCode = await FlutterBarcodeScanner.scanBarcode('#ff6666', 'Cancel', true, ScanMode.QR);
      if(!mounted) return;
      setState(() {
        qrResult = qrCode;
      });
      print(qrResult);
      Navigator.push(context, DialogRoute(context: context, builder: (context) {
        return AlertDialog(
          title: Text("QR Scanned Data"),
          content: Text(qrResult),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("CLOSE", style: TextStyle(color: Theme.of(context).primaryColorDark),)
            ),
          ],
        );
      }));

    }
    on PlatformException{
      setState(() {
        qrResult = "Failed to scan QR Code.";
      });
    }
    on FormatException{
      setState(() {
        qrResult = "You pressed the back button before scanning the QR.";
      });
    }
    catch (ex){
      qrResult = "Unknown Error $ex";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meetup Events"),
        actions: [
          IconButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => UserProfile(),));
          },
              icon: Icon(Icons.account_circle),
          ),
        ],
      ),
      body: Container(
        child: ListView.builder(
          itemBuilder: (context, index) => EventListTile(
            finalEvents.events[index].id,
            finalEvents.events[index].title,
            finalEvents.events[index].date,
            finalEvents.events[index].time,
            finalEvents.events[index].location,
            finalEvents.events[index].poster,
          ),
          itemCount: finalEvents.events.length,
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
          scanQRCode();
        },
        child: Icon(Icons.qr_code_scanner,),
        elevation: 10,
      ),

    );
  }
}
