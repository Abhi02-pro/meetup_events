import 'package:flutter/material.dart';
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
            children: [
              Container(
                width: double.infinity,
                height: 180,
                child: Image.asset(poster, fit: BoxFit.fill),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(left: 3, right: 3, bottom: 5),
                child: Text(title, style: TextStyle(fontSize: 18, color: Theme.of(context).primaryColorDark),),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 3, right: 3, bottom: 5),
                child: Text("Date: $date", style: Theme.of(context).textTheme.bodySmall,),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 3, right: 3, bottom: 5),
                child: Text("Location: $location", style: Theme.of(context).textTheme.bodySmall,),
              ),
              SizedBox(height: 5,)
            ],
          ),
        ),
      ),
    );
  }
}
