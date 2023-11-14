import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:target/app_widget.dart';
import 'package:target/locator.dart';
import 'package:target/src/core/routes/route_generator.dart';

void main() async {
  setupLocator();
  RouteGenerator.configureRoutes();
  WidgetsFlutterBinding.ensureInitialized();
  final preferences = await SharedPreferences.getInstance();
  runApp(AppWidget(preferences));
}
