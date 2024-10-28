import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_social_media_ui/src/features/feeds/bloc/feeds_bloc.dart';
import 'package:flutter_social_media_ui/src/features/feeds/view/story.dart';
import 'package:shimmer/shimmer.dart';

class Feeds extends StatefulWidget {
  const Feeds({super.key});
  static const routeName = '/reels';
  @override
  State<Feeds> createState() => _FeedsState();
}

class _FeedsState extends State<Feeds> {
  @override
  void initState() {
    BlocProvider.of<FeedsBloc>(context).add(LoadsFeedsEvent());
    super.initState();
  }

  List<Post> posts = [
    Post(
        username: "Brianne",
        userImage: "https://s3.amazonaws.com/uifaces/faces/twitter/felipecsl/128.jpg",
        postImage: "https://vz-48b5dfd0-3fe.b-cdn.net/e099050d-ad87-47b6-b177-659a19d24a68/thumbnail_25acae55.jpg",
        caption: "Consequatur nihil aliquid omnis consequatur."),
    Post(
        username: "Brianne",
        userImage: "https://s3.amazonaws.com/uifaces/faces/twitter/felipecsl/128.jpg",
        postImage: "https://vz-48b5dfd0-3fe.b-cdn.net/e099050d-ad87-47b6-b177-659a19d24a68/thumbnail_25acae55.jpg",
        caption: "Consequatur nihil aliquid omnis consequatur."),
    Post(
        username: "Brianne",
        userImage: "https://s3.amazonaws.com/uifaces/faces/twitter/felipecsl/128.jpg",
        postImage: "https://vz-48b5dfd0-3fe.b-cdn.net/e099050d-ad87-47b6-b177-659a19d24a68/thumbnail_25acae55.jpg",
        caption: "Consequatur nihil aliquid omnis consequatur."),
    Post(
        username: "Brianne",
        userImage: "https://s3.amazonaws.com/uifaces/faces/twitter/felipecsl/128.jpg",
        postImage: "https://vz-48b5dfd0-3fe.b-cdn.net/e099050d-ad87-47b6-b177-659a19d24a68/thumbnail_25acae55.jpg",
        caption: "Consequatur nihil aliquid omnis consequatur."),
    Post(
        username: "Brianne",
        userImage: "https://s3.amazonaws.com/uifaces/faces/twitter/felipecsl/128.jpg",
        postImage: "https://vz-48b5dfd0-3fe.b-cdn.net/e099050d-ad87-47b6-b177-659a19d24a68/thumbnail_25acae55.jpg",
        caption: "Consequatur nihil aliquid omnis consequatur."),
    Post(
        username: "Brianne",
        userImage: "https://s3.amazonaws.com/uifaces/faces/twitter/felipecsl/128.jpg",
        postImage: "https://vz-48b5dfd0-3fe.b-cdn.net/e099050d-ad87-47b6-b177-659a19d24a68/thumbnail_25acae55.jpg",
        caption: "Consequatur nihil aliquid omnis consequatur."),
    Post(
        username: "Brianne",
        userImage: "https://s3.amazonaws.com/uifaces/faces/twitter/felipecsl/128.jpg",
        postImage: "https://vz-48b5dfd0-3fe.b-cdn.net/e099050d-ad87-47b6-b177-659a19d24a68/thumbnail_25acae55.jpg",
        caption: "Consequatur nihil aliquid omnis consequatur."),
    Post(
        username: "Brianne",
        userImage: "https://s3.amazonaws.com/uifaces/faces/twitter/felipecsl/128.jpg",
        postImage: "https://vz-48b5dfd0-3fe.b-cdn.net/e099050d-ad87-47b6-b177-659a19d24a68/thumbnail_25acae55.jpg",
        caption: "Consequatur nihil aliquid omnis consequatur."),
    Post(
        username: "Brianne",
        userImage: "https://s3.amazonaws.com/uifaces/faces/twitter/felipecsl/128.jpg",
        postImage: "https://vz-48b5dfd0-3fe.b-cdn.net/e099050d-ad87-47b6-b177-659a19d24a68/thumbnail_25acae55.jpg",
        caption: "Consequatur nihil aliquid omnis consequatur."),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: posts.length,
                itemBuilder: (ctx, i) {
                  return Container(
                    color: Colors.white,
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 10,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(40),
                                    child: Image(
                                      image: AssetImage("assets/images/flutter_logo.png"),
                                      //NetworkImage(posts[i].userImage),
                                      width: 40,
                                      height: 40,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(posts[i].username),
                                ],
                              ),
                              IconButton(
                                icon: Icon(Icons.minimize),
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ),

                        FadeInImage(
                          image: NetworkImage(posts[i].postImage),
                          placeholder: AssetImage("assets/images/flutter_logo.png"),
                          width: MediaQuery.of(context).size.width,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.linked_camera),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.comment),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.send),
                                ),
                              ],
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.bookmarks),
                            ),
                          ],
                        ),

                        Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(
                            horizontal: 14,
                          ),
                          child: RichText(
                            softWrap: true,
                            overflow: TextOverflow.visible,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Liked By ",
                                  style: TextStyle(color: Colors.black),
                                ),
                                TextSpan(
                                  text: "Sigmund,",
                                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                                ),
                                TextSpan(
                                  text: " Yessenia,",
                                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                                ),
                                TextSpan(
                                  text: " Dayana",
                                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                                ),
                                TextSpan(
                                  text: " and",
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                                TextSpan(
                                  text: " 1263 others",
                                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ),

                        // caption
                        Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 5,
                          ),
                          child: RichText(
                            softWrap: true,
                            overflow: TextOverflow.visible,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: posts[i].username,
                                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                                ),
                                TextSpan(
                                  text: " ${posts[i].caption}",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ),

                        // post date
                        Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: 14,
                          ),
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Febuary 2020",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
