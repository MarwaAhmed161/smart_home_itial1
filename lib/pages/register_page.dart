import 'package:flutter/material.dart';
import 'package:untitled55/pages/login_page.dart';

import '../widets/text_filed.dart';



class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset("assets/images/energy.jpg",height: 240,),
              Textfiled(hinttext: 'first name',),
              SizedBox(
                height: 5,
              ),
              Textfiled(hinttext: 'Last Name',),
              SizedBox(
                height: 5,
              ),
              Textfiled(hinttext: 'Type Your Email Here',),
              SizedBox(
                height: 5,
              ),
              Textfiled(hinttext: 'Password',),
              SizedBox(
                height: 5,
              ),
              Textfiled(hinttext: 'Confirm Password',),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(

                      backgroundColor: Color(0xff00AF32)

                  ),
                  onPressed: (){}, child:Text("Register",style: TextStyle(
                fontSize: 20,
                color: Colors.white,


              ),) ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already Have an Account ?",),
                  TextButton(onPressed: (){

                    Navigator.push(context, MaterialPageRoute(builder: (context)
                    {
                      return LoginScreeen();
                    }));
                  }, child: Text("login",style: TextStyle(
                      fontSize: 16,
                      color: Color(0xff00AF32)
                  ),))
                ],
              )
            ],
          ),
        ),
      ) ,

    );
  }
}
