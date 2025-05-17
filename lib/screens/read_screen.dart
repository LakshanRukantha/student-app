import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:student_app/data/datasource.dart';
import 'package:student_app/models/student.dart';

class ReadScreen extends StatefulWidget {
  const ReadScreen({super.key});

  @override
  State<ReadScreen> createState() => _ReadScreenState();
}

class _ReadScreenState extends State<ReadScreen> {
  List<Student> students = [];

  @override
  void initState() {
    super.initState();
    _loadStudents();
  }

  Future<void> _loadStudents() async {
    final loadedStudents = await Database().getStudents();
    setState(() {
      students = loadedStudents;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Read Screen",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text("All Students 📚",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            Expanded(
                child: ListView(
              children: [
                ...students.map(
                  (student) => ListTile(
                    title: Text(student.name),
                    subtitle: Text("Degree: ${student.degree}"),
                    trailing: Icon(Icons.arrow_forward),
                    onTap: () {
                      CherryToast.info(
                        title: Text(
                          "Created at ${student.createdAt?.toDate()}",
                          style: TextStyle(color: Colors.black),
                        ),
                        toastPosition: Position.bottom,
                      ).show(context);
                    },
                  ),
                ),
              ],
            )),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent),
                onPressed: () {
                  _loadStudents();
                  CherryToast.success(
                    title: Text(
                      "Data Refreshed",
                      style: TextStyle(color: Colors.black),
                    ),
                    toastPosition: Position.bottom,
                  ).show(context);
                },
                child: const Text(
                  "Refresh Data",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
