import 'package:flutter/material.dart';
import 'package:flutter_social_media_ui/src/common/app_navigation.dart';
import 'package:flutter_social_media_ui/src/dependency_injection.dart';
import 'package:flutter_social_media_ui/src/features/reels/view/reels.dart';
import 'package:flutter_social_media_ui/src/features/settings/settings_view.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  static const routeName = '/home';
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        children: [
          ElevatedButton(
            onPressed: () async {
              await AppNavigation.navigateTo(Reels.routeName);
            },
            child: const Text('Reels'),
          ),
          ElevatedButton(
            onPressed: () async {
              await AppNavigation.navigateTo(SettingsView.routeName);
            },
            child: const Text('Setting'),
          ),
        ],
      ),
    );
  }
}
