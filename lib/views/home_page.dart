import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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

            Column(  
              children: <Widget>[
                
              ],
            )
          ],
        )
      )
    );
  }
}