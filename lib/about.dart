import 'package:flutter/material.dart';

class HalamanAbout extends StatelessWidget {
  const HalamanAbout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About"),
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back)
        ),
      ),
      body: Center(
        child: Container(
          height: 250,
          width: 250,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.blueAccent
          ),
        ),
      ),
    );
    
  }
}