import 'package:flutter/material.dart';
import 'package:flutter_social_media_ui/src/dependency_injection.dart';
import 'src/app.dart';
import 'src/features/settings/settings_controller.dart';

void main() async {
  DIContainer.loadDependencies();
  await DIContainer.DI.get<SettingsController>().loadSettings();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}
