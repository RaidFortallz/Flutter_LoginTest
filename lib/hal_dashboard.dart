import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
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
  late final PageController pageController;
  int noHalaman = 0;
  late ScrollController _scrollController;

  Timer? gerakOtomatis;

  Timer getTimer() {
    return Timer.periodic(const Duration(seconds: 3), (timer) {
      if (noHalaman == 4) {
        noHalaman = 0;
      }
      pageController.animateToPage(noHalaman,
          duration: const Duration(seconds: 1), curve: Curves.bounceInOut);
      noHalaman++;
    });
  }

  @override
  void initState() {
    pageController = PageController(initialPage: 0, viewportFraction: 0.85);
    gerakOtomatis = getTimer();
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  var currentIndex = 0;

  final List<Map<String, dynamic>> sliderMap = [
    {
      "judul": "Diskon1",
      "images":
          "https://static.promediateknologi.id/crop/0x0:0x0/0x0/webp/photo/p2/183/2024/07/22/Screenshot_38-3501461324.jpg"
    },
    {
      "judul": "Diskon2",
      "images":
          "https://images.tokopedia.net/img/QBrNqa/2022/5/13/994cad0f-a522-4ea6-a8a7-75f4e3a32511.jpg"
    },
    {
      "judul": "Diskon3",
      "images":
          "https://storage.googleapis.com/static-cms-prod/2024/09/unnamed-2.jpg"
    },
    {
      "judul": "Diskon4",
      "images":
          "https://eksekutif.com/wp-content/uploads/2023/08/Shopee-17.8-Festival-Pilih-Lokal.png"
    },
    {
      "judul": "Diskon5",
      "images":
          "https://gayatekno.id/wp-content/uploads/2020/12/Shopee-New-Year-Sale.jpg"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 246, 246),
      body: SafeArea(
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              Container(
                height: 120,
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(137, 142, 240, 0.98),
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(30),
                      bottomLeft: Radius.circular(30)),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    ListTile(
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 30),
                        title: Text(
                          widget.username,
                          style: const TextStyle(
                              fontFamily: "poppinsregular",
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        subtitle: const Text('Selamat Datang',
                            style: TextStyle(
                                fontFamily: "poppinsregular",
                                color: Colors.white70)),
                        trailing: Bounceable(
                          onTap: () {},
                          child: MenuPopUp(
                            menuList: [
                              const PopupMenuItem(
                                child: ListTile(
                                  leading: Icon(
                                    CupertinoIcons.person,
                                    color: Colors.blueAccent,
                                  ),
                                  title: Text(
                                    "Profil Saya",
                                    style:
                                        TextStyle(fontFamily: "poppinsregular"),
                                  ),
                                ),
                              ),
                              const PopupMenuItem(
                                child: ListTile(
                                  leading: Icon(
                                    Icons.wallet,
                                    color: Colors.blueAccent,
                                  ),
                                  title: Text("Dompet Saya",
                                      style: TextStyle(
                                          fontFamily: "poppinsregular")),
                                ),
                              ),
                              const PopupMenuDivider(),
                              const PopupMenuItem(
                                child: ListTile(
                                  leading: Icon(
                                    Icons.settings,
                                    color: Colors.blueAccent,
                                  ),
                                  title: Text("Pengaturan",
                                      style: TextStyle(
                                          fontFamily: "poppinsregular")),
                                ),
                              ),
                              const PopupMenuItem(
                                child: ListTile(
                                  leading: Icon(
                                    CupertinoIcons.info_circle,
                                    color: Colors.blueAccent,
                                  ),
                                  title: Text("About",
                                      style: TextStyle(
                                          fontFamily: "poppinsregular")),
                                ),
                              ),
                              PopupMenuItem(
                                child: ListTile(
                                  leading: const Icon(
                                    Icons.logout,
                                    color: Colors.redAccent,
                                  ),
                                  title: const Text("Logout",
                                      style: TextStyle(
                                          fontFamily: "poppinsregular")),
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: const Text(
                                              "Konfirmasi Logout",
                                              style: TextStyle(
                                                  fontFamily: "poppinsregular",
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.blue),
                                            ),
                                            content: const Text(
                                              "Apakah Anda yakin ingin Logout?",
                                              style: TextStyle(
                                                  fontFamily: "poppinsregular"),
                                              textAlign: TextAlign.center,
                                            ),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: const Text(
                                                  "Tidak",
                                                  style: TextStyle(
                                                      fontFamily:
                                                          "poppinsregular",
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              TextButton(
                                                  onPressed: () {
                                                    Navigator.pushReplacement(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            const LoginJawir(),
                                                      ),
                                                    );
                                                  },
                                                  child: const Text(
                                                    "Ya",
                                                    style: TextStyle(
                                                        fontFamily:
                                                            "poppinsregular",
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color:
                                                            Colors.redAccent),
                                                  ))
                                            ],
                                          );
                                        });
                                  },
                                ),
                              ),
                            ],
                            icon: CircleAvatar(
                              radius: 25,
                              backgroundImage:
                                  const AssetImage("assets/images/profile.png"),
                              child: Container(),
                            ),
                          ),
                        )),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
              Container(
                color: const Color.fromARGB(255, 255, 246, 246),
                child: Column(
                  children: [
                    SizedBox(
                      height: 200,
                      child: PageView.builder(
                        controller: pageController,
                        onPageChanged: (index) {
                          noHalaman = index;
                          setState(() {});
                        },
                        itemBuilder: (_, index) {
                          return AnimatedBuilder(
                            animation: pageController,
                            builder: (ctx, child) {
                              return child!;
                            },
                            child: GestureDetector(
                              onPanDown: (d) {
                                gerakOtomatis?.cancel();
                                gerakOtomatis = null;
                              },
                              onPanCancel: () {
                                gerakOtomatis = getTimer();
                              },
                              child: Bounceable(
                                onTap: () {},
                                child: Container(
                                  margin: const EdgeInsets.only(
                                      right: 8, left: 8, top: 26, bottom: 12),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(24.0),
                                    child: Image.network(
                                      "${sliderMap.elementAt(index)['images']}",
                                      fit: BoxFit.cover,
                                      height: 250,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        itemCount: 5,
                      ),
                    ),
                    const SizedBox(
                      height: 4.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        5,
                        (index) => GestureDetector(
                          child: Container(
                            margin: const EdgeInsets.all(2.0),
                            child: Icon(
                              Icons.circle,
                              size: 8.0,
                              color: noHalaman == index
                                  ? Colors.indigoAccent
                                  : Colors.grey.shade300,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(24.0),
                      child: TampilanGrid(),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MenuPopUp extends StatelessWidget {
  final List<PopupMenuEntry> menuList;
  final Widget? icon;

  const MenuPopUp({super.key, required this.menuList, this.icon});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      itemBuilder: ((context) => menuList),
      icon: icon,
    );
  }
}

class TampilanGrid extends StatefulWidget {
  const TampilanGrid({super.key});

  @override
  State<TampilanGrid> createState() => _TampilanGridState();
}

class _TampilanGridState extends State<TampilanGrid> {
  final List<Map<String, dynamic>> gridMap = [
    {
      "judul": "Celana Loose Pants",
      "harga": "Rp95.000",
      "images":
          "https://down-id.img.susercontent.com/file/id-11134207-7rash-m0x842jdzvdcf2@resize_w900_nl.webp"
    },
    {
      "judul": "Half Zipper",
      "harga": "Rp175.000",
      "images":
          "https://down-id.img.susercontent.com/file/id-11134207-7r98p-ln1r8vabxd3j94.webp"
    },
    {
      "judul": "Sweater",
      "harga": "Rp94.000",
      "images":
          "https://down-id.img.susercontent.com/file/951062d68c68639fa5e2f19a9a5201ac.webp"
    },
    {
      "judul": "Hoodie",
      "harga": "Rp130.000",
      "images":
          "https://down-id.img.susercontent.com/file/sg-11134201-22120-oja0wf87valv94@resize_w900_nl.webp"
    },
    {
      "judul": "Kemeja",
      "harga": "Rp240.000",
      "images":
          "https://www.static-src.com/wcsstore/Indraprastha/images/catalog/full//97/MTA-54183535/no_brand_kemeja_flanel_pria-_kemeja_flanel_lengan_panjang_slimfit_premium_02_-_kemeja_peia_kasual_kekinian_full03_r6nbxzu9.jpg"
    },
    {
      "judul": "Sepatu Convers",
      "harga": "Rp255.000",
      "images":
          "https://down-id.img.susercontent.com/file/id-11134207-7qukw-li61t506m0kq8b@resize_w900_nl.webp"
    },
    {
      "judul": "Polo Shirt",
      "harga": "Rp90.000",
      "images":
          "https://down-id.img.susercontent.com/file/id-11134207-7r98w-lssacpo9hfly6a.webp"
    },
    {
      "judul": "Vest Cargo",
      "harga": "Rp132.000",
      "images":
          "https://down-id.img.susercontent.com/file/id-11134207-7r98z-lr7843i4oyx97b.webp"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12.0,
            mainAxisSpacing: 12.0,
            mainAxisExtent: 340),
        itemCount: gridMap.length,
        itemBuilder: (_, index) {
          return Bounceable(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  color: Colors.blueAccent,
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(255, 213, 213, 213),
                      spreadRadius: 2,
                    )
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(16.0),
                          topRight: Radius.circular(16.0)),
                      child: Image.network(
                        "${gridMap.elementAt(index)['images']}",
                        height: 170,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      )),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          "${gridMap.elementAt(index)['judul']}",
                          style: const TextStyle(
                              fontFamily: "poppinsregular",
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: Colors.white),
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        Text(
                          "${gridMap.elementAt(index)['harga']}",
                          style: const TextStyle(
                              fontFamily: "poppinsregular",
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.lightGreenAccent),
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        const Row(
                          children: [
                            IconButton(
                              onPressed: (null),
                              icon: Icon(
                                CupertinoIcons.heart_fill,
                                color: Colors.white,
                              ),
                            ),
                            IconButton(
                                onPressed: (null),
                                icon: Icon(
                                  CupertinoIcons.cart_fill,
                                  color: Color.fromARGB(255, 255, 226, 123),
                                ))
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
