import 'package:flutter/material.dart';
import '../widgets/coupons_list.dart';

class DiscountsScreen extends StatelessWidget {
  const DiscountsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('التخفيضات'),
        backgroundColor: Colors.white,
      ),
      body: const CouponsList(selectedStoreId: null), // عرض جميع الكوبونات
    );
  }
}