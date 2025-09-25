import 'package:flutter/material.dart';

void main() {
  runApp(const Lab1App());
}

class Lab1App extends StatelessWidget {
  const Lab1App({super.key});

  @override
  Widget build(BuildContext context) {
    final fizzBuzzItems = generateFizzBuzz();
    final reversedExample = reverseStrings(const ['Алма', 'Банан', 'Шие']);

    return MaterialApp(
      title: 'FizzBuzz және Reverse',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('FizzBuzz және Reverse'),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemCount: fizzBuzzItems.length,
                separatorBuilder: (context, index) => const Divider(height: 0),
                itemBuilder: (context, index) => ListTile(
                  leading: Text('${index + 1}'),
                  title: Text(fizzBuzzItems[index]),
                ),
              ),
            ),
            const Divider(thickness: 2),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'reverseStrings функциясының мысалы',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text('Кіріс: Алма, Банан, Шие'),
                  Text('Шығыс: ${reversedExample.join(', ')}'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<String> generateFizzBuzz() {
  final result = <String>[];
  for (var i = 1; i <= 100; i++) {
    if (i % 15 == 0) {
      result.add('FizzBuzz');
    } else if (i % 3 == 0) {
      result.add('Fizz');
    } else if (i % 5 == 0) {
      result.add('Buzz');
    } else {
      result.add(i.toString());
    }
  }
  return result;
}

List<String> reverseStrings(List<String> items) {
  return items.reversed.toList();
}
