import 'package:flutter/material.dart';

class HalamanNotif extends StatefulWidget {
  const HalamanNotif({super.key});

  @override
  State<HalamanNotif> createState() => _HalamanNotifState();
}

class _HalamanNotifState extends State<HalamanNotif> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "NOTIFIKASI",
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
