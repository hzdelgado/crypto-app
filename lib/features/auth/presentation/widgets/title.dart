import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class RegisterTitle extends StatelessWidget {
  const RegisterTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text("Registro", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 28),);
  }
}