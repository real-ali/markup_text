import 'package:flutter/material.dart';
import 'package:flutter_markup_text/flutter_markup_text.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: MarkUpTextInit(),
        ),
      ),
    );
  }
}

class MarkUpTextInit extends StatelessWidget {
  final text = '''
        With @{Markup_Text}, you can take your Flutter app to the next level. 
        Enhance your reading experience by enabling users to jump directly to referenced sections, 
        effortlessly navigate through lengthy documents with deep linking capabilities, 
        or even create interactive educational apps with linked content 
        for a more engaging learning environment.
        The simplicity and flexibility of @{Markup_Text} make it a developer's dream. 
        Seamlessly integrate the package into your Flutter projects and enjoy its intuitive API and 
        extensive customization options. With Markup_Text, you can unlock the power of 
        connected information and offer your users a more efficient and immersive content experience.''';
  const MarkUpTextInit({super.key});

  @override
  Widget build(BuildContext context) {
    return MarkupText(
      text: text,
      marks: [
        Mark("Markup_Text", () {
          print("Some info for Example");
        }),
      ],
      marksStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.blue,
      ),
    );
  }
}
