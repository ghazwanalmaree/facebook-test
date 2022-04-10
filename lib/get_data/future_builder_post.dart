import 'package:facebook/api_manager.dart';
import 'package:facebook/widget/post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';

class FutureBuilderPosts extends StatefulWidget {
  @override
  State<FutureBuilderPosts> createState() => _FutureBuilderPostsState();
}

class _FutureBuilderPostsState extends State<FutureBuilderPosts> {
  ApiManager _apiManager = ApiManager();
  Future<dynamic>? _posts;
  List<Widget> listWidget = [];

  @override
  void initState() {
    _posts = _apiManager.getPost();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder<dynamic>(
          future: _posts,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              CircularProgressIndicator();
            }
            if (!snapshot.hasData) {
              return Text('No Data Found');
            }
            for (int i = 0; i < snapshot.data.data.length; i++) {
              if (i == 86 || i == 97) {
                i++;
              }
              listWidget.add(Post(
                  user: '${lorem(paragraphs: 1, words: 2)}',
                  post: "${snapshot.data.data[i]['body']}",
                  photoUser: 'https://picsum.photos/id/$i/200/300',
                  photoPost: 'https://picsum.photos/id/$i/300/300'));
            }
            return ListView(children: listWidget);
          }),
    );
  }
}
