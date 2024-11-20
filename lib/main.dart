import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:jawir/dashboard_botnavbar.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
   const SystemUiOverlayStyle(
      statusBarColor: Color.fromARGB(255, 7, 108, 190),
      statusBarBrightness: Brightness.light
    )
  );
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: LoginJawir(),
  ));
}

class LoginJawir extends StatefulWidget {
  const LoginJawir({super.key});

  @override
  State<LoginJawir> createState() => _LoginJawirState();
}

class _LoginJawirState extends State<LoginJawir> {
  final TextEditingController lamunUsernameKosong = TextEditingController();
  final TextEditingController lamunPasswordKosong = TextEditingController();

  final String usernameBenar = "MDimasDP";
  final String passwordBenar = "12345678";

  bool _isSecurePassword = true;

  void _login(BuildContext context) {
    if (lamunUsernameKosong.text.isEmpty || lamunPasswordKosong.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Username dan Password harus diisi!"),
          backgroundColor: Colors.redAccent,
        ),
      );
    } else if (lamunUsernameKosong.text == usernameBenar &&
        lamunPasswordKosong.text == passwordBenar) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DashboardBottomNavBar(
            username: lamunUsernameKosong.text,
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Username atau Password salah!"),
          backgroundColor: Colors.redAccent,
        ),
      );
    }
  }

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
                    fit: BoxFit.fill,
                  ),
                ),
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
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      width: 80,
                      height: 150,
                      left: 140,
                      child: Container(
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/light-2.png'),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      width: 80,
                      height: 150,
                      right: 30,
                      top: 30,
                      child: Container(
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/clock.png'),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      child: Container(
                        margin: const EdgeInsets.only(top: 80),
                        child: const Center(
                          child: Text(
                            "Login",
                            style: TextStyle(
                              fontFamily: "poppinsregular",
                              fontSize: 40,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
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
                            offset: Offset(0, 0.1),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.grey[350] ?? Colors.grey,
                                ),
                              ),
                            ),
                            child: TextField(
                              style:
                                  const TextStyle(fontFamily: "poppinsregular"),
                              controller: lamunUsernameKosong,
                              textCapitalization: TextCapitalization.words,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(
                                  Icons.person_3_outlined,
                                  color: Colors.blueAccent,
                                ),
                                border: InputBorder.none,
                                hintText: "Username",
                                hintStyle: TextStyle(
                                    fontFamily: "poppinsregular",
                                    color: Colors.grey[400]),
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              obscureText: _isSecurePassword,
                              controller: lamunPasswordKosong,
                              style: const TextStyle(fontFamily: "poppinsregular"),
                              decoration: InputDecoration(
                                prefixIcon: const Icon(
                                  Icons.lock_outline,
                                  color: Colors.blueAccent,
                                ),
                                border: InputBorder.none,
                                hintText: "Password",
                                hintStyle: TextStyle(
                                    fontFamily: "poppinsregular",
                                    color: Colors.grey[400]),
                                    suffixIcon: togglePassword(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                   Bounceable(
                        onTap: () => _login(context),
                        child: Container(
                          margin: const EdgeInsets.only(top: 20),
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: const LinearGradient(colors: [
                               Color.fromRGBO(143, 148, 251, 1),
                               Color.fromRGBO(143, 148, 251, 6),
                            ]
                            
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              "Login",
                              style: TextStyle(
                                fontFamily: "poppinsregular",
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                    
                    const SizedBox(height: 50),
                    Bounceable(
                      onTap: (){},
                        child: const Text(
                          "Lupa Password?",
                          style: TextStyle(
                            fontFamily: "poppinsregular",
                            color: Color.fromRGBO(143, 148, 251, 1),
                            fontSize: 14,
                          ),
                        ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget togglePassword(){
    return IconButton(onPressed: (){
      setState(() {
        _isSecurePassword = !_isSecurePassword;
      });
    }, icon: _isSecurePassword ? const Icon(Icons.visibility_off) : const Icon(Icons.visibility),
    color: Colors.blueAccent,
    );
  }

}
