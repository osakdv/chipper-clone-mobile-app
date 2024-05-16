import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gap/gap.dart';

import '../util/page.preformat.dart';

class Stock extends StatefulWidget {
  @override
  State<Stock> createState() => _StockState();
}

class _StockState extends State<Stock> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: PreformatPage.screenWidth(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Row < Img < Company name
          Row(children: [
            Container(
              padding: EdgeInsets.all(10),
              width: PreformatPage.useScreenWidth(50),
              height: PreformatPage.useScreenHeight(50),
              decoration:
                  const BoxDecoration(shape: BoxShape.circle, boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 242, 242, 242),
                  blurRadius: 10,
                  spreadRadius: .2,
                )
              ]),
              child: Image.asset('assets/imgs/merck&co.png', fit: BoxFit.cover,),
            ),
            Gap(PreformatPage.useScreenWidth(5)),
            // company name
            Text('Merck & Co.Inc', style: GoogleFonts.mulish(fontSize: 16, height: 1.5))
          ]),

          // Row < Col<Price, market cap> < arrow button
          Row(
            children: [
              Column(
                children: [
                  Text('\$108.32', style: GoogleFonts.mulish(fontSize: 16, fontWeight: FontWeight.w500)),
                ]
              ),

              Gap(PreformatPage.useScreenWidth(5)),

              Icon(Icons.arrow_back)
            ],
          )
        ],
      ),
    );
  }
}
