import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obs_foundation/obs_foundation.dart';
import 'package:sentit/core/config/config.dart';
import 'package:sentit/data/sources/preferences/preferences.dart';
import 'package:sentit/firebase_options.dart';
import 'package:sentit/modules/app/app.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> run(Config _config) async {
  // Initialize the loggers.
  initLoggers([
    ConsoleLogger(),
    // Add other loggers here.
  ]);
  //init config
  final config = _config;

  WidgetsFlutterBinding.ensureInitialized();

  //initialise firbase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  //initialise shared prefernces
  final sharedPreferences = await SharedPreferences.getInstance();

  runApp(
    ProviderScope(
      overrides: [
        configProvider.overrideWithValue(
          config,
        ),
        sharedPreferencesInstanceProvider.overrideWithValue(
          sharedPreferences,
        )
      ],
      child: const App(),
    ),
  );
}
