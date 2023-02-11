import 'dart:html';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stepper2/profile.dart';

import 'global.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      '/': (context) => const MyApp(),
      'profile': (context) => const Profile()
    },
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final ImagePicker _picker = ImagePicker();

  int val = 0;

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController indianController = TextEditingController();
  TextEditingController religionController = TextEditingController();
  TextEditingController languageController = TextEditingController();

  GlobalKey<FormState> pageKey = GlobalKey();

  dynamic radioVal;

  XFile? image;
  File? photo;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Your Profile"),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Colors.blue.shade900,
              Colors.blue.shade700,
              Colors.blue.shade500,
              Colors.blue.shade700,
              Colors.blue.shade900,
            ],
          )),
        ),
      ),
      body: Form(
        key: pageKey,
        child: Stepper(
          currentStep: val,
          controlsBuilder: (context, _) {
            return Row(
              children: [
                (val == 9)
                    ? ElevatedButton(
                        onPressed: () {
                          if (pageKey.currentState!.validate()) {
                            pageKey.currentState!.save();
                          }
                          Navigator.of(context).pushNamed('profile');
                        },
                        child: const Text(
                          "Add",
                          style: TextStyle(fontSize: 10),
                        ))
                    : ElevatedButton(
                        onPressed: () {
                          setState(() {
                            if (val < 9) {
                              val++;
                            }
                          });
                        },
                        child: (val == 9) ? Text("Add") : Text("Continue")),
                const SizedBox(
                  width: 20,
                ),
                (val != 0)
                    ? OutlinedButton(
                        onPressed: () {
                          setState(() {
                            if (val > 0) {
                              val--;
                            }
                          });
                        },
                        child: const Text("Cancel"))
                    : Container()
              ],
            );
          },
          steps: [
            Step(
                title: const Text("Profile Picture"),
                content: Stack(alignment: Alignment.bottomRight, children: [
                  const CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.blueGrey,
                  ),
                  FloatingActionButton(
                    onPressed: () async {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: const Text("Pick Image"),
                              actions: [
                                ElevatedButton(
                                    onPressed: () async {
                                    //
                                    PickedFile? pic = await ImagePicker().getImage(source: ImageSource.camera);
                                    if(pic != null){
                                   setState(() {
                                     Global.image = File( pic.path);
                                   });}
                                    },
                                    child: const Icon(Icons.camera_alt)),
                                ElevatedButton(
                                    onPressed: () async {
                                      image = await _picker.pickImage(
                                          source: ImageSource.gallery);
                                      setState(() {
                                        photo = File(image!.path);
                                      });
                                      Navigator.of(context).pop();
                                    },
                                    child: const Icon(Icons.photo))
                              ],
                            );
                          });
                    },
                    mini: true,
                    child: const Icon(Icons.add),
                  )
                ])),
            Step(
                title: Text("Name"),
                content: TextFormField(
                  controller: nameController,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "enter name ";
                    }
                  },
                  onSaved: (val) {
                    setState(() {
                      Global.name = val!;
                      print(Global.name);
                    });
                  },
                  decoration: InputDecoration(
                      hintText: 'Dhara Nayani',
                      prefixIcon: Icon(Icons.person_outline)),
                )),
            Step(
                title: Text("Phone"),
                content: TextFormField(
                  controller: phoneController,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "enter mobile number ";
                    }
                  },
                  onSaved: (val) {
                    setState(() {
                      Global.phone = val!;
                      print(Global.phone);
                    });
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: '8877766554',
                      prefixIcon: Icon(Icons.call_outlined),
                      prefixText: '+91'),
                )),
            Step(
                title: Text("Email"),
                content: TextFormField(
                  controller: emailController,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "enter email ";
                    }
                  },
                  onSaved: (val) {
                    setState(() {
                      Global.email = val!;
                      print(Global.email);
                    });
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'dharanayani@gmail.com',
                    prefixIcon: Icon(Icons.email_outlined),
                  ),
                )),
            Step(
                title: Text("DOB"),
                content: TextFormField(
                  controller: dateController,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "enter birth date ";
                    }
                  },
                  onSaved: (val) {
                    setState(() {
                      Global.date = val!;
                      print(Global.date);
                    });
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: '16.08.1997',
                      prefixIcon: Icon(Icons.cake_outlined)),
                )),
            Step(
                title: const Text("Gender"),
                content: Column(
                  children: [
                    RadioListTile(
                      title: const Text("Male"),
                      value: 'male',
                      groupValue: radioVal,
                      onChanged: (val) {
                        setState(() {
                          radioVal = val;
                        });
                      },
                    ),
                    RadioListTile(
                        title: const Text("Female"),
                        value: 'female',
                        groupValue: radioVal,
                        onChanged: (val) {
                          setState(() {
                            radioVal = val;
                          });
                        }),
                  ],
                )),
            Step(
                title: const Text("Current Location"),
                content: TextFormField(
                  controller: addressController,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "enter address ";
                    }
                  },
                  onSaved: (val) {
                    setState(() {
                      Global.address = val!;
                      print(Global.address);
                    });
                  },
                  decoration: InputDecoration(
                    hintText: 'city',
                  ),
                )),
            Step(
                title: Text("Nationalities"),
                content: TextFormField(
                  controller: indianController,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "enter nationality ";
                    }
                  },
                  onSaved: (val) {
                    setState(() {
                      Global.nationalities = val!;
                      print(Global.nationalities);
                    });
                  },
                  decoration: InputDecoration(
                      hintText: 'Indian,Dutch,Germen',
                      prefixIcon: Icon(Icons.flag_outlined)),
                )),
            Step(
                title: Text("Religion"),
                content: TextFormField(
                  controller: religionController,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "enter religion ";
                    }
                  },
                  onSaved: (val) {
                    setState(() {
                      Global.religion = val!;
                      print(Global.religion);
                    });
                  },
                  decoration: InputDecoration(hintText: 'Hindu'),
                )),
            Step(
                title: Text("Language(s)"),
                content: TextFormField(
                  controller: languageController,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "enter languages ";
                    }
                  },
                  onSaved: (val) {
                    setState(() {
                      Global.language = val!;
                      print(Global.language);
                    });
                  },
                  decoration: InputDecoration(
                      hintText: 'Hindi,English',
                      prefixIcon: Icon(Icons.language)),
                )),
          ],
        ),
      ),
    );
  }
}
