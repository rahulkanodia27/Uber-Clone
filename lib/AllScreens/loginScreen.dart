import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:rider_app/AllScreens/mainscreen.dart';
import 'package:rider_app/AllScreens/registrationScreen.dart';
import 'package:rider_app/main.dart';

class LoginScreen extends StatelessWidget {
  static const idScreen = "login";

  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
   LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(height: 10.0,),
                Image(image: AssetImage("images/logo.png"),
                width: 300.0,
                height: 300.0,
                alignment: Alignment.center,
                ),
                SizedBox(height: 1.0,),
                Text("Login as a Rider",
                style: TextStyle(fontSize: 24.0,fontFamily:  "Brand Bold"),
                textAlign: TextAlign.center,
                ),
                Padding(padding: EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    
                SizedBox(height: 1.0,),
        
                TextField(
                  controller: emailTextEditingController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: "Email",
                    labelStyle: TextStyle(
                      fontSize: 14.0,
                    ),
                    hintStyle: TextStyle(color: Colors.grey,fontSize: 14.0),
                  ),
                  style: TextStyle(fontSize: 20.0),
                ),
                SizedBox(height: 10.0,),
        
                TextField(
                  controller: passwordTextEditingController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Password",
                    labelStyle: TextStyle(
                      fontSize: 14.0,
                    ),
                    hintStyle: TextStyle(color: Colors.grey,fontSize: 14.0),
                  ),
                  style: TextStyle(fontSize: 10.0),
                ),
                SizedBox(height: 20.0,),
                ElevatedButton(
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.yellow),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.0),
            )
          )
                  ),
                  child: Container(
                  height: 50.0,
                  child: Center(
                    child: Text("Login",
                    style: TextStyle(fontSize: 18.0,fontFamily: "Brand Bold",color: Colors.white),
                    ),
                  ),
                ),
                onPressed: (){
                 if(!emailTextEditingController.text.contains("@")){
                    displayToastMassage('Email Address is not Valid', context);
                  }else if(passwordTextEditingController.text.isEmpty){
                    displayToastMassage('Password is mandatory', context);
                  }else{
                    loginAndAuthenticateUser(context);

                  }
                  
                },)
                  ],
                ),
                ),
        
                TextButton(onPressed: (){
                  Navigator.pushNamedAndRemoveUntil(context, RegistrationScreen.idScreen, (route) => false);
                }, child: Text("Do not Have an Account? Register Here."))
              ],
            ),
          ),
        ),
      ),
    );
  }

   final FirebaseAuth _firebaseAuth = FirebaseAuth.instance; 
  void loginAndAuthenticateUser(BuildContext context) async {

    final  firebaseUser = (await _firebaseAuth.signInWithEmailAndPassword(
        email: emailTextEditingController.text,
        password: passwordTextEditingController.text,
      ).catchError((erMsg){
        displayToastMassage("Error: "+erMsg.toString(), context);
      })).user;

    if(firebaseUser != null){
        //save user info to database
        // print("yha tk to shi h");
        // userRef.child(firebaseUser.uid).once().then((value) => (DataSnapshot snap){
        //   print("eska pta nhi");
        //   if(snap.value!=null){
            
        //     Navigator.pushNamedAndRemoveUntil(context, MainScreen.idScreen, (route) => false);
        //     displayToastMassage("You are Logged In now.", context);
        //   }
        //   else{
        //     _firebaseAuth.signOut();
        //     displayToastMassage("No record found for this user. Plase create new account.", context);
        //   }
        // });
         Navigator.pushNamedAndRemoveUntil(context, MainScreen.idScreen, (route) => false);
            displayToastMassage("You are Logged In now.", context);

      }else{
        // error ocured - display error msg
        displayToastMassage("Error Occured, can not be signed In", context);
      }
  }
}