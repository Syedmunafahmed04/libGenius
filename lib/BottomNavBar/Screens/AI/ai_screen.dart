import 'package:flutter/material.dart';
import 'package:libgenius/Global/colors.dart';

class AiScreen extends StatefulWidget {
  const AiScreen({super.key});

  @override
  State<AiScreen> createState() => _AiScreenState();
}

class _AiScreenState extends State<AiScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Ai Screen', style: TextStyle(color: whiteColor)),
      ),
    );
  }
}
