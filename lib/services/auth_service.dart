import 'package:e_commerce_app/generated/l10n.dart';
import 'package:e_commerce_app/utils/logger.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';

const _scopesByGoogle = [
  'email',
];

class AuthService {
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: _scopesByGoogle);

  // Google Sign In
  GoogleSignInAccount? _currentGoogleUser;
  bool _isGoogleAuthorized = false;

  Future<Map<String, dynamic>?> signInByGoogle() async {
    try {
      final GoogleSignInAccount? gUser = await _googleSignIn.signIn();
      logger.d('[gUser]: ${gUser}');
      if (gUser != null) {
        return {
          'id': gUser.id,
          'email': gUser.email,
          'photoUrl': gUser.photoUrl,
          'displayName': gUser.displayName,
          'serverAuthCode': gUser.serverAuthCode
        };
      } else {
        Fluttertoast.showToast(msg: S.current.googleSignInCancelled);
      }
    } catch (e) {
      logger.d('[getGoogleSignInAccount] $e');
      throw Exception(S.current.commonError);
    }
  }

  void onSignInPageInitState() {
    _googleSignIn.onCurrentUserChanged
        .listen((GoogleSignInAccount? account) async {
      bool isAuthorized = account != null;
      // However, on web...
      if (kIsWeb && account != null) {
        isAuthorized = await _googleSignIn.canAccessScopes(_scopesByGoogle);
      }

      _currentGoogleUser = account;
      _isGoogleAuthorized = isAuthorized;

      logger.d('[_currentGoogleUser]: $_currentGoogleUser');
      logger.d('[_isGoogleAuthorized]: $_isGoogleAuthorized');

      if (_isGoogleAuthorized && _currentGoogleUser != null) {
        // 跳转进首页
      }
    });

    // In the web, _googleSignIn.signInSilently() triggers the One Tap UX.
    //
    // It is recommended by Google Identity Services to render both the One Tap UX
    // and the Google Sign In button together to "reduce friction and improve
    // sign-in rates" ([docs](https://developers.google.com/identity/gsi/web/guides/display-button#html)).
    _googleSignIn.signInSilently();
  }

  Future<void> _handleAuthorizeScopes() async {
    final bool isAuthorized =
        await _googleSignIn.requestScopes(_scopesByGoogle);
    _isGoogleAuthorized = isAuthorized;
  }

  Future<GoogleSignInAccount?> signOutByGoogle() async {
    try {
      return await _googleSignIn.signOut();
    } catch (e) {
      logger.d('[signOutGoogleAccount] $e');
      throw Exception(S.current.commonError);
    }
  }
}
