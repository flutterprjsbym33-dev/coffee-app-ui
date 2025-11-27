import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
final indexProvider = StateProvider<int>((ref) {
  return 0;
});

class SignupLogin extends StatefulWidget {
  @override
  State<SignupLogin> createState() {

   return _SignupLogin();
  }

}

class _SignupLogin extends State<SignupLogin>
{

  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _fullName = TextEditingController();


  List<String> buttons = ['Login', 'SignUp'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue.shade100,
        height: double.infinity,
        width: double.infinity,
        child: Center(
          child: SizedBox(
            height: 650,
            width: 400,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(45),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      'Login Form',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(buttons.length, (index) {
                        return Consumer(
                          builder: (BuildContext context, WidgetRef ref,
                              Widget? child) {
                            final selectedIndex = ref.watch(indexProvider);

                            return GestureDetector(
                              onTap: () {
                                ref.read(indexProvider.notifier).state = index;
                              },
                              child: Align(
                                alignment: Alignment.center,
                                child: SizedBox(
                                  height: 50,
                                  width: 170,
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(45),
                                    ),
                                    child: Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(45),
                                        gradient: selectedIndex == index
                                            ? LinearGradient(colors: [
                                          Colors.blue,
                                          Colors.blueAccent.shade700
                                        ])
                                            : null,
                                      ),
                                      child: Text(
                                        buttons[index],
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: selectedIndex == index
                                              ? Colors.white
                                              : Colors.black,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      }),
                    ),
                    Expanded(
                      child: Consumer(
                        builder: (context, ref, _) {
                          final selectedIndex = ref.watch(indexProvider);
                          return selectedIndex == 0
                              ? Column(
                            children: [
                              SizedBox(height: 45),
                              customText('Email', Icons.email, false,_email),
                              SizedBox(height: 35),
                              customText('Password', Icons.lock, true,_password),
                              SizedBox(height: 40),
                              Text(
                                'Continue With',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Divider(),
                              SizedBox(height: 15),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                children: [
                                  Column(
                                    children: [
                                      Image.asset(
                                          'assets/images/facebook.png'),
                                      Text('Facebook')
                                    ],
                                  ),
                                  SizedBox(width: 40),
                                  Column(
                                    children: [
                                      Image.asset(
                                          'assets/images/google.png'),
                                      Text('Google')
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 70),
                              Container(
                                height: 45,
                                width: 200,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(45),
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.blue.shade400,
                                      Colors.blueAccent.shade700
                                    ],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                  ),
                                ),
                                child: Text(
                                  'Login',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ],
                          )
                              : Column(
                            children: [
                              SizedBox(height: 35),
                              customText(
                                  'Full name', Icons.email, false,_fullName),
                              SizedBox(height: 35),
                              customText('Email', Icons.email, false,_email),
                              SizedBox(height: 35),
                              customText('Password', Icons.lock, true,_password),
                              SizedBox(height: 40),
                              Text(
                                'Continue With',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Divider(),
                              SizedBox(height: 15),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                children: [
                                  Column(
                                    children: [
                                      Image.asset(
                                          'assets/images/facebook.png'),
                                      Text('Facebook')
                                    ],
                                  ),
                                  SizedBox(width: 40),
                                  Column(
                                    children: [
                                      Image.asset(
                                          'assets/images/google.png'),
                                      Text('Google')
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 50),
                              Container(
                                height: 40,
                                width: 200,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(45),
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.blue.shade400,
                                      Colors.blueAccent.shade700
                                    ],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                  ),
                                ),
                                child: Text(
                                  'SignUp',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget customText(String hint, IconData icon, bool pass, TextEditingController controller) {
  return Container(
    height: 48,
    width: 350,
    child: TextField(
      controller:  controller,
      obscureText: pass,
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: Colors.grey,
            width: 2,
          ),
        ),
      ),
    ),
  );
}
