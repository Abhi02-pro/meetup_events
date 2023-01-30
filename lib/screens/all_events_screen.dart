import 'dart:html';

import 'package:flutter/material.dart';
import 'package:meetup_events/event_list_tile.dart';
import 'package:meetup_events/models/events.dart';
import 'package:meetup_events/screens/user_profile_screen.dart';

import 'login_screen.dart';

class MeetupEvents extends StatelessWidget {
  final finalEvents = Events();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meetup Events"),
        actions: [
          IconButton(onPressed: () {

          }, icon: Icon(Icons.qr_code_scanner)),
          IconButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
          }, icon: Icon(Icons.account_circle)),
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
    );
  }
}
