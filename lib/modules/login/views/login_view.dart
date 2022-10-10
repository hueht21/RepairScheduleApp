import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


import '../controllers/login_controllers.dart';
import '../../../Utils/img.dart';

class LoginView extends StatelessWidget {
  TextEditingController edtEmail = TextEditingController(text: "phamngochue127@gmail.com");
  TextEditingController edtPass = TextEditingController(text: "12345678");
//cái này init ở main
  Future<FirebaseApp> _initalizeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  Future<User?> loginUsingEmailPasss({required String email, required String pass, required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential =
          await auth.signInWithEmailAndPassword(email: email, password: pass);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        print("Khong tim thay email");
      }
    }
    return user;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: Colors.white,
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: const SystemUiOverlayStyle(
            statusBarColor: Color.fromRGBO(143, 148, 251, 1),
            systemNavigationBarColor: Color.fromRGBO(143, 148, 251, 1),
            statusBarIconBrightness: Brightness.dark,
            systemNavigationBarIconBrightness: Brightness.dark,
          ),
          child: SafeArea(
              child: SingleChildScrollView(child: FutureBuilder(
              future: _initalizeFirebase(),
              builder: (context, snapshop) {
                if (snapshop.connectionState == ConnectionState.done) {
                  return _login(context);
                } else {
                  return const Text("data loi");
                }
              },
            ),
          )),
        ));
  }

  Widget _login(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[_viewFrom(), _formLogin(context)],
      ),
    );
  }

  Widget _viewFrom() {
    return Container(
      height: 400,
      decoration: const BoxDecoration(
          image:
              DecorationImage(image: AssetImage(background), fit: BoxFit.fill)),
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 30,
            width: 80,
            height: 200,
            child: Container(
                decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage(lignt)),
            )),
          ),
          Positioned(
            left: 140,
            width: 80,
            height: 150,
            child: Container(
                decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage(lignt2)),
            )),
          ),
          Positioned(
            right: 40,
            top: 40,
            width: 80,
            height: 150,
            child: Container(
                decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage(clock)),
            )),
          ),
          Positioned(
            child: Container(
              margin: const EdgeInsets.only(top: 50),
              child: const Center(
                child: Text(
                  "Login",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _formLogin(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                      color: Color.fromRGBO(143, 148, 251, .2),
                      blurRadius: 20.0,
                      offset: Offset(0, 10))
                ]),
            child: Column(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      border:
                          Border(bottom: BorderSide(color: Colors.grey[100]!))),
                  child: TextField(
                    controller: edtEmail,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Email",
                        hintStyle: TextStyle(color: Colors.grey[400])),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    controller: edtPass,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Password",
                        hintStyle: TextStyle(color: Colors.grey[400])),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          InkWell(
            onTap: () async {

              LoginControl.Loginn(email: edtEmail.text, pass: edtPass.text, context: context);
              //Accout(email: edtEmail.text, pass: edtPass.text);
            },
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: const LinearGradient(colors: [
                    Color.fromRGBO(143, 148, 251, 1),
                    Color.fromRGBO(143, 148, 251, .6),
                  ])),
              child: const Center(
                child: Text(
                  "Login",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 70,
          ),
          const Text(
            "Forgot Password?",
            style: TextStyle(color: Color.fromRGBO(143, 148, 251, 1)),
          ),
        ],
      ),
    );
  }
}
