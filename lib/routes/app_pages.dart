
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../modules/home/views/home_view.dart';
import '../modules/home_map/views/home_map_view.dart';
import '../modules/login/views/login_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () =>  HomeView()
    ),
    GetPage(
      name: _Paths.HOME_MAP,
      page: () =>  HomeMap()
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView()
    ),
    
  ];
}
