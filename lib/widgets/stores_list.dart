
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../models/store.dart';
import 'error_message.dart';
import 'loading_indicator.dart';

class StoresList extends StatelessWidget {
  final Function(String?) onStoreSelected;
  final String? selectedStoreId;

  const StoresList({
    super.key,
    required this.onStoreSelected,
    this.selectedStoreId,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 10,
      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('stores').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) return const ErrorMessage(message: 'خطأ في تحميل المتاجر');
          if (!snapshot.hasData) return const CustomLoadingIndicator();

          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: snapshot.data!.docs.length + 1, // +1 لزر "عرض الكل"
            itemBuilder: (context, index) {
              if (index == 0) {
                // زر "عرض الكل"
                return _buildShowAllItem(selectedStoreId == null);
              }
              final store = Store.fromFirestore(snapshot.data!.docs[index - 1]);
              return _buildStoreItem(store, selectedStoreId == store.id);
            },
          );
        },
      ),
    );
  }

  Widget _buildStoreItem(Store store, bool isSelected) {
    return GestureDetector(
      onTap: () => onStoreSelected(store.id), // تمرير storeId هنا
      child: Container(


        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(2
        ),
        decoration: BoxDecoration(
          color: isSelected ? Colors.purple.shade50 : Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? Colors.purple : Colors.grey.shade300,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

        ClipRRect(
          borderRadius: BorderRadius.circular(8),
              child: Image.network(
                store.image,
                height: 40,
                width: 80,
                fit: BoxFit.cover,
              alignment: Alignment.center,

                errorBuilder: (context, error, stackTrace) => const Icon(Icons.store),
              ),
            ),
            const SizedBox(height: 4),
            Expanded(
              child: Text(
                store.name,
                style: TextStyle(
                  color: isSelected ? Colors.purple.shade900 : Colors.black87,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildShowAllItem(bool isSelected) {
    return GestureDetector(
      onTap: () => onStoreSelected(null), // null يعني عرض الكل
      child: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSelected ? Colors.purple.shade50 : Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? Colors.purple : Colors.grey.shade300,
            width: isSelected ? 1 : 1,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.all_inclusive, size: 35, color: Colors.purple),
            const SizedBox(height: 4),
            Expanded(
              child: Text(
                'عرض الكل',
                style: TextStyle(
                  color: isSelected ? Colors.purple.shade900 : Colors.black87,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}