import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.indigo),
        elevation: 0,
        backgroundColor: Colors.white,
        actions: const [
          IconButton(onPressed: null, icon: Icon(Icons.more_vert_outlined)),
        ],
      ),
      body: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)),
            child: Column(children: [
              const Text(
                "My Profile",
                style: TextStyle(fontSize: 30),
              ),
              Column(
                children: [
                  CircleAvatar(
                    child: Image.asset("assets/profile1.jpg"),
                    radius: 25,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Guildhall School of music and drama",
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(3.0),
                    child: Text(
                      "London, UK",
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [Text("Photos"), Text("456")],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [Text("Photos"), Text("456")],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [Text("Photos"), Text("456")],
                        ),
                      )
                    ],
                  )
                ],
              )
            ]),
          ),
          Container(
            height: 400,
            width: 400,
            child: GridView.count(
                mainAxisSpacing: 1,
                crossAxisSpacing: 1,
                childAspectRatio: 1,
                primary: true,
                shrinkWrap: true,
                crossAxisCount: 2,
                children: [
                  Image.asset("assets/profile4.jpg"),
                  Image.asset("assets/profile2.jpg"),
                  Image.asset("assets/profile3.jpg"),
                  Image.asset("assets/profile4.jpg"),
                ]),
          )
        ],
      ),
    );
  }
}
