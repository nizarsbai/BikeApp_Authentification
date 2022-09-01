import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../utils/config.dart';
import 'CardWidget.dart';

class veloCards extends StatefulWidget {
  const veloCards({Key? key}) : super(key: key);

  @override
  State<veloCards> createState() => _veloCardsState();
}

class _veloCardsState extends State<veloCards> with SingleTickerProviderStateMixin {
  late TabController _tabController;

   @override
  void initState(){
    _tabController = new TabController(length: 3, vsync: this,initialIndex:0)..addListener(() {

    });
  }
  
  @override
  Widget build(BuildContext context) {
    bool _darkMode =
        Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark;
    return Scaffold(
      body:
       Column(
        children: [
          Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 4),
                child: Text(
                  "Choisir votre vélo",
                  style: TextStyle(
                    color: kTextColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 23,
                  ),
                ),
              ),
          Container(
            child: TabBar(
              isScrollable: true,
              indicatorPadding: const EdgeInsets.all(0),
              labelPadding: const EdgeInsets.only(left:18, right: 18, top: 7, bottom: 7),
              labelColor: _darkMode
                  ? Theme.of(context).scaffoldBackgroundColor
                  : Colors.white,
              labelStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
          //     backgroundColor:
          // _darkMode ? Theme.of(context).scaffoldBackgroundColor : Colors.white,

              indicator: BoxDecoration(
                color: _darkMode ? Colors.white : kNavyBlue,
                borderRadius: BorderRadius.circular(10),
              ),
              unselectedLabelColor: _darkMode ? Colors.white : kNavyBlue,
              controller: _tabController,
              tabs: const [
                Text('Favoris', style: TextStyle(fontFamily: 'Varela_Round')),
                Text('Electrique',style: TextStyle(fontFamily: 'Varela_Round')),
                Text('Classique',style: TextStyle(fontFamily: 'Varela_Round')),

              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
                children: const [
                  CardWidget(),
                  CardWidget(),
                  CardWidget(),
                ]),
          )
        ],
        
      ),
      
      bottomNavigationBar: Container(

    decoration: BoxDecoration(
    color: Colors.white,
      borderRadius: BorderRadius.only(
          topRight: Radius.circular(30), topLeft: Radius.circular(30)),
    ),
    
    child: Material(
    elevation: 0.0,
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(40.0)),
    )
      )
    );
  }
}