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
              "name": "Ankita Jha",
              "profileUrl": "assets/profile1.jpg",
              "headline": "Author ",
              "tags":
                  " #nevergiveup #staypositive #staystrong #positiveattitude",
              "description":
                  "The incident I am going to narrate today happened in 2020. At that time my father had a constant stomach ache. As my father lives in Arunachal Pradesh, there was not much scope or the right equipment to diagnose his condition. He was asked to undergo a routine check-up in Delhi.\nHe came to Delhi, and we booked an appointment with a reputed Doctor at a reputed Hospital. (Don't want to mention the name here).\nA number of tests were conducted. All the tests were done within 7-8 days, and we received the reports soon after. We went for Doctor's Consultation with all the reports. And, what the Doctor said was unexpected. He explained that my father was suffering from Gallbladder cancer and he will now have to undergo cancer treatment.Our world was shaken and we were consumed by worry. My mother went into shock, she couldn't believe that a person who never drinks or smokes can get Cancer.It was a difficult time for us, but we had to be strong, take the next step and start the cancer treatment as per the Doctor's suggestion.But before we do, we had to be sure about the diagnosis and line of treatment that's when someone suggested we go for a second opinion. And so we decided to take the opinion of another doctor before starting the treatment.All the tests were performed again on the suggestions of the second Doctor we consulted. Reports came, and we went for the Consultation. The doctor who gave us the second opinion said that my father had a tumour but it wasn't malignant yet. They said they will remove a part of the Gall bladder and the tumours growing around it. Surgery was performed within a week. My father was kept in the hospital for observation for a few days afterwards. It has been two years since then, and he is completely healed and healthy.Before this incident, I didn't know much about the value and importance of a Second Opinion. Why is it important to consult more than one Doctor, and why is it important to be very sure before starting any medical treatment? Now that I am working for a similar product (Second Opinion) I can relate even more to the benefits and value it delivers. I feel happy and proud to be a part of such service to the healthcare community.",
              "isVideoPost": false,
              "comments": "100",
              "video": "",
              "isOnline": true,
              "image": "assets/illperson.png",
              "likes": "800"
            }));
    print(response.statusCode);
    print(response.body);
  }
}
