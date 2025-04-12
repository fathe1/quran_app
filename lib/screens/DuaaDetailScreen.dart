import 'package:flutter/material.dart';
import '../model/zekr_model.dart';

class DuaaDetailScreen extends StatelessWidget {
  final String category;
  final List<Zekr> duaas;

  const DuaaDetailScreen({
    super.key,
    required this.category,
    required this.duaas,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text(
          category,
          style:
              const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: duaas.length,
        itemBuilder: (context, index) {
          final duaa = duaas[index];
          return Card(
            color: const Color(0xFFF3E5F5),
            margin: const EdgeInsets.all(10),
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    duaa.content,
                    textAlign: TextAlign.right,
                    style:
                        const TextStyle(fontSize: 18, color: Color(0xFF4A148C)),
                  ),
                  const SizedBox(height: 8),
                  if (duaa.reference.isNotEmpty)
                    Text(
                      duaa.reference,
                      style:
                          const TextStyle(fontSize: 14, color: Colors.black54),
                      textAlign: TextAlign.right,
                    ),
                  Text(
                    "التكرار: ${duaa.count}",
                    style: const TextStyle(color: Colors.grey),
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
