import 'package:flutter/cupertino.dart';
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

        backgroundColor: Colors.white,
        title: const Text('كوبونات التخفيضات'),
        actions: [
          if (selectedStoreId != null)
            IconButton(
              color: Colors.purple,

              icon: const Icon(Icons.clear),
              onPressed: () => setState(() => selectedStoreId = null),
              tooltip: 'إعادة تعيين',
            ),
        ],
      ),
      body: Column(

        children: [
          SizedBox(
            height: 100,
            child: StoresList(

              selectedStoreId: selectedStoreId,
              onStoreSelected: (storeId) {
                setState(() {
                  selectedStoreId = storeId; // null يعني عرض الكل
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