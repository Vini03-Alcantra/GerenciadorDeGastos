import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moneymanagementcomplex/constants/color_constants.dart';
import 'package:moneymanagementcomplex/model/card_model.dart';
import 'package:moneymanagementcomplex/model/operation_model.dart';
import 'package:moneymanagementcomplex/model/transaction_model.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Current selected
  int current = 0;

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
    var altura = MediaQuery.of(context).size.height;
    var largura = MediaQuery.of(context).size.width;

    var nowDate = DateTime.now();    
    return Scaffold(
      body: SafeArea(
        child: Container(                      
          child: ListView(  
            physics:  ClampingScrollPhysics(),
            children: <Widget>[

              //Custom CustomAppBar
              Container(                                  
                margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top, left: largura * 0.035, right: largura * 0.035),
                child: Row(  
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GestureDetector(
                      onTap: (){
                        print("object");
                        print(nowDate.toLocal());
                      },
                      child: SvgPicture.asset('assets/svg/drawer_icon.svg', color: kBlueColor)
                    ),                    
                    CircleAvatar(                        
                      backgroundImage: AssetImage("assets/images/user_image.png"),                      
                      radius: altura / 27,
                    )
                  ],
                ),
              ),

              SizedBox(  
                height: altura / 35 ,
              ),
              
              //Widget nome e cumprimento
              Padding(
                padding: EdgeInsets.only(left: 16, bottom: 20),
                child: Column(  
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Bom dia,",
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
                height: altura / 4,
                child: ListView.builder(
                  physics: ClampingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.only(left: largura / 24, right: largura / 40),
                  itemCount: cards.length,
                  itemBuilder: (context, index){
                    return Container(
                      margin: EdgeInsets.only(right: largura / 60),
                      height: altura / 4,
                      width: largura / 1.2,
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
                            left: largura / 15,
                            top: altura / 22,
                            child: Text(
                              "CARD NUMBER", style: GoogleFonts.inter(
                                fontSize: 16,
                                fontWeight: FontWeight.w400, 
                                color: kWhiteColor
                              )
                            )
                          ),
                          Positioned(
                            left: largura / 15,
                            top: altura / 12,
                            child: Text(
                              "${cards[index].cardNumber}", style: GoogleFonts.inter(
                                fontSize: 20,
                                fontWeight: FontWeight.w700, 
                                color: kWhiteColor
                              )
                            )
                          ),
                          Positioned(
                            right: largura / 24,
                            top: altura / 60,
                            child: Image.asset(
                              cards[index].cardType,
                              width: largura / 10,
                              height: altura / 15
                            )
                          ),
                          Positioned(
                            left: largura / 15,
                            bottom: altura / 17,
                            child: Text("CARD HOLDERNAME", style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: kWhiteColor
                            ))
                          ),
                          Positioned(
                            left: largura / 15,
                            bottom: altura / 37,
                            child: Text(cards[index].user, style: GoogleFonts.inter(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: kWhiteColor
                            ))
                          ),
                          Positioned(
                            left: largura / 2.15,
                            bottom: altura / 17,
                            child: Text("EMPIRY DATE", style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: kWhiteColor
                            ))
                          ),
                          Positioned(
                            left: largura / 2.15,
                            bottom: altura / 37,
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

              //Início Operations
              Padding(
                padding: EdgeInsets.only(left: 16, bottom: 13, top: 29, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Operations", style: GoogleFonts.inter(  
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: kBlackColor
                    ),),
                    Row(  
                      children: map<Widget>(  
                        datas, 
                        (index, selected){
                          return Container(
                            alignment: Alignment.centerLeft,
                            height: 9,
                            width: 9,
                            margin: EdgeInsets.only(right: 6),
                            decoration: BoxDecoration(  
                              shape: BoxShape.circle,
                              color: current == index 
                                ?  kBlueColor
                                :  kTwentyBlueColor 
                            )
                          );
                        }
                      ),
                    )
                  ],
                )
              ),
              //Final Operations

              //Cards operations
              Container(  
                height: altura / 6.5,
                child: ListView.builder(
                  itemCount: datas.length,
                  padding: EdgeInsets.only(left: largura / 24),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index){
                    return GestureDetector(
                      onTap: (){
                        setState(() {
                          current = index;
                        });
                      },
                      child: OperationCard(
                        operation: datas[index].name,
                        selectedIcon: datas[index].selectedIcon,
                        unselectedIcon: datas[index].unselectedIcon,
                        isSelected: current == index,
                        context: this,
                      ),
                    );
                  }
                )
              ),
              //Final Card operations

              //Transactio Section
              Padding(
                padding: EdgeInsets.only(left: largura / 24, bottom: altura / 48, top: altura / 30, right:largura / 24),
                child: Text(  
                  "Transaction Histories",
                  style: GoogleFonts.inter(  
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: kBlackColor
                  )
                )
              ),
              ListView.builder(
                itemCount: transactions.length,
                padding: EdgeInsets.only(left: largura / 24, right: largura / 24),
                shrinkWrap: true,
                itemBuilder: (context, index){
                  return Container(  
                    height: altura / 13.5,
                    margin: EdgeInsets.only(bottom: altura / 80),
                    padding: EdgeInsets.only(left: largura / 24, top: altura / 130, bottom: altura / 130, right:  largura / 24),
                    decoration: BoxDecoration(                                                                  
                      color: Colors.red,
                      //color: kWhiteColor,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(  
                          color: kTenBlackColor,
                          blurRadius: 10,
                          spreadRadius: 5,
                          offset: Offset(8, 8)
                        )
                      ]
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(  
                            children: <Widget>[
                              Container(  
                                height: altura / 13.5,
                                width: largura / 8,
                                decoration: BoxDecoration(                                  
                                  shape: BoxShape.circle,
                                  image: DecorationImage(  
                                    image: AssetImage(transactions[index].photo)
                                  )
                                  )
                                ),
                                SizedBox(width: largura / 40),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      transactions[index].name,
                                      style: GoogleFonts.inter(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                        color: kBlackColor
                                      ),
                                    ),
                                    SizedBox(height: altura / 220),
                                    Text(
                                      transactions[index].date,
                                      style: GoogleFonts.inter(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: kBlackColor
                                      ),
                                    )
                                  ],
                                )
                              ]
                            ),
                            Text(
                              transactions[index].amount,
                              style: GoogleFonts.inter(  
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                                color: kBlueColor
                              )
                            )
                          ],
                        ),
                    )
                    );
                  }
                )
              ],
            ),
          ),
      ) 
      );      
    }       
  }


class OperationCard extends StatefulWidget {
  final String operation;
  final String selectedIcon;
  final String unselectedIcon;
  final bool isSelected;
  _HomePageState context;


  OperationCard({this.operation, this.selectedIcon, this.unselectedIcon, this.isSelected, this.context});
  @override
  _OperationCardState createState() => _OperationCardState();
}

class _OperationCardState extends State<OperationCard> {
  @override
  Widget build(BuildContext context) {
    var altura = MediaQuery.of(context).size.height;
    var largura = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(right: largura / 28),
      width: largura / 3.3,
      height: altura / 6.5,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(  
            color: kTenBlackColor,
            blurRadius: 10,
            spreadRadius: 5,
            offset: Offset(8.0, 8.0)
          )
        ],
        borderRadius: BorderRadius.circular(15),
        color: widget.isSelected ? kBlueColor : kWhiteColor
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SvgPicture.asset(
            widget.isSelected ? widget.selectedIcon : widget.unselectedIcon
          ),
          SizedBox(height: altura / 82),
          Text(
            widget.operation, textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: widget.isSelected ? kWhiteColor : kBlueColor
            ),
          )
        ],
      ),
    );
  }
}