import 'dart:convert';

import 'package:http/http.dart' as http;

class Post {
  Future<void> login() async {
    // print(password);
    // print(email);
    // print(name);
    // if (password.isNotEmpty && email.isNotEmpty && name.isNotEmpty) {
    var response =
        await http.post(Uri.parse("http://ec87-103-101-118-4.ngrok.io/addPost"),
            body: json.encode({
              "name": "Anonymous",
              "profileUrl": "assets/profile4.jpg",
              "headline": "Breast cancer survivor",
              "tags": "#Hopeiseverything",
              "description":
                  "Some real-life stories define the power of love so strong that we can't resist but believe.They come against all odds to rise and shine with all the powers.They don't focus on posting with respective partners of outing, date, movie, lone drive etc.They keep on paddling in the storm, they dance in the rain that the universe surrender to show them up the rainbow.Exactly one year ago on Valentine's day when Aindrila(Bengali actress) & Sabyasachi(Bengali actor)were preparing for a dinner date, the rule-maker was preparing a bundle of challenges.When she was screaming out of severe pain in her back, the doctor confirmed she met Cancer Attack for the second time.And from that day, there was no special day to love her a little extra.In his opinion, the fight with Aindrila was also his.At the beginning of the treatment, Aindrila was losing all the hope to live.She cried all day, threw away the medicines.The fear of losing the limelight was killing her.Sabyasachi proved that love is a great blend of caring and daring.A caring heart walks more than the extra mile to offer service to the beloved.After the surgery, half of her lungs, the skin of the heart, the pericardium & part of the diaphragm were removed.As per the current update, she is out of danger.His suggestion for the people who don't believe in love is to visit a cancer hospital where thousands of men wait for the arrival of their loved ones.",
              "isVideoPost": false,
              "comments": "1k",
              "video": "",
              "isOnline": true,
              "image": "assets/qwerty.png",
              "likes": "20k"
            }));
    print(response.statusCode);
    print(response.body);
  }

  Future getData() async {
    http.Response response =
        await http.get(Uri.parse("http://ec87-103-101-118-4.ngrok.io/posts"));
    if (response.statusCode == 200) {
      String data = response.body;
      print(jsonDecode(data));
    } else {
      print(response.statusCode);
      print(response.body);
    }
  }
}
