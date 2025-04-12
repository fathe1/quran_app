import 'package:flutter/material.dart';

import '../network/duaa_data.dart';
import 'DuaaDetailScreen.dart';

class DuaaCategoriesScreen extends StatelessWidget {
  const DuaaCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text(
          "أدعية إسلامية",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: localDuaas.keys.map((category) {
          return Card(
            color: const Color(0xFFF3E5F5),
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            elevation: 3,
            child: ListTile(
              title: Text(
                category,
                textAlign: TextAlign.right,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF4A148C),
                ),
              ),
              trailing:
                  const Icon(Icons.arrow_forward_ios, color: Color(0xFF7B1FA2)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => DuaaDetailScreen(
                      category: category,
                      duaas: localDuaas[category]!,
                    ),
                  ),
                );
              },
            ),
          );
        }).toList(),
      ),
    );
  }
}
