import 'package:coffe_shop_ui/widgets/searchBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/heroicons_solid.dart';
import 'package:iconify_flutter/icons/ri.dart';

import 'color_palette.dart';
import 'item_details.dart';
import 'models/Coffe-Item.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> coffeeTypes = [
    'Cappuccino',
    'Espresso',
    'Latte',
    'Flat White'
  ];

  String SelectedItem = 'Cappuccino';
  int counter = -1;

  final List<CoffeeItem> coffeeList = [
    CoffeeItem(
      rate: "4.5",
      Image: "assets/images/coffeemain.jpg",
      title: "Cappuccino",
      subtitle: "With Oat Milk",
      price: 4.21,
    ),
    CoffeeItem(
      rate: "4.2",
      Image: "assets/images/secondary.jpg",
      title: "Cappuccino",
      subtitle: "With Chocolate",
      price: 3.14,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette().scaffoldBg,
      bottomNavigationBar: _BottomBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(15.0, 25.0, 15.0, 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.all(7.0),
                      height: 42.0,
                      width: 42.0,
                      decoration: BoxDecoration(
                          color: Color(0xFF1F242C),
                          borderRadius: BorderRadius.circular(12.0)),
                      child: Iconify(
                        HeroiconsSolid.view_grid,
                        size: 12.0,
                        color: Color(0xFF4D4F52),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.all(7.0),
                      height: 42.0,
                      width: 42.0,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/model.png"),
                          ),
                          borderRadius: BorderRadius.circular(12.0)),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 15.0, top: 15.0),
              width: (MediaQuery.of(context).size.width / 3) * 2 + 25.0,
              child: Text(
                'Find the best coffee for you',
                style: GoogleFonts.sourceSansPro(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 40.0,
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Search(),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
              child: ShaderMask(
                shaderCallback: (Rect bounds) {
                  return LinearGradient(
                          colors: <Color>[Colors.black, Colors.transparent])
                      .createShader(bounds);
                },
                blendMode: BlendMode.dstATop,
                child: Container(
                  color: Color(0xFF0D0F14),
                  width: MediaQuery.of(context).size.width - 20.0,
                  height: 40.0,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      ...coffeeTypes.map((e) {
                        counter++;
                        if (counter <= 3)
                          return _buildTypes(e, counter);
                        else {
                          counter = 0;
                          return _buildTypes(e, counter);
                        }
                      }).toList()
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: (MediaQuery.of(context).size.height / 2) - 50.0,
              width: MediaQuery.of(context).size.width,
              child: ListView(
                padding: EdgeInsets.only(top: 5.0),
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 15.0, right: 15.0),
                    child: Container(
                      color: Color(0xFF0D0F14),
                      width: MediaQuery.of(context).size.width - 10.0,
                      height: 225.0,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          ...coffeeList.map((e) {
                            return _buildCoffeItem(e);
                          }).toList(),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 15.0, left: 15.0, right: 15.0),
                     child: Text(
                       'Special for you',
                       style: TextStyle(
                         fontWeight: FontWeight.bold,
                         color: Colors.white,
                         fontSize: 18.0,
                       ),
                     ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 10.0),
                      child: Container(
                        padding: EdgeInsets.all(10.0),
                        height: 125.0,
                        width: MediaQuery.of(context).size.width - 20.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: <Color>[
                              ColorPalette().gradientTopLeft,
                              Colors.black,
                            ],
                          ),
                        ),
                        child: Row(
                          children:
                          [
                            Container(
                              height: 115.0,
                              width: 125.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                image: DecorationImage(
                                  image: AssetImage('assets/images/beansbottom.jpg'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Container(
                              height: 115.0,
                              child: Column(
                                children: [
                                  Container(
                                    height: 100.0,
                                    width: MediaQuery.of(context).size.width - 185.0,
                                    child: Text(
                                      '5 Coffee Beans You Must Try !',
                                      style: GoogleFonts.sourceSansPro(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 21.0,
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


                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _BottomBar() {
    return Container(
      padding: EdgeInsets.only(left: 25.0, right: 25.0),
      height: 50,
      decoration: BoxDecoration(color: Color(0xFF1A1819)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Icon(
              Icons.home_rounded,
              color: Color(0xFFD17742),
            ),
          ),
          Iconify(
            Ri.handbag_fill,
            color: Color(0xFFD17742),
          ),
          Iconify(
            Ri.heart_2_fill,
            color: Color(0xFFD17742),
          ),
          Container(
            child: Stack(
              children: [
                Iconify(
                  HeroiconsSolid.bell,
                  color: Color(0xFF4E4F53),
                ),
                Positioned(
                  top: 2.0,
                  left: 15.0,
                  child: Container(
                    height: 7.0,
                    width: 7.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3.5),
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTypes(coffee, counter) {
    return Padding(
      padding: counter != 0
          ? EdgeInsets.only(left: 25.0)
          : EdgeInsets.only(left: 7.0),
      child: Container(
        height: 50.0,
        color: Color(0xFF0D0F14),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  SelectedItem = coffee;
                });
              },
              child: Text(
                coffee,
                style: GoogleFonts.sourceSansPro(
                  fontWeight: FontWeight.bold,
                  color: coffee == SelectedItem
                      ? ColorPalette().coffeeSelected
                      : ColorPalette().coffeeUnselected,
                  fontSize: 17.0,
                ),
              ),
            ),
            SizedBox(
              height: 4.0,
            ),
            Container(
              height: 8.0,
              width: 8.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                color: coffee == SelectedItem
                    ? ColorPalette().coffeeSelected
                    : Colors.transparent,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCoffeItem(CoffeeItem cItem) {
    return Padding(
      padding: EdgeInsets.only(left: 10.0, right: 10.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ItemDetails(cItem: cItem)));
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
                  ColorPalette().gradientTopLeft,
                  Colors.black,
                ],
              )),
          height: 250.0,
          width: 150.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 140.0,
                width: 150.0,
                child: Stack(
                  children: [
                    Positioned(
                      top: 10.0,
                      left: 10.0,
                      child: Hero(
                        tag: cItem.Image.toString(),
                        child: Container(
                          width: 130.0,
                          height: 120.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(cItem.Image!),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 10.0,
                      top: 10.0,
                      child: Container(
                        height: 25.0,
                        width: 50.0,
                        decoration: BoxDecoration(
                          color: Color(0xFF342520).withOpacity(0.7),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(15.0),
                            bottomLeft: Radius.circular(15.0),
                          ),
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                Icons.star,
                                color: ColorPalette().coffeeSelected,
                                size: 15.0,
                              ),
                              Text(
                                cItem.rate.toString(),
                                style: GoogleFonts.sourceSansPro(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 13.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  cItem.title!,
                  style: GoogleFonts.sourceSansPro(
                    color: Colors.white,
                    fontSize: 17.0,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, bottom: 5.0),
                child: Text(
                  cItem.subtitle!,
                  style: GoogleFonts.sourceSansPro(
                    color: Colors.white,
                    fontSize: 12.0,
                    fontWeight: FontWeight.w200,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0, right: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 40.0,
                      width: 60.0,
                      child: Row(
                        children: [
                          Text(
                            '\$',
                            style: GoogleFonts.sourceSansPro(
                              color: ColorPalette().coffeeSelected,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            cItem.price.toString(),
                            style: GoogleFonts.sourceSansPro(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 30.0,
                        width: 30.0,
                        decoration: BoxDecoration(
                          color: ColorPalette().coffeeSelected,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.add,
                            size: 11.0,
                            color: Colors.white,
                          ),
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
}
