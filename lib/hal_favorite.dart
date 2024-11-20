import 'package:flutter/material.dart';

class HalamanFavorit extends StatefulWidget {
  const HalamanFavorit({super.key});

  @override
  State<HalamanFavorit> createState() => _HalamanFavoritState();
}

class _HalamanFavoritState extends State<HalamanFavorit> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "FAVORITE",
          style: TextStyle(
              fontFamily: "poppinsregular",
              fontSize: 38,
              fontWeight: FontWeight.w600,
              color: Colors.blueAccent),
        ),
      ),
    );
  }
}
