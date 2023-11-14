import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:target/src/core/routes/route_generator.dart';
import 'package:target/src/service/navigation_service.dart';
import 'package:target/locator.dart';
import 'package:target/src/stories/information_store.dart';
import 'package:target/src/stories/login_store.dart';

class AppWidget extends StatefulWidget {
  final SharedPreferences preferences;

  const AppWidget(this.preferences);

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<LoginStore>(create: (_) => LoginStore()),
        Provider<InformationStore>(
            create: (_) => InformationStore(widget.preferences)),
      ],
      child: MaterialApp(
        title: 'Target',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          brightness: Brightness.dark,
          primarySwatch: Colors.teal,
        ),
        initialRoute: '/',
        onGenerateRoute: RouteGenerator.router.generator,
        navigatorKey: locator<NavigationService>().navigatorKey,
      ),
    );
  }
}
