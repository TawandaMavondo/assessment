import 'dart:async';

import 'package:assessment/app.dart';
import 'package:assessment/utils/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runZonedGuarded(
    () async => {
      WidgetsFlutterBinding.ensureInitialized(),
      setupServiceLocator(),
      runApp(
        const ProviderScope(
          child: SpecnoOffices(),
        ),
      )
    },
    (Object error, StackTrace trace) {},
  );
}
