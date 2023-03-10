import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  bool isObscurePassword = true;
  List<String> userInterest = [];
  final usernameController = TextEditingController(text: "fake_user");
  final passwordController = TextEditingController(text: "fake_password");
  var addressController = TextEditingController();
  var ageController = TextEditingController();
  var dobController = TextEditingController();
  var cardController = TextEditingController();
  var interestController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("User Profile")),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Icon(
                    Icons.account_circle,
                    size: 100,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                BuildTextField("Usrename", usernameController, false, false),
                BuildTextField("Password", passwordController, true, false),
                BuildTextField("Address", addressController, false, true),
                BuildTextField("Age", ageController, false, true),
                BuildTextField("Birthdate", dobController, false, true),
                BuildTextField("Aadhaar/PAN No.", cardController, false, true),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextField(
                    controller: interestController,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              userInterest.add(interestController.text.trim());
                              interestController.clear();
                            });
                          },
                          icon: Icon(Icons.add)),
                      contentPadding: EdgeInsets.only(bottom: 5),
                      labelText: "Add your interests",
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                    ),
                  ),
                ),
                // Container(
                //   child: Text(
                //     "${userInterest.map((e) => e.toString()).toList()}"
                //   ),
                // )
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  child: Container(
                    child: Wrap(
                        children: userInterest
                            .map(
                              (interest) =>
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 5),
                                    child: Chip(
                                        label: Text(interest.toString(), style: Theme.of(context).textTheme.bodySmall,),
                                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                                      backgroundColor: Theme.of(context).primaryColorLight,
                                      deleteIcon: Icon(Icons.cancel),
                                      deleteIconColor: Colors.black45,
                                      onDeleted: () {
                                        setState(() {
                                          userInterest.removeWhere((element) => element.toString() == interest.toString());
                                        });
                                      },
                                    ),
                                  ),
                            )
                            .toList()),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget BuildTextField(
      String labelText, TextEditingController controller, bool isPasswordTextField, bool isEnabled) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: TextField(
        controller: controller,
        enabled: isEnabled,
        // obscureText: isPasswordTextField ? isObscurePassword : false,
        obscureText: false,
        decoration: InputDecoration(
            suffixIcon: isPasswordTextField
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        isObscurePassword = !isObscurePassword;
                      });
                    },
                    icon: Icon(isObscurePassword
                        ? Icons.visibility
                        : Icons.visibility_off))
                : null,
            contentPadding: EdgeInsets.only(bottom: 5),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: controller.text,
            hintStyle: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey)),
      ),
    );
  }
}
