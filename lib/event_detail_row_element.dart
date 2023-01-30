import 'package:flutter/material.dart';

class EventDetailRowElement extends StatelessWidget{
  final String title;
  final String content;
  EventDetailRowElement(this.title, this.content);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: RichText(
        text: TextSpan(
            text: "$title: ",
            style: Theme.of(context).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold),
            children: [
              TextSpan(
                text: content,
                style: Theme.of(context).textTheme.bodySmall,
              )
            ]
        ),
      ),
    );
  }

}