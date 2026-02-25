import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';
import 'package:template_bloc/presentation/view/pages/splash/splash_page.dart';

part 'router.gr.dart';

@singleton
@AutoRouterConfig(replaceInRouteName: 'Page|Dialog|Screen,Route')
class AppRouter extends RootStackRouter {
  AppRouter();

  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  final List<AutoRoute> routes = [AutoRoute(page: SplashRoute.page, initial: true)];
}
