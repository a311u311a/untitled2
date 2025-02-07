import 'package:cloud_firestore/cloud_firestore.dart';

class Coupon {
  final String id;
  final String code;
  final String description;
  final String storeId;
  final String image;

  Coupon({
    required this.id,
    required this.code,
    required this.description,
    required this.storeId,
    required this.image,
  });

  factory Coupon.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Coupon(
      id: doc.id,
      code: data['code'] ?? '',
      description: data['description'] ?? '',
      storeId: data['storeId'] ?? '',
      image: data['image'] ?? '',
    );
  }
}