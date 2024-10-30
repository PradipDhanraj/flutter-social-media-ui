import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_social_media_ui/src/common/services/network-service/network_overrides.dart';
import 'package:flutter_social_media_ui/src/dependency_injection.dart';
import 'src/app.dart';

void main() async {
  DIContainer.loadDependencies();
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = CustomHttpOverrides();
  runApp(const MyApp());
}
