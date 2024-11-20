import 'package:flutter/material.dart';
import 'package:jawir/about.dart';
import 'package:jawir/hal_dashboard.dart';
import 'package:jawir/hal_favorite.dart';
import 'package:jawir/hal_keranjang.dart';
import 'package:jawir/hal_notifikasi.dart';

class DashboardBottomNavBar extends StatefulWidget {
  final String username;

  const DashboardBottomNavBar({super.key, required this.username});

  @override
  State<DashboardBottomNavBar> createState() => _DashboardBottomNavBarState();
}

class _DashboardBottomNavBarState extends State<DashboardBottomNavBar> {

  late List<Widget> _halaman;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _halaman = [
        Dashboard(username: widget.username),
        const HalamanFavorit(),
    const Halamankeranjang(),
    const HalamanNotif(),
    const HalamanAbout()
    ];
  }

  List<IconData> listOfIcons = [
    Icons.home_outlined,
    Icons.favorite_border_outlined, 
    Icons.shopping_cart_outlined,
    Icons.notifications_none_outlined,
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _halaman,
      ),
      bottomNavigationBar: 
      _selectedIndex == 4 ? const SizedBox.shrink() :
      Container(
        margin: const EdgeInsets.all(20),
        height: size.width * .155,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.15),
              blurRadius: 30,
              offset: const Offset(0, 10),
            ),
          ],
          borderRadius: BorderRadius.circular(50),
        ),
        child: ListView.builder(
            itemCount: listOfIcons.length,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: size.width * .024),
            itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    setState(
                      () {
                        _selectedIndex = index;
                      },
                    );
                  },
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 1500),
                        curve: Curves.fastLinearToSlowEaseIn,
                        margin: EdgeInsets.only(
                          bottom:
                              index == _selectedIndex ? 0 : size.width * .029,
                          right: size.width * .0422,
                          left: size.width * .0422,
                        ),
                        width: size.width * .128,
                        height: index == _selectedIndex ? size.width * .014 : 0,
                        decoration: const BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(10),
                            ),
                            
                            ),
                            
                      ),
                      Icon(
                        listOfIcons[index],
                        size: size.width * .076,
                        color: index == _selectedIndex
                            ? Colors.blueAccent
                            : Colors.redAccent,
                      ),
                      SizedBox(height: size.width * .03),
                    ],
                  ),
                )),
      ),
    );
  }
}
