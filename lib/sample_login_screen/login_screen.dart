import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testing_widgets/sample_login_screen/login_provider.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFD6E2EA),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.34,
              child: Center(
                child: Consumer<LoginProvider>(
                  builder: (context, provider, child) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * 0.34,
                      child: Center(
                        child: Consumer<LoginProvider>(
                          builder: (context, provider, child) {
                            if (provider.trigSuccess) {
                              return const Icon(Icons.check_circle,
                                  color: Colors.green, size: 48);
                            } else if (provider.trigFail) {
                              return const Icon(Icons.error,
                                  color: Colors.red, size: 48);
                            }
                            return const Text(
                              'Welcome!',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            _loginSection(context),
          ],
        ),
      ),
    );
  }

  Widget _loginSection(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Padding(
      padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: MediaQuery.of(context).size.height * 0.04,
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.3,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Focus(
                onFocusChange: (hasFocus) {
                  context.read<LoginProvider>().setIsChecking(hasFocus);
                },
                child: Padding(
                  padding:
                      EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
                  child: TextFormField(
                    key: const ValueKey('username'),
                    controller: emailController,
                    decoration: InputDecoration(
                      hintText: 'Enter Username',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onChanged: (value) {
                      context
                          .read<LoginProvider>()
                          .setNumLook(value.length.toDouble());
                    },
                  ),
                ),
              ),
              Focus(
                onFocusChange: (hasFocus) {
                  context.read<LoginProvider>().setCloseEyes(hasFocus);
                },
                child: Padding(
                  padding:
                      EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
                  child: TextFormField(
                    key: const ValueKey('password'),
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Enter Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.07,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.04,
                    vertical: MediaQuery.of(context).size.width * 0.02,
                  ),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    onPressed: () {
                      FocusManager.instance.primaryFocus?.unfocus();
                      context.read<LoginProvider>().submit(
                            emailController.text,
                            passwordController.text,
                          );
                    },
                    child: const Text('Submit'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
