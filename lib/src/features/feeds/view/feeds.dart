import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_social_media_ui/src/common/app_navigation.dart';
import 'package:flutter_social_media_ui/src/common/app_theme_config.dart';
import 'package:flutter_social_media_ui/src/features/feeds/bloc/feeds_bloc.dart';
import 'package:flutter_social_media_ui/src/features/feeds/models/feeds_model.dart';
import 'package:flutter_social_media_ui/src/features/feeds/view/reels.dart';
import 'package:flutter_social_media_ui/src/features/feeds/widgets/cache_image_widget.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
              onTap: () {},
              child: Icon(
                CupertinoIcons.line_horizontal_3,
                size: AppFontSizes.iconSmallSize,
              ),
            ),
          )
        ],
        backgroundColor: AppColors.background,
        title: Text(AppLocalizations.of(context)!.appTitle),
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
                            color: Colors.black,
                            width: double.infinity,
                            height: 100,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            color: Colors.black,
                            width: double.infinity,
                            height: 15,
                          ),
                          const SizedBox(
                            height: 10,
                            width: double.infinity,
                          ),
                          Container(
                            color: Colors.black,
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
                  cacheDurationDays: 10,
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
                InkWell(
                  onTap: () {
                    AppNavigation.navigateTo(
                      Reels.routeName,
                      arguments: feedItem,
                    );
                  },
                  child: Shimmer.fromColors(
                    baseColor: AppColors.textColor,
                    highlightColor: Colors.black,
                    enabled: true,
                    period: const Duration(seconds: 3),
                    child: Row(
                      children: [
                        Text(
                          AppLocalizations.of(context)!.tapToPlay,
                          style: TextStyle(
                            color: AppColors.textColor,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: Icon(
                            Icons.play_circle_fill_outlined,
                            color: AppColors.imageColor,
                          ),
                        ),
                      ],
                    ),
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
            child: Stack(
              children: [
                CacheImage(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  cacheDurationDays: 1,
                  hasBorder: false,
                  imageId: feedItem.thumbCdnUrl!,
                  imageUrl: feedItem.thumbCdnUrl,
                  shape: BoxShape.rectangle,
                  aspectRatio: feedItem.videoAspectRatio,
                ),
                Positioned(
                  right: 10,
                  top: 10,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Text((feedItem.duration / 60).toStringAsFixed(2)),
                    ),
                  ),
                )
              ],
            ),
            // child: FadeInImage(
            //   image: NetworkImage(feedItem.thumbCdnUrl ?? ""),
            //   placeholder: const AssetImage("assets/placeholder.png"),
            //   width: MediaQuery.of(context).size.width,
            // ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(width: 10),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        CupertinoIcons.heart,
                        color: feedItem.isLiked ? Colors.red : AppColors.imageColor,
                      ),
                      Text(
                        "${feedItem.totalLikes}",
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          CupertinoIcons.videocam_circle_fill,
                          color: AppColors.imageColor,
                        ),
                        Text(
                          "${feedItem.totalViews}",
                        ),
                      ],
                    ),
                  ),
                  feedItem.isHideComment != 0
                      ? Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              CupertinoIcons.chat_bubble,
                              color: AppColors.imageColor,
                            ),
                            Text(
                              "${feedItem.totalComments}",
                            ),
                          ],
                        )
                      : const SizedBox(
                          width: 0,
                          height: 0,
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

          // caption
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 0,
            ),
            child: RichText(
              softWrap: true,
              overflow: TextOverflow.visible,
              text: TextSpan(
                children: [
                  // TextSpan(
                  //   text: feedItem.user.username,
                  //   style: TextStyle(
                  //     fontWeight: FontWeight.bold,
                  //     color: AppColors.textColor,
                  //   ),
                  // ),
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
            margin: const EdgeInsets.only(
              left: 14,
              right: 14,
              bottom: 20,
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
