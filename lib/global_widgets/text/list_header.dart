import 'package:flutter/material.dart';

class ListHeader extends StatelessWidget {
  final String title;
  const ListHeader({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(title, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 18),));
  }
}