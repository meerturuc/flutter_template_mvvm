import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_template/core/components/card/not_found_navigation.dart';
import 'package:flutter_template/core/constants/navigation/navigation_constants.dart';
import 'package:flutter_template/view/authenticate/test/view/test_view.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute.init();
  static NavigationRoute get instance => _instance;

  NavigationRoute.init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.TEST_VIEW:
        return normalNavigate(TestsView());

      default:
        return MaterialPageRoute(
          builder: (context) => NotFoundNavigationWidget(),
        );
    }
  }

  MaterialPageRoute normalNavigate(Widget widget) {
    return MaterialPageRoute(
      builder: (context) => widget,
    );
  }
}
