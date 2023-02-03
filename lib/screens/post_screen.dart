import 'package:flutter/material.dart';

class PostWidget extends StatelessWidget {
  final textController  = TextEditingController();
  PostWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE8EDDB),
      appBar: AppBar(
        backgroundColor: const Color(0xff798154),
        leading: const Icon(Icons.cancel_outlined),
        actions: const [
          IconButton(onPressed: null, icon: Icon(Icons.access_time_rounded)),
          ElevatedButton(onPressed: null, child: Text("Post", style: TextStyle(color: Colors.white),)),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(9.0),
          child: Column(

            children: [
              TextField(
                maxLength: 700,
                maxLines: 30,
                decoration: InputDecoration(
                  hintText: "What do you want to talk about?",
                ),
                controller: textController,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Container(
                    margin: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        IconButton(onPressed: null, icon: Icon(Icons.camera_alt)),
                        IconButton(onPressed: null, icon: Icon(Icons.video_call)),
                        IconButton(onPressed: null, icon: Icon(Icons.photo_library_outlined)),
                        IconButton(onPressed: null, icon: Text("...")),
                        SizedBox(width: 60,),
                        Row(
                          children: [
                            IconButton(onPressed: null, icon: Icon(Icons.message_outlined)),
                            Text("Anyone"),
                          ],
                        ),
                      ],
                    )
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}
