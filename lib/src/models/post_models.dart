import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:project_5/src/data_layer/user_data.dart'; // Assuming you have a UserData class that holds user information

class PostModel {
  int? id;
  // int? idUser; // New attribute for the user ID
  String? title;
  String? summary;
  String? content;
  String? image;
  String? category;
  String? readingMinutes;
  DateTime? creationDate;
  String? username; // New attribute for the username's name

  PostModel(
      {this.id,
      // this.idUser,
      this.title,
      this.summary,
      this.content,
      this.image,
      this.category,
      this.readingMinutes,
      this.creationDate,
      this.username});
  // Add username in the constructor

  // Factory constructor to create a PostModel from a JSON map
  PostModel.fromJson(Map<String, dynamic> json) {
    // id = json['id'];
    // idUser = json['id_user'];
    title = json['title'];
    summary = json['summary'];
    content = json['content']; // Fixed case to match JSON key
    image = json['image'];
    category = json['category'];
    readingMinutes = json['reading_minutes'];

    // Parse creationDate from JSON as DateTime
    creationDate = json['creation_date'];
    username = json['username'];

    // Set username based on idUser
    //   username = getusernameName(idUser);
    //
  }

  // Convert the PostModel to a JSON map
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    // data['id_user'] = idUser;
    data['title'] = title;
    data['summary'] = summary;
    data['content'] = content;
    data['image'] = image;
    data['category'] = category;
    data['reading_minutes'] = readingMinutes;
    data['creation_date'] = creationDate;
    data['username'] = username;
    return data;
  }

  // Helper method to retrieve the username's name based on idUser
  String? getusernameName(int? userId) {
    // Assuming GetIt is set up to provide access to UserData
    var users = GetIt.I<UserData>().allUser;
 
    users.map(
      (e) => print('uuuuuuuuuuuuuusernammmmmmme  ${e.username}'),
    );
    // print(users[0].username);
    return 'Fa';
  }

  // Format the creationDate
  String getFormattedDate() {
    final DateFormat dateFormat = DateFormat('yyyy-MM-dd • HH:mm');
    return creationDate != null
        ? dateFormat.format(creationDate!)
        : 'Unknown Date';
  }
}
