import 'package:flutter/material.dart';

import '../helpers/form_validator.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool ispasswordHidden = true;
  GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(           //1st Property of scaffold
        title: Text("LoginPage"),
      ),
      body: Padding(               //properties of padding: symmetric,only,all,fromLTRB
        padding: const EdgeInsets.all(200),
        child: Form(
          key: _formKey,
          child: Column(
            children: [       //multiple textFormField
              TextFormField(
                controller: _emailController,
                validator: FormValidator.isValidEmail,
                autofocus: false, //
                decoration: const InputDecoration(
                  labelText: "Username/email",
                  hintText: "Eg:ammu@gmail.com",
                  border: OutlineInputBorder(

                  ),
                  enabledBorder: OutlineInputBorder()
                ),

              ),
              SizedBox(height: 12),

              TextFormField(

                obscureText: ispasswordHidden,
                controller: _passwordController,
                validator: FormValidator.isValidpassword,
                //password characters convert to dots(.)
                decoration: InputDecoration(
                  suffix: IconButton(onPressed:(){
                    setState((){
                      ispasswordHidden = !ispasswordHidden;
                    });

                    } ,
                    icon: Visibility(
                      visible: ispasswordHidden,
                      child:Icon(Icons.visibility_off),
                      replacement: Icon(Icons.visibility),
                    ),
                  ),

                  labelText: "password",
                    border: OutlineInputBorder(

                    ),
                    enabledBorder: OutlineInputBorder(

                    )



                ),


              ),
              SizedBox(
                height: 30,
              ),


              ElevatedButton(onPressed: (){
                if(_formKey.currentState?.validate() ?? false)// trigger to the validation function
                  {
                   String email = _emailController.text.trim();
                   String password = _passwordController.text;
                   print(email);
                   print(password);
                }
              }, child: Text("LOGIN"))
            ],
          ),
        ),
      ),
    );
  }
}
