import 'package:flutter/material.dart';
import 'package:meetup_events/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'all_events_screen.dart';

class LoginScreen extends StatefulWidget{

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool hidePassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Login")
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.account_circle, size: 100, color: Theme.of(context).primaryColor,),
                SizedBox(height: 20),
                Text("USER LOGIN",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).primaryColor),
                ),
                SizedBox(height: 50,),
                TextFormField(
                  decoration: InputDecoration(
                    label: Text("Username"),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 2),
                      borderRadius: BorderRadius.circular(10)
                    ),
                    prefixIcon: Icon(Icons.person)
                  ),
                ),
                SizedBox(height: 20,),
                TextFormField(
                  decoration: InputDecoration(
                      label: Text("Password"),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(width: 2),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      prefixIcon: Icon(Icons.key),
                      suffixIcon: IconButton(onPressed: () {
                        setState(() {
                          hidePassword = !hidePassword;
                        });
                      }, icon: Icon(hidePassword ? Icons.visibility : Icons.visibility_off))
                  ),
                  obscureText: hidePassword ? true : false,
                ),
                SizedBox(height: 40,),
                ElevatedButton(onPressed: () async {

                  var sharedPrefs = await SharedPreferences.getInstance();
                  sharedPrefs.setBool(MyHomePageState.KEYLOGIN, true);

                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MeetupEvents(),));
                }, child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text("LOGIN"),
                )),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("A New User ?", style: Theme.of(context).textTheme.bodySmall,),
                    TextButton(onPressed: () {

                    }, child: Text("SIGN UP", style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Theme.of(context).primaryColor)))
                  ],
                )
              ],
            ),
          )
        ),
      ),
    );
  }
}