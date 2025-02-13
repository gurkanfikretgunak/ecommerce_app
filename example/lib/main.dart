import 'package:example/pages/core_product_card.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ExampleApp());
}

class ExampleApp extends StatelessWidget {
  const ExampleApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Example App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ExamplePage(),
    );
  }
}

class ExamplePage extends StatelessWidget {
  const ExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        // appBar: AppBar(
        //   title: const Text('Example App'),
        // ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CoreMenuCard(
                title: 'Core Product Cards',
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CoreProductPage()));
                },
              )
            ],
          ),
        ));
  }
}

class CoreMenuCard extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  const CoreMenuCard({
    required this.title,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.orange, minimumSize: const Size(300, 45)),
        onPressed: onPressed,
        child: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ));
  }
}
