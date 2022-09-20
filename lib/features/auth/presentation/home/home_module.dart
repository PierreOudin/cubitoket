import 'package:cubitoket/core/routes/app_routes.dart';
import 'package:cubitoket/features/auth/presentation/home/view/home_page.dart';
import 'package:cubitoket/features/auth/presentation/login/login_module.dart';
import 'package:cubitoket/features/auth/presentation/signup/signup_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  final List<ModularRoute> routes = [
    //When a module is NOT needed on that page
    ChildRoute(
      AppRoutes.home,
      child: (context, args) => const HomePage(),
    ),

    //When a module is needed on that page
    ModuleRoute(
      AppRoutes.login,
      module: LoginModule(),
    ),
    ModuleRoute(
      AppRoutes.signup,
      module: SignUpModule(),
    ),
  ];
}
