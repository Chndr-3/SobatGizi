import 'package:flutter/material.dart';
import 'package:sobatgizi/theme.dart';
import 'package:sobatgizi/ui/login/login.dart';
import 'package:sobatgizi/widget_components/elevatedButton.dart';
import 'package:sobatgizi/widget_components/textField.dart';
import '../../provider/auth_provider.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    TextEditingController newEmailController = TextEditingController();
    TextEditingController newPasswordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();
    handleRegister() async {
      if(newPasswordController.text.isNotEmpty || newEmailController.text.isNotEmpty || confirmPasswordController.text.isNotEmpty ) {
        if (newPasswordController.text == confirmPasswordController.text) {
          if (await authProvider.register(
            email: newEmailController.text,
            password: newPasswordController.text,
          )) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Register Berhasil"),
            ));
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => LoginScreen()),
                    (Route<dynamic> route) => false);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Register Gagal"),
            ));
          }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Password konfirmasi tidak sesuai'),
          ));
        }
      }else{
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Isi Semua Field dan sesuaikan Format'),
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
                    "Register",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Mulai dengan mendaftar akun baru",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                  CustomTextField(
                    controller: newEmailController,
                    label: "New Email",
                    obscureText: false,
                  ),
                  CustomTextField(
                    controller: newPasswordController,
                    label: "New Password",
                    obscureText: true,
                  ),
                      CustomTextField(
                        controller: confirmPasswordController,
                        label: "Confirm Password",
                        obscureText: true,
                      ),
                  SizedBox(
                    height: 30,
                  ),
                  CustomButton(
                    onPressed: handleRegister,
                    label: "Register",
                    color: primaryColor,
                  )
                ]))));
  }
}
