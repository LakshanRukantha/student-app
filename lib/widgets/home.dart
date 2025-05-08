import 'package:flutter/material.dart';
import 'package:student_app/screens/create_page.dart';
import 'package:student_app/screens/delete_page.dart';
import 'package:student_app/screens/read_screen.dart';
import 'package:student_app/screens/update_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;
  final PageController pageController = PageController(initialPage: 0);

  List<Widget> list = [
    CreatePage(),
    ReadScreen(),
    UpdatePage(),
    DeletePage(),
    DeletePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: list,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
            pageController.animateToPage(index,
                duration: const Duration(milliseconds: 600),
                curve: Curves.easeInOut);
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.add), label: "Create"),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: "Read"),
          BottomNavigationBarItem(icon: Icon(Icons.edit), label: "Update"),
          BottomNavigationBarItem(icon: Icon(Icons.delete), label: "Delete"),
        ],
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
