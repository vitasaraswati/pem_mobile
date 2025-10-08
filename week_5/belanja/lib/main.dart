import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:belanja/pages/home_page.dart';
import 'package:belanja/pages/item_page.dart';
import 'package:belanja/models/item.dart';

void main() {
  runApp(const BelanjaApp());
}

class BelanjaApp extends StatelessWidget {
  const BelanjaApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Konfigurasi router setara dengan routes: { '/': ..., '/item': ... }
    final GoRouter router = GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(path: '/', builder: (context, state) => HomePage()),
        GoRoute(
          path: '/item',
          builder: (context, state) {
            final item = state.extra as Item?;
            return ItemPage(item: item);
          },
        ),
      ],
    );

    // Gantikan MaterialApp() biasa dengan MaterialApp.router()
    return MaterialApp.router(title: 'Belanja', routerConfig: router);
  }
}
