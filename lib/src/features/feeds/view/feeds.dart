import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_social_media_ui/src/common/app_navigation.dart';
import 'package:flutter_social_media_ui/src/features/feeds/bloc/feeds_bloc.dart';
import 'package:flutter_social_media_ui/src/features/feeds/view/reels.dart';

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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: BlocBuilder<FeedsBloc, FeedsState>(
            builder: (context, state) {
              return Column(
                children: <Widget>[
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.feedItems.length,
                    itemBuilder: (ctx, i) {
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
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(40),
                                        child: Image(
                                          image: NetworkImage(state.feedItems[i].user.profilePictureCdn),
                                          width: 40,
                                          height: 40,
                                          fit: BoxFit.fitWidth,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(state.feedItems[i].user.username),
                                          Text(state.feedItems[i].user.designation ?? ''),
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
                                arguments: state.feedItems[i],
                              ),
                              child: FadeInImage(
                                image: NetworkImage(state.feedItems[i].thumbCdnUrl),
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
                                      icon: const Icon(Icons.linked_camera),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.comment),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.send),
                                    ),
                                  ],
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.bookmarks),
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
                                text: const TextSpan(
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
                                      text: state.feedItems[i].user.username,
                                      style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                                    ),
                                    TextSpan(
                                      text: " ${state.feedItems[i].title}",
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
                              child: const Text(
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
              );
            },
          ),
        ),
      ),
    );
  }
}
