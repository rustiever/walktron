import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:walktron/controllers/controllers.dart';
import 'package:walktron/router.dart';
import 'package:walktron/views/auth/widgets.dart';

class LoginView extends GetView<AuthController> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: Stack(
              alignment: Alignment.center,
              children: [
                ClipPath(
                  clipper: WaveClipper2(),
                  child: Container(
                    width: double.infinity,
                    // height: size.height * 0.3,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Color(0x22ff3a5a), Color(0x22fe494d)])),
                  ),
                ),
                ClipPath(
                  clipper: WaveClipper3(),
                  child: Container(
                    width: double.infinity,
                    // height: 300,
                    // height: size.height * 0.3,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Color(0x44ff3a5a), Color(0x44fe494d)])),
                  ),
                ),
                ClipPath(
                  clipper: WaveClipper1(),
                  child: Container(
                    width: double.infinity,
                    // height: 300,
                    // height: size.height * 0.3,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xffff3a5a),
                          Color(0xfffe494d),
                        ],
                      ),
                    ),
                  ),
                ),
                Row(
                  children: const <Widget>[
                    Spacer(),
                    Icon(
                      Icons.sports_football_sharp,
                      color: Colors.white,
                      size: 60,
                    ),
                    Text(
                      "Walktron",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 30,
                      ),
                    ),
                    Spacer()
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            flex: 5,
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Material(
                      elevation: 2.0,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(30),
                      ),
                      child: TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'enter something to validate';
                          }
                          return GetUtils.isEmail(value)
                              ? null
                              : "don't you have patience to enter proper email";
                        },
                        controller: controller.email,
                        onChanged: (String value) {},
                        cursorColor: Colors.deepOrange,
                        decoration: const InputDecoration(
                          hintText: "Email",
                          prefixIcon: Material(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            child: Icon(
                              Icons.email,
                              color: Colors.red,
                            ),
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 25, vertical: 13),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Material(
                      elevation: 2.0,
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                      child: TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'enter something to validate';
                          }
                          return GetUtils.isLengthGreaterOrEqual(value, 3)
                              ? null
                              : "can't you enter a proper password";
                        },
                        controller: controller.pass,
                        onChanged: (String value) {},
                        cursorColor: Colors.deepOrange,
                        decoration: const InputDecoration(
                            hintText: "Password",
                            prefixIcon: Material(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              child: Icon(
                                Icons.lock,
                                color: Colors.red,
                              ),
                            ),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 25, vertical: 13)),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      const Spacer(),
                      FlatButton(
                        onPressed: () {},
                        child: const Text(
                          'Forgot Password ?',
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 14,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Container(
                      width: double.maxFinite,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(100),
                        ),
                        color: Color(0xffff3a5a),
                      ),
                      child: FlatButton(
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            controller.login();
                            print('hello');
                          }
                        },
                        child: const Text(
                          "Login",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                  const HorizontalOrLine(height: 3, label: 'OR'),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Container(
                      width: double.maxFinite,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(100),
                        ),
                        color: Color(0xffff3a5a),
                      ),
                      child: FlatButton.icon(
                        icon: const FaIcon(FontAwesomeIcons.google),
                        onPressed: () {
                          controller.googleSignIn();
                        },
                        label: const Text(
                          "Google",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        "Don't have an Account ?  ",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.normal),
                      ),
                      InkWell(
                        onTap: () {
                          Get.offAndToNamed(signUpRoute);
                        },
                        child: const Text(
                          "Sign Up ",
                          style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

// class WaveClipper1 extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     final path = Path();
//     path.lineTo(0.0, size.height - 50);

//     final firstEndPoint = Offset(size.width * 0.6, size.height - 29 - 50);
//     final firstControlPoint = Offset(size.width * .25, size.height - 60 - 50);
//     path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
//         firstEndPoint.dx, firstEndPoint.dy);

//     final secondEndPoint = Offset(size.width, size.height - 60);
//     final secondControlPoint = Offset(size.width * 0.84, size.height - 50);
//     path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
//         secondEndPoint.dx, secondEndPoint.dy);
//     path.lineTo(size.width, size.height);
//     path.lineTo(size.width, 0);
//     path.close();
//     return path;
//   }

//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) {
//     return false;
//   }
// }

// class WaveClipper3 extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     final path = Path();
//     path.lineTo(0.0, size.height - 50);

//     final firstEndPoint = Offset(size.width * 0.6, size.height - 15 - 50);
//     final firstControlPoint = Offset(size.width * .25, size.height - 60 - 50);
//     path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
//         firstEndPoint.dx, firstEndPoint.dy);

//     final secondEndPoint = Offset(size.width, size.height - 40);
//     final secondControlPoint = Offset(size.width * 0.84, size.height - 30);
//     path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
//         secondEndPoint.dx, secondEndPoint.dy);
//     path.lineTo(size.width, size.height);
//     path.lineTo(size.width, 0);
//     path.close();
//     return path;
//   }

//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) {
//     return false;
//   }
// }

// class WaveClipper2 extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     final path = Path();
//     path.lineTo(0.0, size.height - 50);

//     final firstEndPoint = Offset(size.width * .7, size.height - 40);
//     final firstControlPoint = Offset(size.width * .25, size.height);
//     path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
//         firstEndPoint.dx, firstEndPoint.dy);

//     final secondEndPoint = Offset(size.width, size.height - 45);
//     final secondControlPoint = Offset(size.width * 0.84, size.height - 50);
//     path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
//         secondEndPoint.dx, secondEndPoint.dy);
//     path.lineTo(size.width, size.height);
//     path.lineTo(size.width, 0);
//     path.close();
//     return path;
//   }

//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) {
//     return false;
//   }
// }

// class HorizontalOrLine extends StatelessWidget {
//   const HorizontalOrLine({
//     this.label,
//     this.height,
//   });

//   final String label;
//   final double height;

//   @override
//   Widget build(BuildContext context) {
//     return Row(children: <Widget>[
//       Expanded(
//         child: Container(
//             margin: const EdgeInsets.only(left: 10.0, right: 15.0),
//             child: Divider(
//               color: Colors.black,
//               height: height,
//             )),
//       ),
//       Text(
//         label,
//         style: const TextStyle(
//             color: Colors.red, fontSize: 20, fontWeight: FontWeight.w700),
//       ),
//       Expanded(
//         child: Container(
//             margin: const EdgeInsets.only(left: 15.0, right: 10.0),
//             child: Divider(
//               color: Colors.black,
//               height: height,
//             )),
//       ),
//     ]);
//   }
// }
