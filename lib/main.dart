// main.dart - STARTER CODE
// GitHub Collaborative Activity: Flutter Team Challenge
// Replace your entire lib/main.dart file with this code

import 'package:flutter/material.dart';

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


class HomePage extends StatelessWidget {
  final void Function(Color) onTheme;

  const HomePage({super.key, required this.onTheme});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TIP: Scaffold gives you a page layout with appBar + body.
      appBar: AppBar(
        // TASK 3: Change the text in the top bar
        // 👉 Replace the AppBar title text with your team name or app name.
        title: Text('MAD collab activity'),
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
                  onPressed: () => onTheme(Colors.blue),
                  child: const Text('Blue'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => onTheme(Colors.green),
                  child: const Text('Green'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => onTheme(Colors.purple),
                  child: const Text('Purple'),
                ),
              ],
            ),
          Text(
              'This is an app that has tabs',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20), // Adds space between widgets
            // TASK 5: Change the subtitle text
            // 👉 Update this smaller subtitle with a brief description.
            Text(
              'You can click a button here',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              // TIP: onPressed runs when the button is tapped.
              onPressed: () {
                print('Button Clicked!');
              },
              // TASK 6: Change the text on the button
              // 👉 Replace the button text with an action label (example: 'Show Info').
              child: Text('Perform action'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green, foregroundColor: Colors.white)
            ),
            Card(
              elevation: 4,
              margin: EdgeInsets.all(16),
              child: Padding(
              padding: EdgeInsets.all(16),
              child: Row(
              children: [
                  Icon(Icons.account_circle, size: 50, color: Colors.pink),
                    SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Omar Lodin', 
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                Text('Major: Computer Science', 
                                  style: TextStyle(color: Colors.grey)),
                                    ],
                              ),
                          ],
                          ),
                            ),
            ),

            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
              },
              child: Text('Created by: Omar Lodin',
              style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic, color: Colors.grey)
              
              )
              )
          
          ],
        ),
      ),
    );
  }
}
