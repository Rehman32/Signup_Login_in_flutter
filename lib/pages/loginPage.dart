import 'package:flutter/material.dart';
import "package:firebase_auth/firebase_auth.dart";
import 'signupPage.dart';
import './Dashboard.dart';
class LoginPage extends StatefulWidget{
  @override
  _LoginPageState createState()=> _LoginPageState();

}

class _LoginPageState extends State<LoginPage>{
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController= TextEditingController();
  final TextEditingController _passwordController= TextEditingController();
  Future<void> _login() async {
    if(_formKey.currentState!.validate()){
      try{
          UserCredential userCredential= await FirebaseAuth.instance.signInWithEmailAndPassword(
              email: _emailController.text.trim(),
              password: _passwordController.text.trim());
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context)=> Dashboard()));
      } on FirebaseAuthException catch (e){
        String errorMessage='An error Occured during login';
        if(e.code == 'user-not-found'){
          errorMessage ='No user Found for that email.';
        }else if (e.code == 'wrong-password'){
          errorMessage='you entered wrong email';
        }
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(errorMessage,
            style: TextStyle(color: Colors.redAccent),
          ))
        );
      }catch (e){
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("An Error Occured"))
        );
      }
    }
  }
  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
        child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value){
                    if(value==null || value.isEmpty){
                      return "Please enter your email";
                    }

                    return null;
                  },
                ),
                SizedBox(height: 10,),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: "Password",
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },

                ),
                SizedBox(height: 10,),
                ElevatedButton(
                    onPressed: _login,
                    child: Text("Login"),
                ),
                SizedBox(height: 10,),
                TextButton(
                  onPressed: () {
                    // TODO: Navigate to the signup page
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignupPage()),
                    );
                  },
                  child: Text('Don\'t have an account? Sign up'),
                ),
              ],
            )
        ),
      ),
    );
  }
}