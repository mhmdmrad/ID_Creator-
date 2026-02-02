import 'package:flutter/material.dart';
import '../id_data.dart';
import 'info_row.dart';

class IdBody extends StatelessWidget {
  final IdData data;

  const IdBody({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InfoRow(label: 'AGE', value: data.age, icon: Icons.access_time),
        InfoRow(label: 'REGION', value: data.region, icon: Icons.map),
        InfoRow(label: 'SEX', value: data.sex, icon: Icons.wc),
      ],
    );
  }
}
