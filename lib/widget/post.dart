import 'package:facebook/get_data/future_builder_comment.dart';
import 'package:facebook/widget/button.dart';
import 'package:facebook/widget/comment.dart';
import 'package:flutter/material.dart';

class Post extends StatelessWidget {
  final String user;
  final String post;
  final String photoUser;
  final String? photoPost;
  Color _color = Colors.black;

  Post(
      {required this.user,
      required this.post,
      required this.photoUser,
      this.photoPost});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
            ),
            child: Material(
              color: Colors.black12,
              borderRadius: BorderRadius.circular(15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            //for UserName
                            Container(
                              child: Text(
                                user,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            //for Posts
                            Container(
                              width: 250,
                              child: Text(
                                post,
                                style: const TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            //for images post
                            Container(
                                width: 250,
                                child: Image.network(
                                  photoPost!,
                                  fit: BoxFit.cover,
                                ))
                          ],
                        ),
                        padding: EdgeInsets.all(10),
                      ),
                      //for image user
                      Container(
                        width: 70,
                        height: 70,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.network(
                              photoUser,
                              fit: BoxFit.cover,
                            )),
                      ),
                    ],
                  ),
                  const Divider(
                    height: 5,
                    color: Colors.black38,
                    thickness: 1,
                  ),
                  //for Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ButtonText(
                          icon: Icons.thumb_up_alt_outlined,
                          text: "like",
                          onEvent: () {
                            if (_color == Colors.black)
                              _color = Colors.blueAccent;
                            else
                              _color = Colors.black;
                          }),
                      ButtonText(
                          icon: Icons.comment,
                          text: "comment",
                          onEvent: () {
                            Navigator.of(context).push (
                              MaterialPageRoute (
                                builder: (BuildContext context) => FutureBuilderComment(),
                              ),
                            );

                            _color = Colors.black;
                          }),
                      ButtonText(
                          icon: Icons.share_outlined,
                          text: "Share",
                          onEvent: () {}),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          )
        ],
      ),
    );
  }
}
