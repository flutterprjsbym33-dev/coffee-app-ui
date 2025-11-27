import 'package:coffeariverpod/AppColors.dart';
import 'package:coffeariverpod/Model/screens/CartScreen.dart';
import 'package:coffeariverpod/Model/screens/GridView.dart';
import 'package:coffeariverpod/Model/screens/HorizentalPazer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {


  List<String> images = [
    'assets/images/btn_1.png',
    'assets/images/btn_2.png',
    'assets/images/btn_3.png',
    'assets/images/btn_4.png',
    'assets/images/btn_5.png',
  ];

  List<String> btnName = [
    'Home',
    'Cart',
    'favourite',
    'My Order',
    'Profile',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(

        decoration: BoxDecoration(
          color: AppColors.darkBrown
        ),
        height: 75,

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(images.length, (index){

             return Padding(
               padding: const EdgeInsets.all(10),
               child: GestureDetector(
                 onTap: (){
                   ontapAction(index, context);

                 },
                 child: Column(
                   mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(images[index],height: 25,),
                      SizedBox(height: 5,),
                      Text(textAlign: TextAlign.center,btnName[index],style: TextStyle(color: Colors.white),)
                    ],
                  ),
               ),
             );
          }),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(child: Container(
          decoration: BoxDecoration(
            color: AppColors.cream
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 45,width: 300,
                      child: TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: AppColors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide.none
                          ),
        
                          prefixIcon: Icon(Icons.search),
                          hintText: 'Search anything'
                        ),
        
        
                      ),
                    ),
        
                       Container(
                        height: 55,
                        child: Card(
        
                          color: Colors.black,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset('assets/images/settings.png',height: 30,
                              color: Colors.white,),
                          ),
                        ),
                      ),
        
                  ],
                ),
                  HorizentalPager(),
                SizedBox(height: 8,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Popular Coffee',style:TextStyle(fontSize: 22,fontWeight: FontWeight.w800,color: AppColors.darkBrown),),
                    Text('See all',style:TextStyle(fontSize: 17,color: AppColors.darkBrown,fontWeight: FontWeight.w500))
                  ],
                ),
                   MainGridView()
              ],
        
            ),
          ),
        )),
      ),

    );
  }


}

void ontapAction(int index, BuildContext context)
{
  switch(index)
      {
    case 1:Navigator.push(context, MaterialPageRoute(builder: (context)=>CartScreen()));
      break;


      }
}