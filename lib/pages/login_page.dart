import 'package:flutter/material.dart';
import 'package:untitled55/pages/RoomsPage.dart';
import 'package:untitled55/pages/register_page.dart';

import '../widets/foror.dart';


class LoginScreeen extends StatelessWidget {
  const LoginScreeen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(16),
              child: Image.asset("assets/images/the future house.jpg"),
            ),
        
            SizedBox(height: 5,),
            Form(child: Column(
              children: [
                TextFormField(
        
                  decoration: InputDecoration(
                      labelText: "Email " ,
                      focusedBorder: OutlineInputBorder(
                          borderRadius:BorderRadius.all(Radius.circular(16)) ,
                          borderSide: BorderSide(color: Colors.blue)
                      ),
                      prefixIcon:Icon(Icons.email) ,
                      border: OutlineInputBorder(),
                      hintText: 'Type Your Email Here'
                  ),
                ),
                SizedBox(height: 20,),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "password " ,
                      focusedBorder: OutlineInputBorder(
                          borderRadius:BorderRadius.all(Radius.circular(16)) ,
                          borderSide: BorderSide(color: Colors.blue)
                      ),
                      prefixIcon:Icon(Icons.password) ,
                      border: OutlineInputBorder(),
                      hintText: 'password'
                  ),
                ),
                Align(
                  alignment:Alignment.centerRight ,
                  child: Text("forget  password?",style: TextStyle(
                    color: Color(0xff00669d),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
        
                  ),),
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
        
                        backgroundColor: Color(0xff006caf)
        
                    ),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return RoomsPage();
                      }));
                    }, child:Text("login",style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
        
        
                ),) ),
                ForOr(),
                Text("or ",style: TextStyle(
                    color: Colors.grey,fontSize: 20
        
                ),),
                ForOr(),
                TextButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return RegisterScreen();
                  }));
                }, child: Text("Register Now",style: TextStyle(
                    color: Color(0xff007aaf),
                    fontSize: 16,
                    fontWeight: FontWeight.bold
        
                ),)),
        
        
                Row(
                  mainAxisAlignment:MainAxisAlignment.spaceEvenly ,
                  children: [
                    Image.asset("assets/images/fb icon 1.png"),
                    Image.asset("assets/images/gmail 1.png"),
                    Image.asset("assets/images/twitter 1.png"),
        
                  ],
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
