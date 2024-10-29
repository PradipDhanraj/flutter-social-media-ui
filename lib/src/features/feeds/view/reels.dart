// ignore_for_file: deprecated_member_use, depend_on_referenced_packages

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_social_media_ui/src/features/feeds/widgets/common_widgets.dart';
import 'package:video_player/video_player.dart';

class Reels extends StatefulWidget {
  static const routeName = '/reels';

  const Reels({super.key});

  @override
  ReelsState createState() => ReelsState();
}

final videoPlayerController =
    VideoPlayerController.network('https://vz-48b5dfd0-3fe.b-cdn.net/4c40833c-36bb-4a28-8a30-ebb047dcc7b4/play_480p.mp4');

class ReelsState extends State<Reels> {
  @override
  void initState() {
    loadVideoClip();
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
        child: likeShareCommentSave(),
      );
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Chewie(controller: chewie), // Video Player
          CommentWithPublisher(),
          buildPosLikeComment()
        ],
      ),
    );
  }

  void loadVideoClip() async {
    await videoPlayerController.initialize();
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    chewie.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
    super.dispose();
  }

  final chewie = ChewieController(
    videoPlayerController: videoPlayerController,
    autoPlay: true,
    looping: true,
    allowFullScreen: true,
    autoInitialize: true,
    cupertinoProgressColors: ChewieProgressColors(),
  );
}
