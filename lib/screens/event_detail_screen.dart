import 'package:flutter/material.dart';
import 'package:meetup_events/models/events.dart';

import '../event_detail_row_element.dart';

class EventDetails extends StatelessWidget {
  final String eventID;
  EventDetails(this.eventID);
  @override
  Widget build(BuildContext context) {
    final event = Events().events.firstWhere((e) => e.id == eventID);
    return Scaffold(
      appBar: AppBar(
        title: Text("Event Detail"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200,
              color: Colors.black12,
              width: double.infinity,
              child: Image.asset(event.poster, fit: BoxFit.cover),
            ),
            Container(
              width: double.infinity,
              color: Colors.black12,
              padding: EdgeInsets.all(10.0),
              child: Text(event.title, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).primaryColorDark),softWrap: true,),
            ),
            Container(
              width: double.infinity,
              color: Colors.black12,
              padding: EdgeInsets.only(left: 15, right: 15, top: 0, bottom: 15),
              child: Text(event.description, style: Theme.of(context).textTheme.bodySmall,softWrap: true,),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  EventDetailRowElement("Speaker", event.speaker),
                  Divider(color: Theme.of(context).primaryColorLight,),
                  EventDetailRowElement("Date", event.date),
                  Divider(color: Theme.of(context).primaryColorLight,),
                  EventDetailRowElement("Time", event.time),
                  Divider(color: Theme.of(context).primaryColorLight,),
                  EventDetailRowElement("Location", event.location),
                  Divider(color: Theme.of(context).primaryColorLight,)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
