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

      students = snapshot.docs.map((doc) {
        return Student(
          id: doc['id'],
          name: doc['name'],
          degree: doc['degree'],
          createdAt: doc['createdAt'],
        );
      }).toList();

      // Sort students by createdAt in descending order (latest first)
      students.sort((a, b) {
        if (b.createdAt == null && a.createdAt == null) return 0;
        if (b.createdAt == null) return 1;
        if (a.createdAt == null) return -1;
        return (b.createdAt ?? Timestamp(0, 0))
            .compareTo(a.createdAt ?? Timestamp(0, 0));
      });

      return students;
    } catch (e) {
      print(e.toString());
    }

    return students;
  }
}
