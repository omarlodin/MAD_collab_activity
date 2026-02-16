// main.dart - STARTER CODE
// GitHub Collaborative Activity: Flutter Team Challenge
// Replace your entire lib/main.dart file with this code

import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';


// The main entry point of the app
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeData _theme = ThemeData(
    colorSchemeSeed: Colors.blue,
    useMaterial3: true,
  );

  void _setTheme(Color seed) {
    setState(() {
      _theme = ThemeData(colorSchemeSeed: seed, useMaterial3: true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The Great Collab Project',
      theme: _theme,
      home: HomePage(
        onTheme: _setTheme,
      ),
    );
  }
}



class HomePage extends StatefulWidget {
  final void Function(Color) onTheme;

  const HomePage({
    super.key,
    required this.onTheme,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> _quotes = [
    'Small steps every day add up to big results.',
    'Discipline beats motivation when motivation fades.',
    'Done is better than perfect.',
    'You don’t have to be great to start, but you have to start to be great.',
    'Progress, not perfection.',
    'Keep going — your future self will thank you.',
  ];

  final Random _rand = Random();
  late String _currentQuote;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _currentQuote = _quotes[_rand.nextInt(_quotes.length)];

    _timer = Timer.periodic(
      const Duration(seconds: 5),
      (_) {
        setState(() {
          _currentQuote = _quotes[_rand.nextInt(_quotes.length)];
        });
      },
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MAD collab activity'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Choose a theme:'),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => widget.onTheme(Colors.blue),
                  child: const Text('Blue'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => widget.onTheme(Colors.green),
                  child: const Text('Green'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => widget.onTheme(Colors.purple),
                  child: const Text('Purple'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'This is an app that has tabs',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Text(
              '"$_currentQuote"',
              style: const TextStyle(
                fontSize: 14,
                fontStyle: FontStyle.italic,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            const Text(
              'You can click a button here',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                print('Button Clicked!');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
              ),
              child: const Text('Perform action'),
            ),
            Card(
              elevation: 4,
              margin: const EdgeInsets.all(16),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    const Icon(
                      Icons.account_circle,
                      size: 50,
                      color: Colors.pink,
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Omar Lodin',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                           ),
                        ),
                        Text(
                          'Major: Computer Science',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.coffee , size: 80, color: Colors.amber),
                SizedBox(width: 30),
                Icon(Icons.self_improvement_rounded , size: 80, color: Colors.deepPurple),
                SizedBox(width: 30),
                Icon(Icons.sports_motorsports_sharp , size: 80, color: Colors.red),
                SizedBox(width: 30),
                Icon(Icons.sports_kabaddi , size: 80, color: Colors.blue),
                SizedBox(width: 30),
              ],
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {},
              child: const Text(
                'Created by: Omar Lodin',
                style: TextStyle(
                  fontSize: 12,
                  fontStyle: FontStyle.italic,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
