import 'dart:convert';
import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:saathi/models/user_post_model.dart';
import 'package:saathi/utils/const.dart';

class Post {
  // add image to storage
  _uploadImageToStorage(Uint8List? image) async {
    Reference ref = firebaseStorage
        .ref()
        .child('posts')
        .child(firebaseAuth.currentUser!.uid);
    UploadTask uploadTask = ref.putData(image!);
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }

  // pick image
  pickImage(ImageSource source) async {
    final ImagePicker imagePicker = ImagePicker();
    XFile? _file = await imagePicker.pickImage(source: source);
    if (_file != null) {
      return await _file.readAsBytes();
    } else {
      print("No image selected");
    }
  }

  Future<String> addPost(name, profileUrl, description, image) async {
    String downloadUrl;
    if (image != null) {
      downloadUrl = await _uploadImageToStorage(image);
    } else {
      downloadUrl = '';
    }
    var response = await http.post(
        Uri.parse("http://saathi-posts-production.up.railway.app/addPost"),
        body: json.encode({
          "name": name,
          "profileUrl": profileUrl,
          "headline": "Author",
          "tags": "",
          "description": description,
          "isVideoPost": false,
          "comments": "0",
          "video": "",
          "isOnline": true,
          "image": downloadUrl,
          "likes": "0"
        }));
    if (response.statusCode == 200) {
      String data = response.body;
      print(data);
      return data;
    } else {
      print("object");
      return response.body;
    }
  }

  Future<List<PostModel>> getData() async {
    http.Response response = await http
        .get(Uri.parse("http://saathi-posts-production.up.railway.app/posts"));
    if (response.statusCode == 200) {
      String data = response.body;
      return postsFromJson(data);
    } else {
      throw Exception('Failed to load');
    }
  }
}
