import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_social_media_ui/src/common/app_navigation.dart';
import 'package:flutter_social_media_ui/src/features/feeds/bloc/feeds_bloc.dart';
import 'package:flutter_social_media_ui/src/features/feeds/models/feeds_model.dart';
import 'package:flutter_social_media_ui/src/features/feeds/view/reels.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

class Feeds extends StatefulWidget {
  const Feeds({super.key});
  static const routeName = '/feeds';
  @override
  State<Feeds> createState() => _FeedsState();
}

class _FeedsState extends State<Feeds> {
  @override
  void initState() {
    BlocProvider.of<FeedsBloc>(context).add(LoadsFeedsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SafeArea(
        child: SingleChildScrollView(
          controller: BlocProvider.of<FeedsBloc>(context).feedController,
          child: BlocBuilder<FeedsBloc, FeedsState>(
            builder: (context, state) {
              return Column(
                children: <Widget>[
                  ...state.feedItems.map((e) => PostWidget(e)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      enabled: true,
                      child: Column(
                        children: [
                          Container(
                            color: Colors.red,
                            width: double.infinity,
                            height: 100,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            color: Colors.red,
                            width: double.infinity,
                            height: 15,
                          ),
                          SizedBox(
                            height: 10,
                            width: double.infinity,
                          ),
                          Container(
                            color: Colors.red,
                            width: double.infinity,
                            height: 15,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class PostWidget extends StatelessWidget {
  final Datum feedItem;
  const PostWidget(
    this.feedItem, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    feedItem.user.profilePictureCdn != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(40),
                            child: Image(
                              image: NetworkImage(feedItem.user.profilePictureCdn!),
                              width: 40,
                              height: 40,
                              fit: BoxFit.fitWidth,
                            ),
                          )
                        : const Icon(
                            CupertinoIcons.person_alt_circle_fill,
                            color: Colors.black,
                            size: 40,
                          ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          feedItem.user.username ?? "",
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          feedItem.user.designation ?? '',
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                IconButton(
                  icon: const Icon(Icons.minimize),
                  onPressed: () {},
                ),
              ],
            ),
          ),

          InkWell(
            onTap: () => AppNavigation.navigateTo(
              Reels.routeName,
              arguments: feedItem,
            ),
            child: FadeInImage(
              image: NetworkImage(feedItem.thumbCdnUrl ?? ""),
              placeholder: const AssetImage("assets/placeholder.png"),
              width: MediaQuery.of(context).size.width,
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      CupertinoIcons.heart,
                      color: feedItem.isLiked ? Colors.red : Colors.black,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      CupertinoIcons.chat_bubble,
                      color: Colors.black,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      CupertinoIcons.arrow_turn_up_right,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  !feedItem.isWished ? CupertinoIcons.bookmark : CupertinoIcons.bookmark_fill,
                  color: Colors.black,
                ),
              ),
            ],
          ),

          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(
              horizontal: 14,
            ),
            child: RichText(
              softWrap: true,
              overflow: TextOverflow.visible,
              text: TextSpan(
                children: [
                  const TextSpan(
                    text: "Liked By ",
                    style: TextStyle(color: Colors.black),
                  ),
                  TextSpan(
                    text: "${feedItem.totalLikes}",
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const TextSpan(
                    text: " and",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  const TextSpan(
                    text: " others",
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
          ),

          // caption
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 5,
            ),
            child: RichText(
              softWrap: true,
              overflow: TextOverflow.visible,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: feedItem.user.username,
                    style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  TextSpan(
                    text: " ${feedItem.title}",
                    style: const TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
          ),

          // post date
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 14,
            ),
            alignment: Alignment.topLeft,
            child: Text(
              DateFormat.yMMMMd().format(feedItem.byteAddedOn),
              textAlign: TextAlign.start,
              style: const TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
