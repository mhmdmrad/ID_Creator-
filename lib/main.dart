import 'package:flutter/material.dart';
import 'id_data.dart';
import 'widgets/id_creation_form.dart';
import 'widgets/id_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(
          0xFF1E1E2E,
        ), // Darker, cleaner background
        fontFamily: 'Roboto',
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  IdData? _userData;

  void _handleCreate(IdData data) {
    setState(() {
      _userData = data;
    });
  }

  void _handleReset() {
    setState(() {
      _userData = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF0D1B2A),
                  Color(0xFF1B263B),
                  Color(0xFF415A77),
                ],
              ),
            ),
          ),
          SafeArea(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              child: _userData == null
                  ? IdCreationForm(onCreate: _handleCreate)
                  : IdCard(data: _userData!, onBack: _handleReset),
            ),
          ),
        ],
      ),
    );
  }
}
