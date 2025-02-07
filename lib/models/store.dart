// ملف models/store.dart
import 'package:cloud_firestore/cloud_firestore.dart';

class Store {
  final String id;
  final String name;
  final String image;

  Store({
    required this.id,
    required this.name,
    required this.image,
  });

  factory Store .fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Store(
      id: doc.id,
      name: data['name'] ?? '',
      image: data['image'] ?? '',
    );
  }
}