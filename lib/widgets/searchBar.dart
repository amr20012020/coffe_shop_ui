import 'package:coffe_shop_ui/color_palette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ri.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
      left: 15.0, right: 15.0,
    ),
      child: Container(
        padding: EdgeInsets.all(10.0),
        height: 50.0,
        width: MediaQuery.of(context).size.width - 30.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: ColorPalette().searchBarFill,
        ),
        child: TextField(
          style: GoogleFonts.sourceSansPro(color: Color(0xFF525559)),
          decoration: InputDecoration(
            filled: true,
            hintText: 'Find your coffee...',
            contentPadding: EdgeInsets.fromLTRB(10.0, 2.0, 5.0, 12.0),
            border: InputBorder.none,
            fillColor: ColorPalette().searchBarFill,
            hintStyle: GoogleFonts.sourceSansPro(color: Color(0xFF525559)),
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Iconify(
                Ri.search_2_fill,
                color: Color(0xFF525559),
              ),
            ),
            prefixIconConstraints: BoxConstraints(maxHeight: 20.0, maxWidth: 40.0),
            prefixIconColor: Color(0xFF525559),
          ),
        ),
      ),

    );
  }
}
