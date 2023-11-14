import 'package:fluro/fluro.dart';
import 'package:target/src/ui/views/home_view.dart';
import 'package:target/src/ui/views/login_view.dart';

class RouteGenerator {
  static final FluroRouter router = FluroRouter();

  static void configureRoutes() {
    router.define(
      '/',
      handler: _loginHandler,
      transitionType: TransitionType.inFromLeft,
      transitionDuration: const Duration(milliseconds: 600),
    );
    router.define(
      '/home',
      handler: _homeHandler,
      transitionType: TransitionType.inFromRight,
      transitionDuration: const Duration(milliseconds: 600),
    );
  }

  static Handler _loginHandler = Handler(
    handlerFunc: (context, params) => LoginView(),
  );
  static Handler _homeHandler = Handler(
    handlerFunc: (context, params) => HomeView(),
  );
}
