import 'package:cubitoket/core/routes/app_routes.dart';
import 'package:cubitoket/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:cubitoket/features/auth/domain/repositories/auth_repository.dart';
import 'package:cubitoket/features/auth/domain/usecases/signup/sign_up_usecase.dart';
import 'package:cubitoket/features/auth/presentation/signup/cubit/sign_up_cubit.dart';
import 'package:cubitoket/features/auth/presentation/signup/view/sign_up_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SignUpModule extends Module {
  @override
  List<Bind> get binds => [
        // Binds for the Cubit
        Bind.factory((i) => SignUpCubit(i<SignUpUseCase>())),

        // Binds for the usecases
        Bind<SignUpUseCase>((i) => SignUpUseCase(i())),

        // Binds for the repositories
        Bind<AuthRepository>((i) => AuthRepositoryImpl()),
      ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      "/",
      child: (context, args) => const SignUpPage(),
    ),
  ];
}
