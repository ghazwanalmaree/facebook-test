import 'package:dio/dio.dart';

class ApiManager {
  Future<dynamic> getJsonPlaceHolder() {
    dynamic jsonPlaceHolder = Dio().get('https://jsonplaceholder.typicode.com');
    return jsonPlaceHolder;
  }
  Future<dynamic> getUser() {
    dynamic users = Dio().get('https://jsonplaceholder.typicode.com/users');
    return users;
  }

  Future<dynamic> getPhoto() {
    dynamic photos = Dio().get('https://jsonplaceholder.typicode.com/photos');
    return photos;
  }

  Future<dynamic> getPost() {
    dynamic posts = Dio().get('https://jsonplaceholder.typicode.com/posts');
    return posts;
  }

  Future<dynamic> getComment() {
    dynamic comments =
        Dio().get('https://jsonplaceholder.typicode.com/comments');
    return comments;
  }
}
