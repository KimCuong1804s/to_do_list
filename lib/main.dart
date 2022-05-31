import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:to_do_list/presentation/task_page.dart';
import 'package:to_do_list/presentation/update_task_page.dart';
import 'package:to_do_list/presentation/widgets/task_page_creator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const BottomTabbar(),
      routes: {
        "/updatetask": (context) => UpdateTaskPage(),
      },
    );
  }
}

class BottomTabbar extends StatefulWidget {
  const BottomTabbar({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return TabbarState();
  }
}

class TabbarState extends State<BottomTabbar> {

  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      body: IndexedStack(index: pageIndex, children: listScreens()),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: pageIndex,
        onTap: (index) {
          HapticFeedback.lightImpact();
          pageIndex = index;
          setState(() {});
        },
        selectedLabelStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
        unselectedLabelStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.menu, color: pageIndex == 0 ? Colors.orange : Colors.grey),
              label: 'Tasks'),
          BottomNavigationBarItem(
              icon: Icon(Icons.hourglass_empty, color: pageIndex == 1 ? Colors.orange : Colors.grey),
              label: 'InComplete'),
          BottomNavigationBarItem(
              icon: Icon(Icons.check_circle, color: pageIndex == 2 ? Colors.orange : Colors.grey),
              label: 'Completed'),
        ],
      ),
    );
  }
}

List<Widget> listScreens() {
  return [
    TaskPageCreator.allTasksPage(),
    TaskPageCreator.inCompleteTasksPage(),
    TaskPageCreator.completedTasksPage(),
  ];
}

