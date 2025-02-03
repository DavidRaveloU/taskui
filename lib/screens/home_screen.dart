import 'package:flutter/material.dart';
import 'package:taskui/widgets/background_squares.dart';
import 'package:taskui/widgets/header_info.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          BackgroundSquares(),
          SafeArea(
              child: Column(
            children: [HeaderInfo(screenWidth: screenWidth)],
          ))
        ],
      ),
    );
  }
}
