import 'package:coffeariverpod/AppColors.dart';
import 'package:coffeariverpod/Model/screens/Home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IntroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/images/splash_pic.png',),fit: BoxFit.cover)
          ),
          child: Column(
            children: [
              SizedBox(height:60,),
              Text(textAlign: TextAlign.center, 'Choice Your \n Favourite coffee',
                style: TextStyle(fontWeight: FontWeight.w900,fontSize: 35,color: AppColors.white,height:1.2),),
              SizedBox(height: 500,),
              Text(textAlign: TextAlign.center,'The best grain ,the finest roast \n the powerful flavor',
                style: TextStyle(color: AppColors.lightCream,fontSize: 19,fontWeight: FontWeight.w500),),


              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50,width: 325,
                  child: OutlinedButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                  },
                      style: OutlinedButton.styleFrom(

                        backgroundColor:Colors.yellow.shade800,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),

                        )
                      ),
                      child: Text('Get Started',style: TextStyle(color: AppColors.black,fontWeight: FontWeight.w600,fontSize: 18),)),
                ),
              )
            ],
          ),


          
        )
        ),
      );

    
  }

}