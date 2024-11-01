import 'package:app_challenge/common/presenter/controllers/local_storage_cubit.dart';
import 'package:app_challenge/core/inject/app_inject_config.dart';
import 'package:app_challenge/core/routes/routes.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final LocalStorageCubit _cubit;
  late TextEditingController loginController;
  late TextEditingController passwordLoginController;
  bool isLoading = false;
  String currentName = '';
  String dataName = '';

  @override
  void initState() {
    _cubit = AppInjectConfig.get<LocalStorageCubit>();
    loginController = TextEditingController();
    passwordLoginController = TextEditingController();
    super.initState();
  }

  Future<void> login() async {
    if (loginController.text.isNotEmpty &&
        passwordLoginController.text.isNotEmpty) {
      setState(() {
        isLoading = true;
      });

      await _cubit.saveData(key: 'login', value: currentName);

      if (!mounted) return;

      setState(() {
        loginController.clear();
        passwordLoginController.clear();
        isLoading = false;
      });

      Navigator.pushNamed(context, RoutesNamed.home.route);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill all fields'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 42,
              right: 42,
              bottom: 58,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/images/costa-logo.png',
                  width: 200,
                ),
                const SizedBox(height: 48),
                SizedBox(
                  height: 42,
                  child: TextFormField(
                    controller: loginController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.person,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(50)),
                      ),
                      hoverColor: Theme.of(context).colorScheme.primary,
                      hintText: 'email',
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        currentName = value;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 42,
                  child: TextFormField(
                    obscureText: true,
                    controller: passwordLoginController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock,
                          color: Theme.of(context).colorScheme.primary),
                      hintText: 'password',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(50)),
                      ),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        currentName = value;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: FloatingActionButton(
                    onPressed: () {
                      login();
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    backgroundColor: const Color(0xFF730723),
                    child: isLoading
                        ? const CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.white),
                          )
                        : const Text(
                            "Login",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  "Dont have an account?",
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: -180,
            right: 0,
            left: 0,
            child: SizedBox(
              width: 100,
              child: Image.asset(
                'assets/images/takeaway-coffee.png',
                width: 100,
                opacity: const AlwaysStoppedAnimation(0.3),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
