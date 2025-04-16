import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class OrderDetailBoxLabel extends StatelessWidget {
  final int quantity;
  final String date;
  final String status;
  const OrderDetailBoxLabel(
      {super.key,
      required this.quantity,
      required this.date,
      required this.status});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ContentText(
            text: quantity.toString(),
            color: ColorConstant.instance.neutral4,
            fontSize: 12,
            textAlign: TextAlign.right,
          ),
          ContentText(
            text: date,
            color: ColorConstant.instance.neutral4,
            fontSize: 12,
            textAlign: TextAlign.right,
          ),
          ContentText(
            text: status,
            color: getStatusColor(status),
            fontSize: 12,
            textAlign: TextAlign.right,
          ),
        ],
      ),
    );
  }

  Color getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'pending':
        return const Color(0xFFFACC15);
      case 'processing':
        return const Color(0xFF3B82F6);
      case 'shipped':
        return const Color(0xFFF97316);
      case 'delivered':
        return const Color(0xFF22C55E);
      case 'completed':
        return const Color(0xFF16A34A);
      case 'on-hold':
        return const Color(0xFFD97706);
      case 'cancelled':
        return const Color(0xFFEF4444);
      case 'failed':
        return const Color(0xFFDC2626);
      case 'refunded':
        return const Color(0xFF8B5CF6);
      case 'returned':
        return const Color(0xFF60A5FA);
      default:
        return Colors.grey;
    }
  }
}
