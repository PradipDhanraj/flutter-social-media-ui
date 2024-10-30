// ignore_for_file: deprecated_member_use, depend_on_referenced_packages

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_social_media_ui/src/common/app_theme_config.dart';
import 'package:flutter_social_media_ui/src/features/feeds/models/feeds_model.dart';
import 'package:flutter_social_media_ui/src/features/feeds/widgets/cache_image_widget.dart';
import 'package:flutter_social_media_ui/src/features/feeds/widgets/common_widgets.dart';
import 'package:video_player/video_player.dart';

class Reels extends StatefulWidget {
  static const routeName = '/reels';
  final Datum datumData;
  const Reels({super.key, required this.datumData});
  @override
  ReelsState createState() => ReelsState();
}

class ReelsState extends State<Reels> {
  late ChewieController chewie;
  late VideoPlayerController videoPlayerController;
  late Future<void> _future;
  @override
  void initState() {
    videoPlayerController = VideoPlayerController.network(widget.datumData.cdnUrl ?? "");
    _future = loadVideoClip();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Positioned buildPosLikeComment() {
      return Positioned(
        bottom: 100,
        right: 10,
        width: 50,
        height: 260,
        child: likeShareCommentSave(widget.datumData),
      );
    }

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        fit: StackFit.expand,
        children: [
          FutureBuilder<void>(
              future: _future,
              builder: (context, snapshot) {
                return videoPlayerController.value.isInitialized
                    ? AspectRatio(
                        aspectRatio: videoPlayerController.value.aspectRatio,
                        child: Chewie(
                          controller: chewie,
                        ),
                      )
                    : Center(
                        child: CacheImage(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        cacheDurationDays: 1,
                        hasBorder: false,
                        imageId: widget.datumData.thumbCdnUrl!,
                        imageUrl: widget.datumData.thumbCdnUrl,
                        shape: BoxShape.rectangle,
                        aspectRatio: widget.datumData.videoAspectRatio,
                      )
                        // Image.network(
                        //   widget.datumData.thumbCdnUrl ?? "",
                        // ),
                        );
                //return Chewie(controller: chewie);
              }), // Video Player
          CommentWithPublisher(widget.datumData),
          buildPosLikeComment()
        ],
      ),
    );
  }

  Future<void> loadVideoClip() async {
    await videoPlayerController.initialize();
    setState(() {
      chewie = ChewieController(
        videoPlayerController: videoPlayerController,
        autoPlay: true,
        looping: true,
        autoInitialize: true,
        showControls: true,
        controlsSafeAreaMinimum: const EdgeInsets.only(bottom: 130),
        aspectRatio: videoPlayerController.value.aspectRatio,
        cupertinoProgressColors: ChewieProgressColors(),
      );
    });
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    chewie.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
    super.dispose();
  }
}
