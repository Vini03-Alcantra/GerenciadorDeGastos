import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moneymanagementcomplex/constants/color_constants.dart';
import 'package:moneymanagementcomplex/model/card_model.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //Handle Indicator 
  List<T> map<T>(List list, Function handler){
    List<T> result = [];
    for(var i = 0; i < list.length; i++){
      result.add(handler(i, list[i]));
    }
    return result;
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(  
        margin: EdgeInsets.only(top: 8),
        
        child: ListView(  
          physics:  ClampingScrollPhysics(),
          children: <Widget>[
            //Custom CustomAppBar
            Container(  
              margin: EdgeInsets.only(left: 16, right: 16, top: 16),
              child: Row(  
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                    onTap: (){
                      print("object");
                    },
                    child: SvgPicture.asset('assets/svg/drawer_icon.svg')
                  ),
                  Container(  
                    height: 59,
                    width: 59,
                    decoration: BoxDecoration(  
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(image: AssetImage('assets/images/user_image.png'))
                    ),
                  )
                ],
              ),
            ),

            SizedBox(  
              height: 25,
            ),
            //Widget nome e cumprimento
            Padding(
              padding: EdgeInsets.only(left: 16, bottom: 20),
              child: Column(  
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Bom dia",
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: kBlackColor
                    ),
                  ),
                  Text(
                    "Vinícius de Alcantra",
                    style: GoogleFonts.inter(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: kBlackColor
                    ),
                  ),
                ],
              ),
            ),
            //Termina aqui

            //Cartão aqui
            Container(
              height: 199,
              child: ListView.builder(
                physics: ClampingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(left: 16, right: 6),
                itemCount: cards.length,
                itemBuilder: (context, index){
                  return Container(
                    margin: EdgeInsets.only(right: 10),
                    height: 199,
                    width: 344,
                    decoration: BoxDecoration(  
                      borderRadius: BorderRadius.circular(28),
                      color: Color(cards[index].cardBackground)
                    ),
                    child: Stack(  
                      children: <Widget>[
                        Positioned(  
                          bottom: 0,
                          right: 0,
                          child: SvgPicture.asset(cards[index].cardElementBottom)
                        ),
                        Positioned(
                          left: 29,
                          top: 48,
                          child: Text(
                            "CARD NUMBER", style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w400, 
                              color: kWhiteColor
                            )
                          )
                        ),
                        Positioned(
                          left: 29,
                          top: 65,
                          child: Text(
                            "${cards[index].cardNumber}", style: GoogleFonts.inter(
                              fontSize: 20,
                              fontWeight: FontWeight.w700, 
                              color: kWhiteColor
                            )
                          )
                        ),
                        Positioned(
                          right: 21,
                          top: 35,
                          child: Image.asset(
                            cards[index].cardType,
                            width: 27,
                            height: 27
                          )
                        ),
                        Positioned(
                          left: 29,
                          bottom: 45,
                          child: Text("CARD HOLDERNAME", style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: kWhiteColor
                          ))
                        ),
                        Positioned(
                          left: 29,
                          bottom: 23,
                          child: Text(cards[index].user, style: GoogleFonts.inter(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: kWhiteColor
                          ))
                        ),
                        Positioned(
                          left: 202,
                          bottom: 45,
                          child: Text("EMPIRY DATE", style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: kWhiteColor
                          ))
                        ),
                        Positioned(
                          left: 202,
                          bottom: 23,
                          child: Text(cards[index].cardExpired, style: GoogleFonts.inter(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: kWhiteColor
                          )
                          )
                        ),
                      ],
                    )
                  );
                }
              )
            ),
            //Cartão termina aqui
          ],
        )
      )
    );
  }
}