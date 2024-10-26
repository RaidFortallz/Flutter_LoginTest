import 'package:flutter/material.dart';
import 'package:jawir/dashboard.dart';

void main() {
  runApp( MaterialApp(
    debugShowCheckedModeBanner: false,
    home: LoginJawir(),
  ));
}

class LoginJawir extends StatelessWidget {
   LoginJawir({super.key});

  final TextEditingController lamunUsernameKosong = TextEditingController();
  final TextEditingController lamunPasswordKosong = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: ListView(
              children: [
                Container(
                  height: 400,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/background.png'),
                          fit: BoxFit.fill)),
                  child: Stack(
                    children: [
                      Positioned(
                          width: 80,
                          height: 190,
                          left: 30,
                          child: Container(
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                              image: AssetImage('assets/images/light-1.png'),
                            )),
                          )),
                      Positioned(
                          width: 80,
                          height: 150,
                          left: 140,
                          child: Container(
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/light-2.png'))),
                          )),
                      Positioned(
                          width: 80,
                          height: 150,
                          right: 30,
                          top: 30,
                          child: Container(
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        AssetImage('assets/images/clock.png'))),
                          )),
                      Positioned(
                          child: Container(
                        margin: const EdgeInsets.only(top: 80),
                        child: const Center(
                          child: Text(
                            "Login",
                            style: TextStyle(
                                fontSize: 40,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                  color: Color.fromRGBO(143, 148, 251, 1),
                                  blurRadius: 2.5,
                                  offset: Offset(0, 0.1))
                            ]),
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Colors.grey[350] ??
                                              Colors.grey))),
                              child: TextField(
                                controller: lamunUsernameKosong,
                                textCapitalization: TextCapitalization.words,
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.person_3_outlined, color: Colors.blueAccent,),
                                    border: InputBorder.none,
                                    hintText: "Username",
                                    hintStyle:
                                        TextStyle(color: Colors.grey[400])),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                obscureText: true,
                                controller: lamunPasswordKosong,
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.lock_outline, color: Colors.blueAccent,),
                                    border: InputBorder.none,
                                    hintText: "Password",
                                    hintStyle:
                                        TextStyle(color: Colors.grey[400])),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30
                      ),
                      

                      GestureDetector(
                        onTap: (){
                          if (lamunUsernameKosong.text.isNotEmpty &&
                          lamunPasswordKosong.text.isNotEmpty) {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Dashboard(
                              username: lamunUsernameKosong.text,
                            ),
                          )
                          );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Username dan Password harus diisi!"),
                              backgroundColor: Colors.blueAccent,)
                            );
                          }
                        },
                     child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: const LinearGradient(colors: [
                              Color.fromRGBO(143, 148, 251, 1),
                              Color.fromRGBO(143, 148, 251, 6)
                            ])),
                        child: const Center(
                          child: Text(
                            "Login",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                      ),
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                      const Text(
                        "Lupa Password?",
                        style: TextStyle(
                          color: Color.fromRGBO(143, 148, 251, 1),
                          fontSize: 14,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
