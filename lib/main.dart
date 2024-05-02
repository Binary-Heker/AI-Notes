import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_page.dart';

void main() {
  runApp(const RootApp());
}

class RootApp extends StatefulWidget {
  const RootApp({Key? key}) : super(key: key);

  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  bool _isDarkMode = false;

  @override
  void initState() {
    super.initState();
    _loadTheme();
  }

  void _loadTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _isDarkMode = (prefs.getBool('isDarkMode') ?? false);
    });
  }

  void _toggleTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _isDarkMode = !_isDarkMode;
      prefs.setBool('isDarkMode', _isDarkMode);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light,
      title: 'AI Notes App',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: GoogleFonts.lato().fontFamily,
        brightness: Brightness.light,
        colorScheme: const ColorScheme.light(
          background: Color(0xFFFFFFFF),
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        fontFamily: GoogleFonts.lato().fontFamily,
        brightness: Brightness.dark,
        colorScheme: const ColorScheme.dark(
          background: Color(0xFF121212),
        ),
      ),
      home: HomePage(toggleTheme: _toggleTheme),
    );
  }
}
