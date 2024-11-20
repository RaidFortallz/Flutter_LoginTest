import 'package:flutter/material.dart';

class Halamankeranjang extends StatefulWidget {
  const Halamankeranjang({super.key});

  @override
  State<Halamankeranjang> createState() => _HalamankeranjangState();
}

class _HalamankeranjangState extends State<Halamankeranjang> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: Text(
        "KERANJANG",
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
