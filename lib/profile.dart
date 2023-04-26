import 'package:flutter/material.dart';

import 'global.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              flex: 2,
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                      Colors.blue.shade900,
                      Colors.blue.shade700,
                      Colors.blue.shade500,
                      Colors.blue.shade700,
                      Colors.blue.shade900,
                    ])),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 40,
                      foregroundImage: FileImage(Global.pic!),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      Global.name,
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(Global.email, style: TextStyle(color: Colors.white))
                  ],
                ),
              )),
          Expanded(
              flex: 5,
              child: Container(
                padding: EdgeInsets.all(30),
                color: Colors.blue.shade50,
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ListTile(
                        leading: Icon(Icons.person),
                        title: Text("Name"),
                        subtitle: Text(Global.name),
                      ),
                      ListTile(
                        leading: Icon(Icons.call),
                        title: Text("Mobile"),
                        subtitle: Text("+91 ${Global.phone}"),
                      ),
                      ListTile(
                        leading: Icon(Icons.email),
                        title: Text("Email"),
                        subtitle: Text(Global.email),
                      ),
                      ListTile(
                        leading: Icon(Icons.cake),
                        title: Text("DOB"),
                        subtitle: Text(Global.date),
                      ),
                      ListTile(
                        leading: Icon(Icons.male),
                        title: Text("Gender"),
                        subtitle: Text(Global.gender),
                      ),
                      ListTile(
                        leading: Icon(Icons.location_on_outlined),
                        title: Text("Location"),
                        subtitle: Text(Global.address),
                      ),
                      ListTile(
                        leading: Icon(Icons.flag),
                        title: Text("Nationality"),
                        subtitle: Text(Global.nationalities),
                      ),
                      ListTile(
                        leading: Icon(Icons.flag),
                        title: Text("Religion"),
                        subtitle: Text(Global.religion),
                      ),
                      ListTile(
                        leading: Icon(Icons.language),
                        title: Text("Language"),
                        subtitle: Text(Global.language),
                      ),
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
