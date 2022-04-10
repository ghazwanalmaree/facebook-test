import 'package:facebook/api_manager.dart';
import 'package:facebook/widget/comment.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:flutter/material.dart';

class FutureBuilderComment extends StatefulWidget {
  const FutureBuilderComment({Key? key}) : super(key: key);

  @override
  State<FutureBuilderComment> createState() => _FutureBuilderCommentState();
}

class _FutureBuilderCommentState extends State<FutureBuilderComment> {
  ApiManager _apiManager = ApiManager();
  Future<dynamic>? _comment;
  List<Widget> listCommment = [];

  @override
  void initState() {
    _comment = _apiManager.getComment();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder<dynamic>(
        future: _comment,
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
            listCommment.add(Comments(
                userComment: "${lorem(paragraphs: 1, words: 2)}",
                imageUserComment: 'https://picsum.photos/id/$i/200/300',
                imageComment: 'https://picsum.photos/id/$i/200/300',
                Comment: "${snapshot.data.data[i]['body']}"));
          }

          return ListView(
            children: listCommment,
          );
        },
      ),
    );
  }
}
