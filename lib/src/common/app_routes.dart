import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_social_media_ui/src/features/feeds/models/feeds_model.dart';
import 'package:flutter_social_media_ui/src/features/feeds/view/reels.dart';
import 'package:flutter_social_media_ui/src/features/feeds/bloc/feeds_bloc.dart';
import 'package:flutter_social_media_ui/src/features/feeds/view/feeds.dart';

class AppRoutes {
  AppRoutes._();

  static Route<dynamic> generateRoute(RouteSettings settings, {bool isTested = false}) {
    switch (settings.name) {
      case Feeds.routeName:
        return MaterialPageRoute(
            settings: settings,
            builder: (context) {
              return BlocProvider(
                create: (context) => FeedsBloc(),
                child: const Feeds(),
              );
            });
      case Reels.routeName:
        return MaterialPageRoute(
            settings: settings,
            builder: (context) {
              return Reels(
                datumData: settings.arguments as Datum,
              );
            });
      default:
        return MaterialPageRoute(
            settings: settings,
            builder: (context) {
              return const Feeds();
            });
    }
  }
}
