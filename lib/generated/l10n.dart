// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Home`
  String get tabBarHome {
    return Intl.message(
      'Home',
      name: 'tabBarHome',
      desc: '',
      args: [],
    );
  }

  /// `Mine`
  String get tabBarMe {
    return Intl.message(
      'Mine',
      name: 'tabBarMe',
      desc: '',
      args: [],
    );
  }

  /// `Shop`
  String get tabBarShop {
    return Intl.message(
      'Shop',
      name: 'tabBarShop',
      desc: '',
      args: [],
    );
  }

  /// `Warehouse`
  String get tabBarWarehouse {
    return Intl.message(
      'Warehouse',
      name: 'tabBarWarehouse',
      desc: '',
      args: [],
    );
  }

  /// `I have read and agree to`
  String get labelAgreeToTerms {
    return Intl.message(
      'I have read and agree to',
      name: 'labelAgreeToTerms',
      desc: '',
      args: [],
    );
  }

  /// `Terms of Service`
  String get labelTerms {
    return Intl.message(
      'Terms of Service',
      name: 'labelTerms',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get labelPrivacyPolicy {
    return Intl.message(
      'Privacy Policy',
      name: 'labelPrivacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `User Agreement`
  String get labelUserAgreement {
    return Intl.message(
      'User Agreement',
      name: 'labelUserAgreement',
      desc: '',
      args: [],
    );
  }

  /// `No Information`
  String get noData {
    return Intl.message(
      'No Information',
      name: 'noData',
      desc: '',
      args: [],
    );
  }

  /// `Cancelled login with google`
  String get googleSignInCancelled {
    return Intl.message(
      'Cancelled login with google',
      name: 'googleSignInCancelled',
      desc: '',
      args: [],
    );
  }

  /// `Something went horribly wrong, please try again later!`
  String get commonError {
    return Intl.message(
      'Something went horribly wrong, please try again later!',
      name: 'commonError',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
