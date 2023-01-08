import 'package:flutter/material.dart';

class WeaponScreen extends StatefulWidget {
  const WeaponScreen({super.key});

  @override
  State<WeaponScreen> createState() => _WeaponScreenState();
}

class _WeaponScreenState extends State<WeaponScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: Container(),
    );
  }
}
