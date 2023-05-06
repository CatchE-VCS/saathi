import 'package:flutter/material.dart';
import 'package:saathi/utils/const.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget listTile({icon, title}) {
    return Column(
      children: [
        Divider(
          height: 1,
        ),
        ListTile(
          leading: Icon(icon),
          title: Text(title),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
      ],
    );
  }

  // const userName = firebaseAuth.currentUser?.displayName;

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      // appBar: AppBar(
      //   backgroundColor: Colors.blue[100],
      //   elevation: 0.0,
      //   title: Text(
      //     "My Profile",
      //     style: TextStyle(fontSize: 20, color: Colors.black),
      //   ),
      // ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 100,
                color: Colors.blue[100],
              ),
              Container(
                height: 561,
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 15,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: ListView(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: 250,
                          height: 80,
                          padding: EdgeInsets.only(left: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        color: Colors.black),
                                  ),
                                  Text(
                                    "j",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        color: Colors.black),
                                  ),
                                  SizedBox(height: 10),
                                  Text("")
                                ],
                              ),
                              CircleAvatar(
                                radius: 17,
                                // backgroundColor: Colors.blue[100],
                                child: CircleAvatar(
                                  radius: 15,
                                  child:
                                      Icon(Icons.edit, color: Colors.blue[100]),
                                  backgroundColor: Colors.transparent,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    listTile(icon: Icons.shop_outlined, title: "Your Posts"),
                    listTile(
                        icon: Icons.person_outline, title: "Refer To Friends"),
                    listTile(
                        icon: Icons.file_copy_outlined,
                        title: "Terms & Conditions"),
                    listTile(
                        icon: Icons.policy_outlined, title: "Privacy Policies"),
                    listTile(icon: Icons.add_chart, title: "About"),
                    GestureDetector(
                      onTap: () => firebaseAuth.signOut(),
                      child: listTile(
                          icon: Icons.exit_to_app_outlined, title: "Log Out"),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 40,
              left: 25,
            ),
            child: CircleAvatar(
                radius: (52),
                backgroundColor: Colors.white,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset("assets/profile1.jpg"),
                )),
          )
        ],
      ),
    );
  }
}
