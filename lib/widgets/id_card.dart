import 'package:flutter/material.dart';
import '../id_data.dart';
import 'glass_container.dart';
import 'id_header.dart';
import 'id_body.dart';

class IdCard extends StatelessWidget {
  final IdData data;
  final VoidCallback onBack;

  const IdCard({super.key, required this.data, required this.onBack});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GlassContainer(
            width: 350,
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IdHeader(data: data),
                const SizedBox(height: 25),
                const Divider(color: Colors.white12, thickness: 1),
                const SizedBox(height: 25),
                IdBody(data: data),
              ],
            ),
          ),
          const SizedBox(height: 20),
          TextButton.icon(
            onPressed: onBack,
            icon: const Icon(Icons.arrow_back, color: Colors.white70),
            label: const Text(
              "Create New",
              style: TextStyle(color: Colors.white70),
            ),
          ),
        ],
      ),
    );
  }
}
