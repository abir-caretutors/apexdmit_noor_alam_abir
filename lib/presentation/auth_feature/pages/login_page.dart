

import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


class LoginPage extends HookConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, ref) {

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final email = useState("");
    final pass = useState("");
    final visible = useState(false);
    final check = useState(false);

    return SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xFFF6F8FA),
          body: SingleChildScrollView(
            child: Stack(
              children: [
                Container(
              height: height * 0.6,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFF2567E8),
                image: DecorationImage(
                  image: AssetImage("assets/icon/h2.png"), // Replace with your image path
                  //fit: BoxFit.cover,
                ),
              ),child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: height * 0.1),
                  Image.asset('assets/icon/head.png', height: height * 0.05,width: height * 0.05,),
                  SizedBox(height: height * 0.03),
                  Text(
                    textAlign: TextAlign.center,
                    "Sign in to your \nAccount",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: height * 0.045,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: height * 0.02),
                  Text(
                    "Enter your email and password to log in",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: height * 0.018,
                    ),
                  ),
                ],
              ),
              ),

            Column(
              children: [

                Container(
                  //color: Colors.green.withOpacity(0.5),
                  height: height * 0.4,
                ),

                Padding(
                  padding: EdgeInsets.only(left: width * 0.05, right: width * 0.05,),
                  child: Container(
                    height: height * 0.48,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(width * 0.05)
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2), // Adjust opacity for subtle effect
                          spreadRadius: 2,
                          blurRadius: 10,
                          offset: Offset(0, 5), // Moves shadow only downward
                        ),
                      ],
                    ),

                    child: Padding(
                      padding: EdgeInsets.only(top: width * 0.1,  left: width * 0.06, right: width * 0.06,),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextField(
                            decoration: InputDecoration(
                              labelText: "Email",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(width * 0.04,),
                              ),

                            ),
                            onChanged: (value){
                              email.value = value;
                            },
                          ),
                          SizedBox(height: width * 0.05,),
                          TextField(
                            obscureText: visible.value ? true : false,
                            decoration: InputDecoration(
                              labelText: "Password",
                              suffixIcon: IconButton(
                                icon: Icon(visible.value ? Icons.visibility_off : Icons.visibility),
                                onPressed: () {
                                  visible.value = !visible.value; // Toggle visibility
                                },
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(width * 0.04,),
                              ),
                            ),
                            onChanged: (value){
                              pass.value = value;
                            },
                          ),
                          SizedBox(height: width * 0.05,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Checkbox(
                                      checkColor: Colors.white,
                                      activeColor: Color(0xFF2C6CE9),
                                      value: check.value ? true : false,
                                      onChanged: (value) {
                                        check.value = value!;
                                      }
                                  ),
                                  const Text("Remember me"),
                                ],
                              ),
                              Bounce(
                                duration: Duration(milliseconds: 300),
                                onPressed: () {},
                                child: const Text("Forgot Password?", style: TextStyle(color: Color(0xFF6E98EB)),),
                              ),
                            ],
                          ),
                          SizedBox(height: width * 0.05,),
                          Bounce(
                            duration: Duration(milliseconds: 300),
                            onPressed: (){

                              print('>>> email - ${email.value}');
                              print('>>> pass - ${pass.value}');
                            },
                            child: Container(
                              width: double.infinity,
                              height: height * 0.06,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Color(0xFF2C6CE9),
                                borderRadius: BorderRadius.circular(width * 0.04),
                              ),
                              child: Text(
                                "Log In",
                                style: TextStyle(color: Colors.white, fontSize: width * 0.05),
                              ),
                            ),
                          ),
                          SizedBox(height: width * 0.08,),
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("Don't have an account?    "),
                                Bounce(
                                  duration: Duration(milliseconds: 300),
                                  onPressed: () {},
                                  child: const Text("Sign Up", style: TextStyle(color: Color(0xFF6E98EB)),
                                ),),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                  ),
                ),

              ],
            ),




              ],
            ),
          ),
        )
    );
  }
}
