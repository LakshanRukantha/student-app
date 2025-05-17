import 'package:cloud_firestore/cloud_firestore.dart';

class Student {
  final String id;
  final String name;
  final String degree;
  final Timestamp? createdAt;

  Student({
    required this.id,
    required this.name,
    required this.degree,
    this.createdAt,
  });
}
