import './home_screen/home_list_screen.dart';
import 'package:flutter/material.dart';

class InventorySection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (settings) {
        Widget page;
        switch (settings.name) {
          // case '/add':
          //   page = InventoryAddPage();
          //   break;
          // case '/edit':
          //   page = InventoryEditPage(itemId: settings.arguments as String);
          //   break;
          // case '/details':
          //   page = InventoryDetailsPage(itemId: settings.arguments as String);
          //   break;
          default:
            page = HomeListScreen();
        }

        return MaterialPageRoute(builder: (_) => page);
      },
    );
  }
}