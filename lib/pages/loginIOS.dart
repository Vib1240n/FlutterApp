import 'package:flutter/cupertino.dart';

import '../pages/profile.dart';
import '../server/Authentication.dart';

// NOTE view for IOS Devices
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    /**Main view widget */
    return GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: CupertinoPageScaffold(
          backgroundColor: const Color.fromRGBO(124, 124, 124, 0.745),
          child: Center(
              /**Main Column */
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                const Expanded(
                    child: Padding(
                        padding: EdgeInsets.only(top: 50, left: 20),
                        child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Login',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            )))),
                /** UserName, Password Text fields, Login button and Error Handling */
                Expanded(
                    child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Flex(
                          direction: Axis.vertical,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            CupertinoTextField.borderless(
                              textInputAction: TextInputAction.next,
                              padding: const EdgeInsets.only(
                                top: 10,
                                bottom: 10,
                              ),
                              maxLines: 1,
                              placeholder: 'Username or Email',
                              decoration: BoxDecoration(
                                  color: const Color.fromRGBO(255, 255, 255, 0.1),
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            CupertinoTextField.borderless(
                              textInputAction: TextInputAction.next,
                              maxLines: 1,
                              padding: const EdgeInsets.all(10),
                              placeholder: 'Password',
                              obscureText: true,
                              decoration: BoxDecoration(
                                  color: const Color.fromRGBO(255, 255, 255, 1),
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            CupertinoButton.filled(
                                onPressed: () => () {
                                      Authentication auth = Authentication();
                                      if (auth.isAuthenticated(['', '']) == true) {
                                        Navigator.push(
                                            context,
                                            CupertinoPageRoute(
                                                builder: (context) => const MyProfile()));
                                      } else {
                                        showCupertinoDialog<void>(
                                            context: context,
                                            builder: (BuildContext context) => CupertinoAlertDialog(
                                                  title: const Text('Error'),
                                                  content: const Text('Invalid Credentials'),
                                                  actions: [
                                                    CupertinoDialogAction(
                                                      onPressed: () => Navigator.of(context).pop(),
                                                      child: const Text('OK'),
                                                    ),
                                                  ],
                                                ));
                                      }
                                    },
                                child: const Text('Login')),
                          ],
                        ))),
              ])),
        ));
  }
}

class LoginWidget extends StatelessWidget {
  const LoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton.filled(
        child: const Text('Login 12w3'),
        onPressed: () {
          _login(context);
        });
  }

  void _login(BuildContext context) {
    Authentication auth = Authentication();
    if (auth.isAuthenticated(['', '']) == true) {
      Navigator.push(context, CupertinoPageRoute(builder: (context) => const MyProfile()));
    }
  }
}
