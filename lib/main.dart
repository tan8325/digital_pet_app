import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkMode = false; // Track dark mode state

  void toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light(), // Light mode
      darkTheme: ThemeData.dark(), // Dark mode
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light, // Toggle mode
      home: MyHomePage(title: 'Flutter Demo', onToggleTheme: toggleTheme),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  final VoidCallback onToggleTheme;

  const MyHomePage({super.key, required this.title, required this.onToggleTheme});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          IconButton(
            icon: Icon(Icons.brightness_6),
            onPressed: onToggleTheme, // Toggle theme
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('Tap the top-right button to switch themes!'),
          ],
        ),
      ),
    );
  }
}
