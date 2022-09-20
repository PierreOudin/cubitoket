import 'package:cubitoket/core/routes/app_routes.dart';
import 'package:cubitoket/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:cubitoket/features/auth/domain/repositories/auth_repository.dart';
import 'package:cubitoket/features/auth/domain/usecases/login/login_usecase.dart';
import 'package:cubitoket/features/auth/presentation/login/cubit/login_cubit.dart';
import 'package:cubitoket/features/auth/presentation/login/view/login_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginModule extends Module {
  @override
  List<Bind> get binds => [
        // Binds for the Cubit
        Bind.factory((i) => LoginCubit(i<LoginUseCase>())),

        // Binds for the usecases
        Bind<LoginUseCase>((i) => LoginUseCase(i())),

        // Binds for the repositories
        Bind<AuthRepository>((i) => AuthRepositoryImpl()),
      ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      "/",
      child: (context, args) => const LoginPage(),
    ),
  ];
}
