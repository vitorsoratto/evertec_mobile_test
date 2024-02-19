import 'package:evertec_mobile_test/app/shared/utils/app_colors.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool showPassword = true;

  void showToast(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _header(),
            _fields(),
            _socialButtons(),
          ],
        ),
      ),
    );
  }

  Widget _header() {
    return Container(
      color: AppColors.secondaryGray,
      width: double.maxFinite,
      child: Stack(
        children: [
          Center(
            child: Image.asset(
              'assets/images/login-image.png',
              height: 300,
            ),
          ),
          const SizedBox(
            height: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text('Bienvenido a:'),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    'Evertec',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _field(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12, bottom: 5),
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 13,
              ),
            ),
          ),
          const TextField(
              maxLines: 1,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(14)),
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
              ),
              style: TextStyle(
                fontSize: 14,
              )),
        ],
      ),
    );
  }

  Widget _passwordField() {
    void changePasswordVisibility() {
      setState(() {
        showPassword = !showPassword;
      });
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 12, bottom: 5),
            child: Text(
              'Contraseña:',
              style: TextStyle(
                fontSize: 13,
              ),
            ),
          ),
          TextField(
              maxLines: 1,
              obscureText: showPassword,
              enableSuggestions: false,
              autocorrect: false,
              decoration: InputDecoration(
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                suffixIcon: IconButton(
                    onPressed: () => changePasswordVisibility(),
                    icon: Icon(
                      showPassword ? Icons.visibility_off : Icons.visibility,
                      color: Colors.grey,
                    )),
              ),
              style: const TextStyle(
                fontSize: 14,
              )),
        ],
      ),
    );
  }

  Widget _fields() {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: Column(
          children: [
            _field('Tipo Documento:'),
            _field('Número Documento:'),
            _passwordField(),
            Container(
              width: double.maxFinite,
              padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 10),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.lightOrange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
                  'Login',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            GestureDetector(
              onTap: () => showToast('Registrar Usuario'),
              child: const Text(
                'Registrar Usuario',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _socialButtons() {
    Widget socialButton(String image, String name) {
      return GestureDetector(
        onTap: () => showToast('Login con $name'),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.secondaryGray,
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                // spreadRadius: 1,
                blurRadius: 3,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Image.asset(image, width: 30),
          ),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          socialButton('assets/images/google-logo.png', 'Google'),
          socialButton('assets/images/facebook-logo.png', 'Facebook'),
          socialButton('assets/images/instagram-logo.png', 'Instagram'),
        ],
      ),
    );
  }
}
