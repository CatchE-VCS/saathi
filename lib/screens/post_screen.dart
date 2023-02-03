import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class PostWidget extends StatelessWidget {
  final textController  = TextEditingController();
  final _pc ;
  PostWidget(this._pc, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffebec),
      appBar: PreferredSize(
        preferredSize: Size.fromRadius(35),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: AppBar(
              backgroundColor: const Color(0xffE5D0ED),
              leading:  IconButton(icon: const Icon(Icons.cancel_outlined), onPressed: () => _pc.close(),),
              actions: const [
                IconButton(onPressed: null, icon: Icon(Icons.access_time_rounded)),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: ElevatedButton(onPressed: null, child: Text("Post", style: TextStyle(color: Colors.white),)),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(9.0),
          child: Column(
            children: [
              TextField(
                maxLength: 700,
                maxLines: 29,
                decoration: InputDecoration(
                  hintText: "What do you want to talk about?",
                ),
                controller: textController,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Container(
                  color: Color(0xffE5D0ED),
                    margin: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: const [
                            IconButton(onPressed: null, icon: Icon(Icons.camera_alt, color: Color(0xff710193),),),
                            IconButton(onPressed: null, icon: Icon(Icons.video_call), color: Color(0xff710193),),
                            IconButton(onPressed: null, icon: Icon(Icons.photo_library_outlined), color: Color(0xff710193),),
                            IconButton(onPressed: null, icon: Text("...", style: TextStyle(color: Color(0xff710193),),)),
                          ],
                        ),

                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Row(
                            children: const [
                              IconButton(onPressed: null, icon: Icon(Icons.message_outlined) , color: Color(0xff710193)),
                              Text("Anyone"),
                            ],
                          ),
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
