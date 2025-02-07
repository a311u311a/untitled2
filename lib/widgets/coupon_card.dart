import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import '../models/coupon.dart';

class CouponCard extends StatelessWidget {
  final Coupon coupon;

  const CouponCard({
    super.key,
    required this.coupon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(

      margin: const EdgeInsets.all(12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),


      ),
      elevation: 4,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors:  [
            Colors.white,
            Colors.white,

          ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: Colors.white,
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ],
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: ClipRRect(
                borderRadius: const BorderRadius.all( Radius.circular(12)),
                child: Image.network(
                  coupon.image,
                  height: 150,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Container(
                      height: 150,
                      color: Colors.grey[200],
                      child: const Center(child: CircularProgressIndicator()),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 150,
                      color: Colors.grey[500],
                      child: const Icon(Icons.image_not_supported, size: 50),
                    );
                  },
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.copy,color: Colors.white,

                      ),
                      label: Text('نسخ الكود: ${coupon.code}'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple.shade800,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0),
                        ),
                      ),
                      onPressed: () => _copyCodeToClipboard(context, coupon.code),
                    ),
                  ),

                  const SizedBox(height: 16),

                  Text(
                    coupon.description,
                    style: const TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 16),

                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton.icon(
                          icon: const Icon(Icons.share),
                          label: const Text('مشاركة'),
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () => _shareCoupon(context),
                        ),
                      ),

                      const SizedBox(width: 8),

                      Expanded(
                        child: ElevatedButton.icon(
                          icon: const Icon(Icons.store),
                          label: const Text('زيارة المتجر'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green.shade800,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () => _visitStore(context),
                        ),
                      ),

                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

    );
  }

  void _copyCodeToClipboard(BuildContext context, String code) {
    Clipboard.setData(ClipboardData(text: code));
    QuickAlert.show(
      context: context,
      type: QuickAlertType.success, // نوع التنبيه (نجاح)
      title: 'تم النسخ بنجاح!', // عنوان التنبيه
      text: 'الكود $code جاهز للاستخدام', // نص التنبيه

      confirmBtnText: 'حسناً', // نص زر التأكيد
      confirmBtnColor: Colors.purple, // لون زر التأكيد
    );
  }

  void _shareCoupon(BuildContext context) {
    // يمكنك استخدام حزمة share_plus لمشاركة الكوبون
    // https://pub.dev/packages/share_plus
    // Share.share('استخدم هذا الكود للحصول على خصم: ${coupon.code}');
  }

  void _visitStore(BuildContext context) {
    // يمكنك استخدام Navigator للانتقال لصفحة المتجر
    // Navigator.push(context, MaterialPageRoute(builder: (context) => StorePage(storeId: coupon.storeId)));
  }
}

  void _shareCoupon(BuildContext context) {
    // يمكنك استخدام حزمة share_plus لمشاركة الكوبون
    // https://pub.dev/packages/share_plus
    // Share.share('استخدم هذا الكود للحصول على خصم: ${coupon.code}');
  }

  void _visitStore(BuildContext context) {
    // يمكنك استخدام Navigator للانتقال لصفحة المتجر
    // Navigator.push(context, MaterialPageRoute(builder: (context) => StorePage(storeId: coupon.storeId)));
  }
