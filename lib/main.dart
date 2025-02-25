import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:sh_mobile/config/router/routes.dart';
import 'package:sh_mobile/config/utils/injections.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();

  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});
  final AppRouter appRouter = GetIt.instance.get<AppRouter>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter.config(),
    );
  }
}
