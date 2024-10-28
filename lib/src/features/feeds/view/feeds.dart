import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_social_media_ui/src/features/feeds/bloc/feeds_bloc.dart';

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

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(),
    );
  }
}
