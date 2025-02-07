import 'package:flutter/material.dart';
import '../widgets/coupons_list.dart';
import '../widgets/stores_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? selectedStoreId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('كوبونات')),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 100,
            child: StoresList(
              selectedStoreId: selectedStoreId,
              onStoreSelected: (storeId) {
                setState(() {
                  selectedStoreId = storeId;
                });
              },
            ),
          ),
          Expanded(
            child: CouponsList(selectedStoreId: selectedStoreId),
          ),
        ],
      ),
    );
  }
}