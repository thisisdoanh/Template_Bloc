import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:template_bloc/di/di.config.dart';

final getIt = GetIt.instance;

@InjectableInit(preferRelativeImports: false)
Future<void> configureDependencies() async => getIt.init();