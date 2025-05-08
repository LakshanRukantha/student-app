import 'package:flutter/material.dart';

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
            onPressed: () {
              print("Id: ${idController.text}");
              print("Name: ${nameController.text}");
              print("Degree: ${degreeController.text}");
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
