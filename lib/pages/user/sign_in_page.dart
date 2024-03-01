import 'package:e_commerce_app/generated/l10n.dart';
import 'package:e_commerce_app/services/auth_service.dart';
import 'package:e_commerce_app/utils/tracker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  static const routeName = '/signIn';

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _shared = GetIt.instance.get<SharedPreferences>();
  final _authService = AuthService();
  String _email = '';
  String _password = '';

  bool get _isInputValid =>
      _email.isNotEmpty &&
      _password.length >= 6 &&
      (_shared.getBool('isAuthorizationGranted') ?? false);

  @override
  void initState() {
    super.initState();

    _authService.onSignInPageInitState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        forceMaterialTransparency: true,
      ),
      body: SizedBox(
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).padding.bottom),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          tracker.trackEvent(eventId: 'loginByGoogle');
                          if (_shared.getBool('isAuthorizationGranted') ??
                              false) {
                            _authService.signInByGoogle().then((gUser) {
                              // 与服务端交互授权登录
                            }).onError((error, stackTrace) {
                              Fluttertoast.showToast(msg: "$error");
                            });
                          } else {
                            Fluttertoast.showToast(
                                msg: S.of(context).labelUserAgreement);
                          }
                        },
                        icon: Icon(Icons.login),
                        // icon: Image.asset(
                        //   'assets/images/user/btn_google.png',
                        //   width: 64,
                        //   height: 64,
                        // ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
