import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:student_app/models/student.dart';

class Database {
  Future<void> addStudent(Map<String, dynamic> studentInfo, String id) async {
    try {
      await FirebaseFirestore.instance
          .collection('students')
          .doc(id)
          .set(studentInfo);
    } catch (e) {
      print(e.toString());
    }
  }

  Future<List<Student>> getStudents() async {
    List<Student> students = [];

    try {
      QuerySnapshot snapshot =
          await FirebaseFirestore.instance.collection('students').get();

      for (var doc in snapshot.docs) {
        students.add(Student(
          id: doc['id'],
          name: doc['name'],
          degree: doc['degree'],
        ));
      }
    } catch (e) {
      print(e.toString());
    }

    return students;
  }
}
