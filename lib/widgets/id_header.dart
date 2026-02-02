import 'package:flutter/material.dart';
import '../id_data.dart';

class IdHeader extends StatelessWidget {
  final IdData data;

  const IdHeader({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.cyanAccent, width: 2.0),
            boxShadow: [
              BoxShadow(
                color: Colors.cyanAccent.withOpacity(0.3),
                blurRadius: 15,
                spreadRadius: 2,
              ),
            ],
            gradient: const LinearGradient(
              colors: [Colors.blue, Colors.purple],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: const Icon(Icons.person, size: 40, color: Colors.white),
        ),
        const SizedBox(height: 16),
        Text(
          data.name,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          "Personal ID",
          style: TextStyle(
            fontSize: 14,
            color: Colors.white.withOpacity(0.6),
            letterSpacing: 3.0,
          ),
        ),
      ],
    );
  }
}
