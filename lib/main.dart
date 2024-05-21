import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crypto App',
      theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromARGB(255, 30, 30, 30),
          primarySwatch: Colors.yellow,
          appBarTheme: const AppBarTheme(
            backgroundColor: Color.fromARGB(255, 30, 30, 30),
            titleTextStyle: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w700
            )
          ),
          dividerColor: Colors.white10,
          listTileTheme: const ListTileThemeData(iconColor: Colors.white),
          textTheme: TextTheme(
            bodyMedium: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w500, fontSize: 20
            ),
            labelSmall: TextStyle(
                color: Colors.white.withOpacity(0.6),
                fontWeight: FontWeight.w700,
                fontSize: 14
            )
          )),
          routes: {
            '/': (context) => const CryptoListScreen(),
            '/coin': (context) => const CryptoCoinScreen(),
          }
    );
  }
}

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key});

  @override
  State<CryptoListScreen> createState() => _CryptoListScreen();
}

class _CryptoListScreen extends State<CryptoListScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("CryptoCurrenciesList"),
      ),
      body: ListView.separated(
        itemCount: 10,
        separatorBuilder: (context, i) => const Divider(),
        itemBuilder: (context, i) => ListTile(
          leading: SvgPicture.asset("assets/svg/bitcoin-btc-logo.svg",
              height: 30,
              width: 30
          ),
          title: Text(
            "Bitcoin",
            style: theme.textTheme.bodyMedium
          ),
          subtitle: Text(
            '200000\$',
            style: theme.textTheme.labelSmall
          ),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () {
            Navigator.of(context).pushNamed('/coin');
          },
        ),      
      )
    );
  }
}

class CryptoCoinScreen extends StatelessWidget {
  const CryptoCoinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bitcoin"))
    );
  }
}