import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:walktron/controllers/controllers.dart';
import 'package:walktron/router.dart';
import 'package:walktron/views/auth/widgets.dart';

class SignUpView extends GetView<AuthController> {
  final _sFormKey = GlobalKey<FormState>();
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
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Color(0x22ff3a5a), Color(0x22fe494d)])),
                  ),
                ),
                ClipPath(
                  clipper: WaveClipper3(),
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Color(0x44ff3a5a), Color(0x44fe494d)])),
                  ),
                ),
                ClipPath(
                  clipper: WaveClipper1(),
                  child: Container(
                    width: double.infinity,
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
                Positioned(
                  child: Row(
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
                ),
              ],
            ),
          ),
          Expanded(
            flex: 5,
            child: Form(
              key: _sFormKey,
              child: Column(
                children: [
                  const Spacer(),
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
                          return GetUtils.isEmail(value)
                              ? null
                              : "don't you have patience to enter proper email";
                        },
                        textInputAction: TextInputAction.next,
                        autofocus: true,
                        controller: controller.email,
                        onChanged: (String value) {},
                        cursorColor: Colors.deepOrange,
                        decoration: const InputDecoration(
                            hintText: "Email",
                            prefixIcon: Material(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              child: Icon(
                                Icons.email,
                                color: Colors.red,
                              ),
                            ),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 25, vertical: 13)),
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
                        obscureText: controller.passVisible.value,
                        onChanged: (String value) {},
                        cursorColor: Colors.deepOrange,
                        decoration:  InputDecoration(
                            hintText: "Password",
                            prefixIcon: const Material(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              child:  Icon(
                                Icons.lock,
                                color: Colors.red,
                              ),
                            ),
                            suffixIcon: Material(
                              borderRadius:
                                   const BorderRadius.all(Radius.circular(30)),
                              child: Obx(
                                () => IconButton(
                                  icon: Icon(controller.passVisible.value
                                      ? Icons.visibility
                                      : Icons.visibility_off),
                                  onPressed: () {
                                    controller.passVisible.toggle();
                                  },
                                ),
                              ),
                            ),
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 25, vertical: 13)),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
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
                          if (_sFormKey.currentState.validate()) {
                            controller.signUp();
                            print('hello');
                          }
                        },
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            // fontSize: 18,
                          ),
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
                        icon: const FaIcon(
                          FontAwesomeIcons.google,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                        label: const Text(
                          "Google",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            // fontSize: 18,
                          ),
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
                        "Already have an Account ? ",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.normal),
                      ),
                      InkWell(
                        onTap: () => Get.offAndToNamed(loginRoute),
                        child: const Text(
                          "Login ",
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
