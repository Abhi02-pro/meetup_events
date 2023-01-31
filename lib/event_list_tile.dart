import 'package:flutter/material.dart';
import 'package:meetup_events/event_detail_row_element.dart';
import 'package:meetup_events/screens/event_detail_screen.dart';

class EventListTile extends StatelessWidget {
  final String id;
  final String title;
  final String date;
  final String time;
  final String location;
  final String poster;
  EventListTile(
      this.id,
    this.title,
    this.date,
    this.time,
    this.location,
    this.poster,
  );
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => EventDetails(id),));
        },
        child: Card(
          borderOnForeground: true,
          elevation: 10.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                height: 180,
                child: Image.network(poster, fit: BoxFit.fill),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, bottom: 8, top: 8),
                child: Text(title, style: TextStyle(fontSize: 18, color: Theme.of(context).primaryColorDark), textAlign: TextAlign.center,),
              ),
              EventDetailRowElement("Date", date),
              EventDetailRowElement("Location", location),
              SizedBox(height: 5,)
            ],
          ),
        ),
      ),
    );
  }
}
