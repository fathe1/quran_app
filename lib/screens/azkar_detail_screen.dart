import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:provider/provider.dart';
import '../model/zekr_model.dart';

class AzkarDetailScreen extends StatelessWidget {
  final String category;
  final List<Zekr> azkar;

  const AzkarDetailScreen({
    super.key,
    required this.category,
    required this.azkar,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        title: Text(
          category,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: azkar.length,
        itemBuilder: (context, index) {
          final zekr = azkar[index];
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.deepPurple.shade100,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.deepPurple.shade300),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  zekr.content,
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "🔁 التكرار: ${zekr.count}",
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
