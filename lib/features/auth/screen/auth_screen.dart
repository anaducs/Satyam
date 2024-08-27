import 'package:flutter/material.dart';
import 'package:satyam/common/widgets/custom_textfield.dart';
import 'package:satyam/common/widgets/cutsom_button.dart';
import 'package:satyam/constants/global_variable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum Auth {
  signIn,
  signup,
}




class AuthScreen extends StatefulWidget {
  static const String routeName = '/auth-screen';


  const AuthScreen({super.key});


  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signup;
  final _authSignUp = GlobalKey<FormState>();
  final _authSignIn = GlobalKey<FormState>();
   final TextEditingController _emailController = TextEditingController();
   final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController= TextEditingController();


  @override
  void dispose(){
    super.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _emailController.dispose();

  }



  Widget listtile(String text, Auth value) {
    return ListTile(
      tileColor: _auth == value ? GlobalVariables.backgroundColor:GlobalVariables.greyBackgroundColor,
      title: Text(text, style: GlobalVariables.bodyStyle,),
      leading: Radio(
          value: value,
          groupValue: _auth,
          onChanged: (Auth? val) {
            setState(() {
              _auth = val!;
            });
          }),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundColor,
      body: SafeArea(
          child: Padding(
            padding:  EdgeInsets.all(8.r),
            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'WELCOME',
                  style: GlobalVariables.headingStyle,
                ),
                SizedBox(height: 10.h,),
                listtile('Create Account', Auth.signup),
                if(_auth == Auth.signup)
                  Container(
                    color: GlobalVariables.backgroundColor,
                    padding: EdgeInsets.all(8.r),
                    child: Form(
                        key:_authSignUp,
                        child: Column(
                          children: [
                            CustomTextfield(controller:_nameController, hintText: 'Name',),
                            SizedBox(height: 10.h,),
                            CustomTextfield(controller:_emailController, hintText: 'Email',),
                            SizedBox(height: 10.h,),
                            CustomTextfield(controller:_passwordController, hintText: 'Password',),
                            SizedBox(height: 10.h,),
                            CustomButton(buttonName: 'signup', onTap:(){

                            })
                          ],
                        )


                    ),
                  ),
                listtile('login', Auth.signIn),
                if(_auth == Auth.signIn)
                  Container(
                    color: GlobalVariables.backgroundColor,
                    padding: EdgeInsets.all(8.r),
                    child: Form(
                        key:_authSignIn,
                        child: Column(
                          children: [
                            CustomTextfield(controller:_emailController, hintText: 'Email',),
                            SizedBox(height: 10.h,),
                            CustomTextfield(controller:_passwordController, hintText: 'Password',),
                            SizedBox(height: 10.h,),
                            CustomButton(buttonName: 'Login', onTap:(){

                            })
                          ],
                        )


                    ),
                  ),

                
              ],
            ),
          )),
    );
  }
}
