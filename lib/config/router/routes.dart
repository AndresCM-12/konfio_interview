import 'package:auto_route/auto_route.dart';
import 'package:sh_mobile/config/router/routes.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: DogsRoute.page,
          initial: true,
          path: "/",
        )
      ];
}
