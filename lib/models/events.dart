import 'package:meetup_events/models/event.dart';

class Events{
  List<Event> _events = [
    Event(
      id: "e1",
      date: "21 Jan 2023",
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Etiam erat velit scelerisque in dictum non consectetur a. In eu mi bibendum neque egestas.",
      location: "Mumbai, Maharashtra",
      poster: "https://cdn.wedevs.com/uploads/2015/08/Meetup.jpg",
      speaker: "Mr. Rajat Kumar",
      time: "7:00pm-8:30pm",
      title: "TedTalk - Engineering As A Career",
    ),
    Event(
      id: "e2",
      date: "12 Oct 2022",
      description: "Nunc non blandit massa enim nec dui nunc mattis enim. Fringilla urna porttitor rhoncus dolor purus non enim. Massa id neque aliquam vestibulum morbi blandit cursus risus at. Aenean euismod elementum nisi quis eleifend quam.",
      location: "Kolkata, West Bengal",
      poster: "https://cdn.wedevs.com/uploads/2015/08/Meetup.jpg",
      speaker: "Mrs. Geeta Joshi",
      time: "11:00am-12:00pm",
      title: "Seminar - Future in Android Development",
    ),
    Event(
      id: "e3",
      date: "2 Nov 2022",
      description: "Nullam vehicula ipsum a arcu cursus vitae congue mauris rhoncus. Ac placerat vestibulum lectus mauris ultrices eros in cursus. Et egestas quis ipsum suspendisse ultrices gravida dictum fusce.",
      location: "Chennai, Tamil Nadu",
      poster: "https://cdn.wedevs.com/uploads/2015/08/Meetup.jpg",
      speaker: "Mr. Bablu Shah",
      time: "9:00am-11:30am",
      title: "Seminar - Opportunities for the fresshers",
    ),
    Event(
      id: "e4",
      date: "19 Dec 2022",
      description: "Pharetra et ultrices neque ornare aenean euismod elementum nisi quis. In hac habitasse platea dictumst quisque sagittis purus. Nulla facilisi nullam vehicula ipsum a arcu. Sit amet commodo nulla facilisi nullam.",
      location: "Banglore, Karnataka",
      poster: "https://cdn.wedevs.com/uploads/2015/08/Meetup.jpg",
      speaker: "Mr. Jagjeevan Goswami",
      time: "9:00pm-10:00pm",
      title: "Seminar - Agricultural Advancement",
    ),
  ];

  List<Event> get events{
    return [..._events];
}

}