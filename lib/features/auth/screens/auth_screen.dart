import 'package:e_commerce_application/features/auth/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_application/constants/global_vars.dart';
import 'package:e_commerce_application/Common/widgets/custom_button.dart';
import 'package:e_commerce_application/Common/widgets/custom_textfield.dart';

enum Auth {
  signin,
  signup,
}

class AuthScreen extends StatefulWidget {
  const AuthScreen({ super.key });
  static const String routeName = '/auth-screen';

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signup;
  final _signupFormKey = GlobalKey<FormState>();
  final _signinFormKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthService authService = AuthService();

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void signUpUser() {
      authService.signUpUser(name: _nameController.text, email: _emailController.text, password: _passwordController.text, context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVars.greyBackgroundColor,
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Text('Welcome', style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
                ),
                ListTile(
                  title: const Text('Create Account', style: TextStyle(fontWeight: FontWeight.bold),),
                  tileColor: ((_auth == Auth.signup) ? GlobalVars.backgroundColor : GlobalVars.greyBackgroundColor),
                  leading: Radio(
                      activeColor:GlobalVars.secondaryColor,
                      value: Auth.signup,
                      groupValue: _auth,
                      onChanged: (Auth? val) {
                        setState(() {
                          _auth = val!;
                        });
                      }),
                ),
                if(_auth == Auth.signup)
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: GlobalVars.backgroundColor,
                    child: Form(
                      key: _signupFormKey,
                      child: Column(
                        children: [
                          CustomTextField(controller: _nameController, hintText: 'Name',),
                          const SizedBox(height: 10,),
                          CustomTextField(controller: _emailController, hintText: 'Email',),
                          const SizedBox(height: 10,),
                          CustomTextField(controller: _passwordController, hintText: 'Password',),
                          const SizedBox(height: 10,),
                          CustomButton(text: 'Create Account', onTap: () {
                            if(_signupFormKey.currentState!.validate()) {
                              signUpUser();
                            }
                          })
                        ],
                      )
                    ),
                  ),
                ListTile(
                  title: const Text('Sign In', style: TextStyle(fontWeight: FontWeight.bold),),
                  tileColor: ((_auth == Auth.signin) ? GlobalVars.backgroundColor : GlobalVars.greyBackgroundColor),
                  leading: Radio(
                      activeColor:GlobalVars.secondaryColor,
                      value: Auth.signin,
                      groupValue: _auth,
                      onChanged: (Auth? val) {
                        setState(() {
                          _auth = val!;
                        });
                      }),
                ),
                if(_auth == Auth.signin)
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: GlobalVars.backgroundColor,
                    child: Form(
                      key: _signinFormKey,
                      child: Column(
                        children: [
                          CustomTextField(controller: _emailController, hintText: 'Email',),
                          const SizedBox(height: 10,),
                          CustomTextField(controller: _passwordController, hintText: 'Password',),
                          const SizedBox(height: 10,),
                          CustomButton(text: 'Sign In', onTap: () {})
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          )
      ),
    );
  }
}