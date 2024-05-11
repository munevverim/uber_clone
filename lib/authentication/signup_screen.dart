import 'package:flutter/material.dart';
import 'package:user_app/authentication/login_screen.dart';

import '../methods/common_methods.dart';
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignUpScreen> {
  TextEditingController userNameTextEditingController=TextEditingController();
  TextEditingController userPhoneTxtEditingController=TextEditingController();
  TextEditingController emailTextEditingController =TextEditingController();
  TextEditingController passwordTextEditingController=TextEditingController();
  CommonMethods cMethods=CommonMethods();

  checkIfNetworkAvailable()
  {
    cMethods.checkConnectivity(context);
    signUpFormValidation();



  }
  signUpFormValidation() {
    if (userNameTextEditingController.text
        .trim()
        .length < 3) {
      cMethods.displaySnackBar("your namee must be atleast 4 or mor characters",context );
    }
    else if(userPhoneTxtEditingController.text.trim().length < 7){
      cMethods.displaySnackBar("", context);

    }else if(!emailTextEditingController.text.contains("@")){
      cMethods.displaySnackBar("please write valid email", context);

    }else{

    }





  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Image.asset("assets/images/logo.png"),
              Text("Create a User\'s Account",style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,

              ),),
              Padding(padding: EdgeInsets.all(22),
              child: Column(
                children: [

                  TextField(
                    controller:userNameTextEditingController,
                    keyboardType:TextInputType.text,
                    decoration: InputDecoration(
                      labelText:"User Name",
                      labelStyle: TextStyle(fontSize: 14),),
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                    ),




                  ),
                  const SizedBox(height: 22,),
                  TextField(
                    controller:userPhoneTxtEditingController,
                    keyboardType:TextInputType.text,
                    decoration: InputDecoration(
                      labelText:"User Phone",
                      labelStyle: TextStyle(fontSize: 14),),
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                    ),




                  ),
                  const SizedBox(height: 22,),

                  TextField(
                    controller:emailTextEditingController,
                    keyboardType:TextInputType.emailAddress ,
                    decoration: InputDecoration(
                      labelText:"User Email",
                      labelStyle: TextStyle(fontSize: 14),),
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                    ),




                  ),
                  const SizedBox(height: 22,),
                  TextField(
                    controller:passwordTextEditingController,
                    keyboardType:TextInputType.text ,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText:"User Password",
                      labelStyle: TextStyle(fontSize: 14),),
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                    ),




                  ),
                  const SizedBox(height: 22,),
                  ElevatedButton(onPressed: (){
                    checkIfNetworkAvailable();
                  },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple,
                        padding: EdgeInsets.symmetric(horizontal:80 ,vertical: 10),

                      ),
                      child: const Text("Sign Up"))
                  
                ],

              ),
              ),
              const SizedBox(height: 12,),
              TextButton(onPressed: (){
                Navigator.push(context,MaterialPageRoute(builder: (c)=>LoginScreen()));

              },
                child: Text("Already an Account? Login Here",style: TextStyle(
                  color: Colors.grey,


                ),),

              )



            ],
          ),
        ),

      ) ,
    );
  }
}
