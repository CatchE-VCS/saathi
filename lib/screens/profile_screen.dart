import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          IconButton(onPressed: null, icon: Icon(Icons.more_vert_outlined)),
        ],
      ),
      body: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
            child: Column(
              children: [
                const Text("My Profile"),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(child: Image.asset("assets/profile1.jpg")),
                    const Text("Guildhall School of music and drama"),
                    const Text("London, UK"),
                    Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text("Photos"),
                            Text("456")
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text("Photos"),
                            Text("456")
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text("Photos"),
                            Text("456")
                          ],
                        )
                      ],
                    )
                  ],
                )
              ]
            ),
          ),
          Container(
            child: GridView.count(
                mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 4,
              primary: true,
              shrinkWrap: true,
              crossAxisCount: 2,
              children: [
                Image.asset("assets/profile1.jpg"),
                Image.asset("assets/profile2.jpg"),
                Image.asset("assets/profile3.jpg"),
                Image.asset("assets/profile4.jpg"),

              ]
          ),
          )
        ],
      ),
    );
  }
}
