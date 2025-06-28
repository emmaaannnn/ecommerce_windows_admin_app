import 'package:flutter/material.dart';
import 'inventory/screens/inventory_screen.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();

  WindowOptions windowOptions = const WindowOptions(
    minimumSize: Size(1000, 600), // Set your min width and height here
    center: true,
  );
  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AdminScaffold(),
    );
  }
}

class AdminScaffold extends StatefulWidget {
  @override
  _AdminScaffoldState createState() => _AdminScaffoldState();
}

class _AdminScaffoldState extends State<AdminScaffold> {
  int selectedIndex = 0;

  final List<Widget> sections = [
    InventorySection(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Sidebar navigation
          NavigationRail(
            selectedIndex: selectedIndex,
            onDestinationSelected: (index) {
              setState(() => selectedIndex = index);
            },
            destinations: [
              NavigationRailDestination(
                icon: Icon(Icons.inventory_2),
                label: Text('Inventory'),
              ),
              // NavigationRailDestination(
              //   icon: Icon(Icons.attach_money),
              //   label: Text('Expenses'),
              // ),
            ],
          ),

          // Active section with its own Navigator
          Expanded(
            child: sections[selectedIndex],
          ),
        ],
      ),
    );
  }
}