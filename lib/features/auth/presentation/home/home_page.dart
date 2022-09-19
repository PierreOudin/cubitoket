import 'package:cubitoket/features/auth/presentation/login/view/login_page.dart';
import 'package:cubitoket/features/auth/presentation/signup/view/sign_up_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(32),
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fitHeight,
              alignment: Alignment.centerRight,
              image:
                  AssetImage("assets/images/istockphoto-96707219-170667a.jpeg"),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: const Image(
                  image: AssetImage("assets/images/800px-Qulbutoké-HGSS.png"),
                  height: 200,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: ((context) => const LoginPage())));
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff5fcbf8),
                    minimumSize: const Size.fromHeight(80),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    textStyle: TextStyle(color: Colors.white, fontSize: 30)),
                child: const Text("Connexion"),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: ((context) => const SignUpPage())));
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff003049),
                    minimumSize: const Size.fromHeight(80),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    textStyle: TextStyle(color: Colors.white, fontSize: 30)),
                child: const Text("Inscription"),
              )
            ],
          )),
    );
  }
}
