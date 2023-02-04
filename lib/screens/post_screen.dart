import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:saathi/controllers/postController.dart';
import 'package:saathi/screens/home/home_screen.dart';
import 'package:saathi/utils/const.dart';

class PostWidget extends StatefulWidget {
  final _pc;
  PostWidget(this._pc, {super.key});

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  final userName = firebaseAuth.currentUser?.displayName;

  final userProfUrl = firebaseAuth.currentUser?.photoURL;

  final textController = TextEditingController();

  Uint8List? _image;

  void selectImage(ImageSource source) async {
    Uint8List im = await Post().pickImage(source);
    setState(() {
      _image = im;
    });
  }

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
              leading: IconButton(
                icon: const Icon(Icons.cancel_outlined),
                onPressed: () {
                  widget._pc.close();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                },
              ),
              actions: [
                IconButton(
                  onPressed: null,
                  icon: Icon(
                    Icons.access_time_rounded,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onPressed: () => Post().addPost(
                          userName, userProfUrl, textController.text, _image),
                      child: Text(
                        "Post",
                        style: TextStyle(color: Colors.white),
                      )),
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
              _image != null
                  ? CircleAvatar(
                      radius: 64,
                      backgroundColor: Colors.black,
                      backgroundImage: MemoryImage(_image!))
                  : Container(),
              ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Container(
                    color: Color(0xffE5D0ED),
                    margin: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            IconButton(
                              onPressed: ()=> selectImage(ImageSource.camera),
                              icon: Icon(
                                Icons.camera_alt,
                                color: Color(0xff710193),
                              ),
                            ),
                            IconButton(
                              onPressed:()=> selectImage(ImageSource.gallery),
                              icon: Icon(Icons.photo_library_outlined),
                              color: Color(0xff710193),
                            ),
                            IconButton(
                                onPressed: null,
                                icon: Text(
                                  "...",
                                  style: TextStyle(
                                    color: Color(0xff710193),
                                  ),
                                )),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Row(
                            children: const [
                              IconButton(
                                  onPressed: null,
                                  icon: Icon(Icons.message_outlined),
                                  color: Color(0xff710193)),
                              Text("Anyone"),
                            ],
                          ),
                        ),
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
