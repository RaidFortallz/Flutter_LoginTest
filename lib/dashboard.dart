import 'package:flutter/material.dart';
import 'package:jawir/main.dart';

class Dashboard extends StatelessWidget {
  final String username;

  const Dashboard({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dashboard',
      home: MenuDashboard(username: username),
    );
  }
}

class MenuDashboard extends StatefulWidget {
  final String username;

  const MenuDashboard({super.key, required this.username});

  @override
  State<MenuDashboard> createState() => _MenuDashboardState();
}

class _MenuDashboardState extends State<MenuDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(137, 142, 240, 0.98),
      body: SafeArea(
        child: Column(
          children: [
            
            Container(
              height: 250,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(137, 142, 240, 0.98),
                borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(50)),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 50),
                  ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 30),
                    title: Text(
                      widget.username,
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 28),
                    ),
                    subtitle: Text(
                      'Selamat Datang',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: Colors.white54,
                          ),
                    ),
                    trailing: const CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage('assets/images/profile.png'),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buiildDashboardCard(context, Icons.history, "Riwayat"),
                      _buiildDashboardCard(context, Icons.notifications, "Notifikasi"),
                      _buiildDashboardCard(context, Icons.settings, "Pengaturan"),
                    ],
                  )
                ],
              ),
            ),
            
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(100)),
                ),
                child: const Center(
                  child: Text(
                    "Ini Dashboard",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(137, 142, 240, 0.98)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        showDialog(context: context, builder: (BuildContext context){
          return AlertDialog(
            title: const Text("Konfirmasi Logout"),
            content: const Text("Apakah Anda yakin ingin logout?"),
            actions: [
              TextButton(onPressed: (){
                Navigator.of(context).pop();
              },
              child: const Text("Tidak"),
              ),
              TextButton(onPressed: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginJawir()),);
              },
              child: const Text("Ya"),
              ),
            ],
          );
        });
      },
      backgroundColor: const Color.fromRGBO(137, 142, 240, 0.98),
      foregroundColor: Colors.white,
      child: const Icon(Icons.logout_rounded)
      ),
    );
  }
}

Widget _buiildDashboardCard(BuildContext context, IconData icon, String label){
  return GestureDetector(
    onTap: (){
      ScaffoldMessenger.of(context).showSnackBar(
      const  SnackBar(content: Text("Segera Datang"),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.blueAccent,
        )
      );
    },
    child: Column(
      children: [
        CircleAvatar(
          radius: 25,
          backgroundColor: Colors.white,
          child: Icon(icon, color: Colors.blueAccent),
        ),
        const SizedBox(height: 8,),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14
          ),
          )
      ],
    ),
  );
}
