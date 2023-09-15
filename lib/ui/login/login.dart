import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sobatgizi/theme.dart';
import 'package:sobatgizi/ui/home/home.dart';
import 'package:sobatgizi/ui/register/register.dart';
import 'package:sobatgizi/widget_components/elevatedButton.dart';
import 'package:sobatgizi/widget_components/textField.dart';
import 'package:provider/provider.dart';
import '../../provider/auth_provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    TextEditingController usernameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    handleLogin() async {
      if (await authProvider.login(
        email: usernameController.text,
        password: passwordController.text,
      )) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Login Berhasil"),
        ));
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (context) => HomeScreen(user: authProvider.user)),
            (Route<dynamic> route) => false);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Login Gagal"),
        ));
      }
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/SobatGizi.png",
              scale: 4,
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Login ke SobatGizi",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Makan menu cepat saji? jangan takut",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            CustomTextField(
                controller: usernameController,
                label: "Email",
                obscureText: false),
            CustomTextField(
              controller: passwordController,
              label: "Password",
              obscureText: true,
            ),
            RichText(
              text: TextSpan(
                  text: 'Belum punya akun?',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                  children: <TextSpan>[
                    TextSpan(
                        text: ' Daftar di sini',
                        style: TextStyle(color: primaryColor, fontSize: 16),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RegisterScreen(),
                                ));
                          })
                  ]),
            ),
            SizedBox(
              height: 30,
            ),
            CustomButton(
              onPressed: handleLogin,
              label: "Login",
              color: primaryColor,
            ),
          ],
        )),
      ),
    );
  }
}
