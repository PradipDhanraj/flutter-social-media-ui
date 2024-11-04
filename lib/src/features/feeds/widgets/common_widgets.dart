import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_social_media_ui/src/common/app_navigation.dart';
import 'package:flutter_social_media_ui/src/features/feeds/repository/model/feeds_model.dart';
import 'package:flutter_social_media_ui/src/features/feeds/widgets/round_image.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Column likeShareCommentSave(Datum data) {
  return Column(
    children: [
      iconDetail(CupertinoIcons.heart, '${data.totalLikes}', isTapped: data.isLiked),
      const SizedBox(height: 25),
      iconDetail(CupertinoIcons.chat_bubble, '${data.totalComments}'),
      const SizedBox(height: 25),
      iconDetail(CupertinoIcons.arrow_turn_up_right, ''),
      const SizedBox(height: 25),
      const Icon(CupertinoIcons.ellipsis_vertical, size: 22, color: Colors.white),
    ],
  );
}

Column iconDetail(IconData icon, String number, {bool isTapped = false}) {
  return Column(
    children: [
      Icon(
        icon,
        size: 33,
        color: isTapped ? Colors.red : Colors.white,
      ),
      Text(
        number,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.white),
      )
    ],
  );
}

class CommentWithPublisher extends StatefulWidget {
  final Datum datumData;
  const CommentWithPublisher(this.datumData, {super.key});

  @override
  State<CommentWithPublisher> createState() => _CommentWithPublisherState();
}

class _CommentWithPublisherState extends State<CommentWithPublisher> {
  @override
  Widget build(BuildContext context) => Column(
        children: [
          const SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              children: [
                InkWell(
                    onTap: () {
                      AppNavigation.goBack();
                    },
                    child: const Icon(CupertinoIcons.arrow_left, color: Colors.white)),
                const SizedBox(width: 20),
                Text(
                  AppLocalizations.of(context)!.reelsText,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                ),
                const Spacer(),
                const Icon(CupertinoIcons.camera, color: Colors.white),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 40.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    widget.datumData.user.profilePictureCdn == null
                        ? const Icon(
                            CupertinoIcons.person_alt_circle_fill,
                            color: Colors.black,
                          )
                        : circleImage(widget.datumData.user.profilePictureCdn!, 30),
                    const SizedBox(width: 8.0),
                    Text(
                      widget.datumData.user.username ?? "",
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(color: Colors.white),
                    ),
                    const SizedBox(width: 8.0),
                    Padding(
                      padding: const EdgeInsets.only(right: 40),
                      child: Text(
                        widget.datumData.isFollow
                            ? AppLocalizations.of(context)!.followingText
                            : AppLocalizations.of(context)!.followText,
                        style: textStyle.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10.0),
                // Row(
                //   children: [
                //     Text(
                //       widget.datumData,
                //       style: textStyle,
                //     ),
                //     Text(
                //       'more',
                //       style: greyText,
                //     )
                //   ],
                // ),
                // SizedBox(height: 8.0),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        widget.datumData.title ?? "",
                        overflow: TextOverflow.ellipsis,
                        style: textStyle,
                      ),
                    ),
                    rectImage(widget.datumData.thumbCdnUrl ?? "", 35)
                  ],
                ),
              ],
            ),
          )
        ],
      );

  TextStyle greyText = const TextStyle(
    color: Colors.white,
  );

  TextStyle textStyle = const TextStyle(
    color: Colors.white,
    fontSize: 14,
  );
}
