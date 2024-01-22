import 'package:chatify/features/auth/cubit/auth_cubit.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;
Future<void> initServiceLocator() async {
  sl.registerLazySingleton<AuthCubit>(() => AuthCubit());
}
