import 'package:facebook/widget/button.dart';
import 'package:flutter/material.dart';

class Comments extends StatelessWidget {
  final String userComment;
  final String imageUserComment;
  final String imageComment;
  final String Comment;
  Color _color = Colors.black;

  Comments(
      {required this.userComment,
      required this.imageUserComment,
      required this.imageComment,
      required this.Comment});

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
                                userComment,
                                style: const TextStyle(
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
                                Comment,
                                style: const TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            //for images post
                            Container(
                                width: 250,
                                child: Image.network(
                                  imageComment,
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
                              imageUserComment,
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                          icon: Icons.reply,
                          text: "Reply",
                          onEvent: () {
                            if (_color == Colors.black)
                              _color = Colors.blueAccent;
                            else
                              _color = Colors.black;
                          }),
                      Container(color: Colors.green),
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
