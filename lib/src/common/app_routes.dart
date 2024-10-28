import 'package:flutter/material.dart';
import 'package:flutter_social_media_ui/src/dependency_injection.dart';
import 'package:flutter_social_media_ui/src/features/home/view/home.dart';
import 'package:flutter_social_media_ui/src/features/reels/view/reels.dart';
import 'package:flutter_social_media_ui/src/features/settings/settings_controller.dart';
import 'package:flutter_social_media_ui/src/features/settings/settings_view.dart';

class AppRoutes {
  AppRoutes._();

  static Route<dynamic> generateRoute(RouteSettings settings, {bool isTested = false}) {
    switch (settings.name) {
      case SettingsView.routeName:
        return MaterialPageRoute(
            settings: settings,
            builder: (context) {
              return SettingsView(controller: DIContainer.DI.get<SettingsController>());
            });
      case Home.routeName:
        return MaterialPageRoute(
            settings: settings,
            builder: (context) {
              return const Home();
            });
      case Reels.routeName:
        return MaterialPageRoute(
            settings: settings,
            builder: (context) {
              return const Reels();
            });
      default:
        return MaterialPageRoute(
            settings: settings,
            builder: (context) {
              return const Home();
            });
    }
  }
}
