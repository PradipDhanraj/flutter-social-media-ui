import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_social_media_ui/src/common/app_navigation.dart';
import 'package:flutter_social_media_ui/src/common/app_theme_config.dart';
import 'package:flutter_social_media_ui/src/features/feeds/bloc/feeds_bloc.dart';
import 'package:flutter_social_media_ui/src/features/feeds/models/feeds_model.dart';
import 'package:flutter_social_media_ui/src/features/feeds/view/reels.dart';
import 'package:flutter_social_media_ui/src/features/feeds/widgets/cache_image_widget.dart';
import 'package:flutter_social_media_ui/src/features/settings/settings_view.dart';
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
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          CupertinoIcons.profile_circled,
          size: AppFontSizes.iconSmallSize,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: InkWell(
              onTap: () {
                AppNavigation.navigateTo(SettingsView.routeName);
              },
              child: Icon(
                CupertinoIcons.line_horizontal_3,
                size: AppFontSizes.iconSmallSize,
              ),
            ),
          )
        ],
        backgroundColor: AppColors.background,
        title: const Text('Ulerna'),
      ),
      backgroundColor: AppColors.background,
      body: SafeArea(
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
                      baseColor: AppColors.background,
                      highlightColor: Colors.grey.shade100,
                      period: const Duration(seconds: 2),
                      enabled: true,
                      child: Column(
                        children: [
                          Container(
                            color: Colors.red,
                            width: double.infinity,
                            height: 100,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            color: Colors.red,
                            width: double.infinity,
                            height: 15,
                          ),
                          const SizedBox(
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
      color: AppColors.background,
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
                CacheImage(
                  imageUrl: feedItem.user.profilePictureCdn,
                  height: 40,
                  width: 40,
                  imageId: "${feedItem.user.userId}",
                  cacheinDays: 10,
                  placeholder: Icon(
                    CupertinoIcons.person_alt_circle_fill,
                    color: AppColors.imageColor,
                    size: 40,
                  ),
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
                      style: TextStyle(
                        color: AppColors.textColor,
                      ),
                    ),
                    Text(
                      feedItem.user.designation ?? '',
                      style: TextStyle(
                        color: AppColors.textColor,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Shimmer.fromColors(
                  baseColor: AppColors.textColor,
                  highlightColor: Colors.black,
                  enabled: true,
                  period: Durations.extralong4,
                  child: Row(
                    children: [
                      Text(
                        'Tap to play',
                        style: TextStyle(
                          color: AppColors.textColor,
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.play_circle_fill_outlined,
                          color: AppColors.imageColor,
                        ),
                        onPressed: () {
                          AppNavigation.navigateTo(
                            Reels.routeName,
                            arguments: feedItem,
                          );
                        },
                      ),
                    ],
                  ),
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
                      color: feedItem.isLiked ? Colors.red : AppColors.imageColor,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      CupertinoIcons.chat_bubble,
                      color: AppColors.imageColor,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      CupertinoIcons.arrow_turn_up_right,
                      color: AppColors.imageColor,
                    ),
                  ),
                ],
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  !feedItem.isWished ? CupertinoIcons.bookmark : CupertinoIcons.bookmark_fill,
                  color: AppColors.imageColor,
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
                  TextSpan(
                    text: "Liked By ",
                    style: TextStyle(color: AppColors.textColor),
                  ),
                  TextSpan(
                    text: "${feedItem.totalLikes}",
                    style: TextStyle(
                      color: AppColors.textColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: " and",
                    style: TextStyle(
                      color: AppColors.textColor,
                    ),
                  ),
                  TextSpan(
                    text: " others",
                    style: TextStyle(
                      color: AppColors.textColor,
                    ),
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
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.textColor,
                    ),
                  ),
                  TextSpan(
                    text: " ${feedItem.title}",
                    style: TextStyle(
                      color: AppColors.textColor,
                    ),
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
