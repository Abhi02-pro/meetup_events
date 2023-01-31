import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColorDark,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("MEETUP EVENTS", style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white),),
          SizedBox(height: 20,),
          SpinKitThreeBounce(
            color: Colors.white,
            size: 40.0,
          )
        ],
      ),
    );
  }
}
