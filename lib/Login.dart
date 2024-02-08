import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sawaratask/Screens/home.dart';
import 'package:sawaratask/Service/Loginservice.dart';
import 'package:sawaratask/bottomnavbar/bottomappbar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final formfield = GlobalKey<FormState>();
  LoginService loginservice = Get.put(LoginService());
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  List Logos = [
    'assets/images/google.png',
    'assets/images/linkedin.png',
    'assets/images/Facebook1.png',
    'assets/images/insta.png',
    'assets/images/whatsapp.png'
  ];

  void Login() async {
    String email = emailController.text;
    String password = passwordController.text;

    try {
      var response = await loginservice.login(email, password);

      if (response != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => bottomnavigationbar(),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Internal error occured'),
            duration: Duration(seconds: 3),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Login failed. Please check your credentials'),
          duration: Duration(seconds: 3),
        ),
      );
      print('Exception occurs' + '$e');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // LoginService().login('test45@yopmail.com', 'Test@123');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Text(
                'promilo',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 18),
              ),
            ),
            SizedBox(
              height: 80,
            ),
            Center(
              child: Text(
                'Hi, Welcome Back!',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 18),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              width: double.infinity,
              height: 600,
              child: Form(
                key: formfield,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Please Sign in to continue',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                              color: Colors.grey), // Optional border color
                        ),
                        child: TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter Email or Mob No.',
                          ),
                          validator: (value) {
                            if (value == "") {
                              {
                                return ("Please enter your email");
                              }
                            }

                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Sign In With OTP',
                            style: TextStyle(
                                color: Color.fromARGB(255, 20, 100, 165),
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      SizedBox(height: 16),
                      Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Password',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                              color: Colors.grey), // Optional border color
                        ),
                        child: TextFormField(
                          controller: passwordController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter Password',
                          ),
                          validator: (value) {
                            if (value == "") {
                              {
                                return ("Please enter your password");
                              }
                            }

                            return null;
                          },
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Row(
                              children: [
                                Checkbox(
                                  value: false,
                                  onChanged: (bool? value) {},
                                ),
                                Text('Remember me'),
                              ],
                            ),
                          ),
                          Text(
                            'Forget Password',
                            style: TextStyle(
                                color: Color.fromARGB(255, 20, 100, 165),
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Login();
                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 12.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            primary: Colors.blue[900], // Set dark blue color
                          ),
                          child: Text(
                            'Submit',
                            style: TextStyle(fontSize: 18.0),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 150,
                            height: 1,
                            color: Colors.black,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(
                              'or',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            width: 150,
                            height: 1,
                            color: Colors.black,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Container(
                          height: 50,
                          width: 300,
                          // color: Colors.amber,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: List.generate(
                                Logos.length,
                                (index) =>
                                    Image(image: AssetImage(Logos[index]))),
                          )),
                      SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Business User?',
                            style: TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(255, 100, 100, 100),
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            'Dont have an account',
                            style: TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(255, 100, 100, 100),
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Login Here',
                            style: TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(255, 20, 100, 165),
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Sign Up',
                            style: TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(255, 20, 100, 165),
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Column(
                        children: [
                          Center(
                            child: Text(
                              'By continuing, you agree to',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 13),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Promilos',
                            style: TextStyle(color: Colors.grey, fontSize: 13),
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            'Terms Of Use & Privacy Policy',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
