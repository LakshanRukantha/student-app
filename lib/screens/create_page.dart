import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:student_app/data/datasource.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({super.key});

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final idController = TextEditingController();
  final nameController = TextEditingController();
  final degreeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Create Page",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blueAccent,
        ),
        body: _createWidget());
  }

  _createWidget() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Text(
            "Create Student ➕",
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            textAlign: TextAlign.left,
          ),
          SizedBox(height: 20),
          TextField(
            decoration: InputDecoration(
              labelText: "Id",
              border: OutlineInputBorder(),
            ),
            controller: idController,
          ),
          SizedBox(height: 10),
          TextField(
            decoration: InputDecoration(
              labelText: "Name",
              border: OutlineInputBorder(),
            ),
            controller: nameController,
          ),
          SizedBox(height: 10),
          TextField(
            decoration: InputDecoration(
              labelText: "Degree",
              border: OutlineInputBorder(),
            ),
            controller: degreeController,
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () async {
              Map<String, dynamic> studentInfo = {
                "id": idController.text,
                "name": nameController.text,
                "degree": degreeController.text,
              };

              try {
                await Database()
                    .addStudent(studentInfo, idController.text)
                    .then((value) => {
                          idController.clear(),
                          nameController.clear(),
                          degreeController.clear(),
                          CherryToast.success(
                            title: Text(
                              "Student Created Successfully",
                              style: TextStyle(color: Colors.black),
                            ),
                            toastPosition: Position.bottom,
                          ).show(context),
                        });
              } catch (e) {
                CherryToast.error(
                  title: Text(
                    "Error: ${e.toString()}",
                    style: TextStyle(color: Colors.black),
                  ),
                  toastPosition: Position.bottom,
                ).show(context);
              }
            },
            child: Text(
              "Create Student",
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
          )
        ],
      ),
    );
  }
}
