import 'package:flutter/material.dart';

class TransactionRecapPage extends StatelessWidget {
  const TransactionRecapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Transaction Recap',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _transactionItem('Mie Yamin', '+12.000'),
          _transactionItem('Mie Tumplek', '+12.000'),
          _transactionItem('Nasgor Katsu', '+13.000'),
          _transactionItem('Nasgor Ayam', '+11.000'),

          const SizedBox(height: 20),

          // SUMMARY
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Transaction Summary',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                _SummaryRow('Total Customers', '3'),
                _SummaryRow('Today’s Orders', '12'),
                _SummaryRow('Profits', '18.000'),
                _SummaryRow('Incoming Orders', '4'),
                _SummaryRow('In Process Orders', '4'),
                _SummaryRow('Completed Orders', '4'),
                Divider(),
                _SummaryRow('Total Revenue', '36.000', bold: true),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _transactionItem(String name, String price) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: const Color(0xffFF4D78),
        child: const Icon(Icons.fastfood, color: Colors.white),
      ),
      title: Text(name),
      trailing: Text(price, style: const TextStyle(color: Colors.green)),
    );
  }
}

class _SummaryRow extends StatelessWidget {
  final String label;
  final String value;
  final bool bold;

  const _SummaryRow(this.label, this.value, {this.bold = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Text(
            value,
            style: TextStyle(fontWeight: bold ? FontWeight.bold : null),
          ),
        ],
      ),
    );
  }
}
