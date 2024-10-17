// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {

  TextEditingController  emailController = TextEditingController();
  TextEditingController  passwordController = TextEditingController();
  bool isTap = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
        child: SingleChildScrollView(
          physics:BouncingScrollPhysics() ,
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              SizedBox(height: 30,),
              Image.asset("assets/images/login_img.png",height: 280,width: double.infinity,),
          
              SizedBox(height: 10,),
              Text("Login",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
          
              SizedBox(height: 10,),
          
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                
                    Padding(
                      padding: const EdgeInsets.only(top:2.0),
                      child: Icon(Icons.alternate_email,color: Colors.grey,),
                    ),
                    
                    SizedBox(width: 10.0,),
                    Expanded(
                      child: TextFormField(
                       controller: emailController,
                       decoration: InputDecoration(
                         enabledBorder: UnderlineInputBorder(
                         borderSide: BorderSide(color: Colors.grey),
                         ),
                        hintText: "Email ID",
                        hintStyle: TextStyle(color: Colors.grey)
                       ),
                      ),
                    )
                  ],
                ),
              ),
          
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                
                    Padding(
                      padding: const EdgeInsets.only(top:2.0),
                      child: Icon(Icons.lock,color: Colors.grey,),
                    ),
                    
                    SizedBox(width: 10.0,),
                    Expanded(
                      child: TextFormField(
                       obscureText:isTap ,
                       controller: passwordController,
                       decoration: InputDecoration(
                         enabledBorder: UnderlineInputBorder(
                         borderSide: BorderSide(color: Colors.grey),
                         ),
                        hintText: "Password",
                        hintStyle: TextStyle(color: Colors.grey),
                        suffixIcon: IconButton(
                          onPressed: (){
                            isTap == true 
                            ? isTap = false 
                            : isTap = true;
                           setState(() {
                            
                           });
                          },
                          icon:Icon(
                            
                            isTap ? Icons.visibility_off
                            :Icons.visibility,
                            
                            color: Colors.grey,
                          )
                       ),
                      ),
                    )
                    ),
                  ],
                ),
              ),

            Align(
              alignment: Alignment.topRight,
              
              child: TextButton(
                style: TextButton.styleFrom(
                  
                  padding: EdgeInsets.zero,
                  minimumSize: Size(0, 0),             // Remove minimum size constraints
                  // tapTargetSize: MaterialTapTargetSize.shrinkWrap, 
                ),
                onPressed: (){
              
              }, 
              child: Text("Forgot Password?",style: TextStyle(color: Color(0xFF0000FF).withOpacity(.7)),)),
            ),

               SizedBox(
                height: 45,
                width: double.infinity,
                 child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF0000FF).withOpacity(.8),
                    
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)
                    )
                  ),
                  onPressed: (){
                  //  Navigator.push(context, MaterialPageRoute(builder: (context){
                  //   return const ForgotPasswordScreen();
                  // }));
                  },
                  child:Text("Login",
                  style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.white),) 
                 ,),
               ),
              SizedBox(height: 25,),
           
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [

                Expanded(
                  child: Divider(
                    color: Colors.grey,
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text("OR",style: TextStyle(fontSize: 16,color: Colors.grey),),
                ),

                Expanded(
                  child: Divider(
                    color: Colors.grey,
                  ),
                ),

               

              ],
            ),

             InkWell(
              onTap: (){

              },
               child: Container(
                margin: EdgeInsets.only(top:20),
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(15)
                  ),
                  child: Row(
                    children: [
               
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: Image.asset("assets/images/google_ic.png",height: 28,),
                      ),
               
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text("Login with Google",),
                      )
                    ],
                  ),
                  
                ),
             ),
             
             SizedBox(height: 20,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Text("New to Logistics?",style: TextStyle(color: Colors.grey),),
                  SizedBox(width: 5.0,),

                  TextButton(
                    style: TextButton.styleFrom(
                      
                      padding: EdgeInsets.zero,
                      minimumSize: Size(0, 0),             // Remove minimum size constraints
                      // tapTargetSize: MaterialTapTargetSize.shrinkWrap, 
                    ),
                    onPressed: (){
                  
                  }, 
                  child: Text("Register",style: TextStyle(color: Color(0xFF0000FF).withOpacity(.7),fontWeight: FontWeight.bold),)),
                ],
              )

          
            ],
          ),
        ),
      ),
    );
  }
}