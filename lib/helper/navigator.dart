import 'package:flutter/material.dart';

class NavigationService {
  late GlobalKey<NavigatorState> navigationkey;

  static NavigationService instance = NavigationService();

  NavigationService() {
    navigationkey = GlobalKey<NavigatorState>();
  }

  navigate(Widget rn) {
    return navigationkey.currentState!
        .push(MaterialPageRoute(builder: (context) => rn));
  }

  goBack() {
    return navigationkey.currentState!.pop();
  }

  // LETS CREATE LOADER ALSO IN THE SERVICE

  showLoader() {
    Future.delayed(Duration.zero, () {
      showDialog(
          context: navigationkey.currentContext!,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            );
          });
    });
  }
}
