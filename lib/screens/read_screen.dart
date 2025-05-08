import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:flutter/material.dart';

class ReadScreen extends StatefulWidget {
  const ReadScreen({super.key});

  @override
  State<ReadScreen> createState() => _ReadScreenState();
}

class _ReadScreenState extends State<ReadScreen> {
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
                ListTile(
                  title: Text("Student 1"),
                  subtitle: Text("Degree: Computer Science"),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () {
                    CherryToast.info(
                      title: Text(
                        "Student 1 Details",
                        style: TextStyle(color: Colors.black),
                      ),
                      toastPosition: Position.bottom,
                    ).show(context);
                  },
                ),
              ],
            )),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent),
                onPressed: () {
                  CherryToast.success(
                    title: Text(
                      "The simplest cherry toast",
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
