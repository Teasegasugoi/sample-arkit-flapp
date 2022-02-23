import 'package:auto_route/auto_route.dart';
import 'package:sample_arkit_flapp/ui/routes/route_path.dart';
import 'package:sample_arkit_flapp/ui/sample/sample_page.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute(
      path: RoutePath.appRouteSample,
      page: SamplePage,
      initial: true,
    ),
  ],
)
class $AppRouter {}
