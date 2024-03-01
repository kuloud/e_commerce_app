// import 'package:adjust_sdk/adjust.dart';
// import 'package:adjust_sdk/adjust_event.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter_new_moon/src/env/env.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Tracker {
  static final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;
  final _shared = GetIt.instance.get<SharedPreferences>();

  trackEvent({required String eventId, Map<String, Object?>? parameters}) {
    if (!EnvironmentConfig.inProduction) return;

    try {
      String langCode = _shared.getString('appLang') ?? 'unknown';
      final parametersMap = {
        'channel': EnvironmentConfig.appChannel,
        'lang': langCode,
        ...(parameters ?? {}),
      };

      try {
        _analytics.logEvent(name: eventId, parameters: {
          'channel': EnvironmentConfig.appChannel,
          'lang': langCode,
          ...(parameters ?? {}),
        });
        // ignore: empty_catches
      } catch (e) {}

      // try {
      //   AdjustEvent event = AdjustEvent(eventId);
      //   for (var p in parametersMap.entries) {
      //     event.addPartnerParameter(p.key, '${p.value}');
      //   }

      //   Adjust.trackEvent(event);
      //   // ignore: empty_catches
      // } catch (e) {}
      // ignore: empty_catches
    } catch (e) {}
  }
}

final Tracker tracker = Tracker();
