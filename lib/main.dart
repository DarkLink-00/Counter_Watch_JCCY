import '../counter/counter_page.dart';
import 'package:flutter/material.dart';
import 'package:wear/wear.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AmbientMode(
        child: const CounterPage(),
        builder: (context, mode, child) {
          return MaterialApp(
            title: 'Counter wear',
            theme: ThemeData(
                visualDensity: VisualDensity.compact,
                colorScheme: mode == WearMode.active
                    ? const ColorScheme.dark(
                        primary: Color.fromARGB(255, 126, 73, 219),
                      )
                    : const ColorScheme.dark(
                        primary: Colors.white24,
                        onSurface: Colors.white10,
                      )),
            home: child,
          );
        });
  }
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     title: "SmartWatch Counter",
  //     theme: ThemeData(
  //       primarySwatch: Colors.blue,
  //       visualDensity: VisualDensity.compact,
  //     ),
  //     home: const WatchScreen(),
  //   );
  // }
}

// class WatchScreen extends StatelessWidget {
//   const WatchScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return WatchShape(builder: (context, shape, child) {
//       return AmbientMode(
//         builder: (context, mode, child) => const CounterPage(),
//       );
//     });
//   }
// }