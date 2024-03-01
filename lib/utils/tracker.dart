import 'package:e_commerce_app/config/env.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Tracker {
  static final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;
  final _shared = GetIt.instance.get<SharedPreferences>();

  trackEvent({required String eventId, Map<String, Object?>? parameters}) {
    if (!Env.inProduction) return;

    try {
      String langCode = _shared.getString('appLang') ?? 'unknown';
      final parametersMap = {
        'channel': Env.channel,
        'lang': langCode,
        ...(parameters ?? {}),
      };

      try {
        _analytics.logEvent(name: eventId, parameters: parametersMap);
        // ignore: empty_catches
      } catch (e) {}
    } catch (e) {
      // ignore
    }
  }
}

final Tracker tracker = Tracker();
