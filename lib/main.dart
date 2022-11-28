import 'package:flutter/material.dart'; // biblioteque pour les interfaces graphique
import 'package:tp/pages/alertdialog.dart';
import 'package:tp/pages/cartevisite.dart';
import 'package:tp/pages/form_article.dart';
import 'package:tp/pages/puzzlepage.dart';
import 'package:tp/pages/randomizer.dart';
import 'package:tp/pages/smart_calculator.dart';
import 'package:tp/widgets/fadetransition.dart';
import 'pages/homepage.dart'; //
import 'widgets/slidertransition.dart'; //

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Root
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(backgroundColor: Colors.black12),
      // home: const HomePage(),
      initialRoute: '/',

      // routes: {
      //   '/puzzle': (context) => const PuzzlePage(),
      //   '/cartevisite': (context) => const CarteVistePage(),
      // },

      onGenerateRoute: (settings) {
        switch (settings.name) {
          case "/":
            return MyFadeTransition(widget: const HomePage());
          case "/alert_dialog":
            return MySlideTransition(
                widget: const AlertDialogPage(),
                direction: AxisDirection.right);
          case "/puzzle":
            return MySlideTransition(
                widget: const PuzzlePage(), direction: AxisDirection.right);
          case "/cartevisite":
            return MySlideTransition(
                widget: const CarteVistePage(), direction: AxisDirection.left);
          case "/randomizer":
            return MySlideTransition(
                widget: const RandomizerPage(), direction: AxisDirection.left);
          case "/form_article":
            return MySlideTransition(
                widget: const FormArticlePage(), direction: AxisDirection.left);
          case "/smart_calculator":
            return MySlideTransition(
                widget: const SmartCalculatorPage(),
                direction: AxisDirection.left);
        }

        return MaterialPageRoute(builder: (_) => const HomePage());
      },
    );
  }
}
