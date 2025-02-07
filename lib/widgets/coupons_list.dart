import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../models/coupon.dart';
import 'coupon_card.dart';
import 'error_message.dart';
import 'loading_indicator.dart';

class CouponsList extends StatelessWidget {
  final String? selectedStoreId;

  const CouponsList({
    super.key,
    this.selectedStoreId,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _getCouponsStream(),
      builder: (context, snapshot) {
        if (snapshot.hasError) return const ErrorMessage(message: 'خطأ في تحميل الكوبونات');
        if (!snapshot.hasData) return const CustomLoadingIndicator();

        if (snapshot.data!.docs.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.discount, size: 64, color: Colors.grey),
                const SizedBox(height: 16),
                Text(
                  selectedStoreId == null
                      ? 'لا توجد كوبونات متاحة'
                      : 'لا توجد كوبونات متاحة لهذا المتجر',
                  style: const TextStyle(fontSize: 18, color: Colors.grey),
                ),
              ],
            ),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.only(bottom: 16),
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context, index) {
            final coupon = Coupon.fromFirestore(snapshot.data!.docs[index]);
            return CouponCard(coupon: coupon);
          },
        );
      },
    );
  }

  Stream<QuerySnapshot> _getCouponsStream() {
    Query couponsQuery = FirebaseFirestore.instance.collection('Coupon');

    // تصفية الكوبونات حسب المتجر المحدد (إذا تم اختيار متجر)
    if (selectedStoreId != null) {
      couponsQuery = couponsQuery.where('storeId', isEqualTo: selectedStoreId);
    }

    return couponsQuery.snapshots();
  }
}