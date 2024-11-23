import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_social_media_ui/src/common/utils.dart';
import 'package:flutter_social_media_ui/src/dependency_injection.dart';
import 'package:flutter_social_media_ui/src/features/feeds/repository/model/feeds_model.dart';
import 'package:flutter_social_media_ui/src/features/feeds/view/reels.dart';
import 'package:flutter_social_media_ui/src/features/feeds/bloc/feeds_bloc.dart';
import 'package:flutter_social_media_ui/src/features/feeds/view/feeds.dart';
import 'package:flutter_social_media_ui/src/features/listingPage/bloc/listing_bloc.dart';
import 'package:flutter_social_media_ui/src/features/settings/bloc/settings_bloc.dart';
import 'package:flutter_social_media_ui/src/features/listingPage/view/listing_page.dart';
import 'package:flutter_social_media_ui/src/features/settings/view/settings_page.dart';

class AppRoutes {
  AppRoutes._();

  static Route<dynamic> generateRoute(RouteSettings settings, {bool isTested = false}) {
    switch (settings.name) {
      case Feeds.routeName:
        return MaterialPageRoute(
            settings: settings,
            builder: (context) {
              return BlocProvider(
                create: (context) => DIContainer.DI.get<FeedsBloc>(),
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
      case ListingPage.routeName:
        return MaterialPageRoute(
            settings: settings,
            builder: (context) {
              return MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create: (context) => ListingBloc(settings.arguments as CategoryType)..add(InitialData()),
                  ),
                ],
                child: const ListingPage(),
              );
            });
      case SettingsPage.routeName:
        return MaterialPageRoute(
            settings: settings,
            builder: (context) {
              return MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create: (context) => SettingsBloc(),
                  ),
                  // BlocProvider(
                  //   create: (context) => DIContainer.DI.get<FeedsBloc>(),
                  // ),
                ],
                child: const SettingsPage(),
              );
            });
      default:
        return MaterialPageRoute(
            settings: settings,
            builder: (context) {
              return BlocProvider(
                create: (context) => FeedsBloc(),
                child: const Feeds(),
              );
            });
    }
  }
}
