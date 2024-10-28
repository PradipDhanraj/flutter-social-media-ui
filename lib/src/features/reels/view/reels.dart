import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_social_media_ui/src/features/reels/bloc/reels_bloc.dart';

class Reels extends StatefulWidget {
  const Reels({super.key});
  static const routeName = '/reels';
  @override
  State<Reels> createState() => _ReelsState();
}

class _ReelsState extends State<Reels> {
  @override
  void initState() {
    BlocProvider.of<ReelsBloc>(context).add(LoadsReelsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(),
    );
  }
}
