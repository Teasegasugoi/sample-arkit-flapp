import 'dart:async';
import 'package:fimber/fimber.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'app.dart';

void main() {
  // Fimber (ロギング用のライブラリ)
  if (!kReleaseMode) {
    Fimber.plantTree(DebugTree());
  } else {
    debugPrint = (message, {wrapWidth}) {};
  }
  // アプリ内で発生したエラーを捕捉
  runZonedGuarded(
    () => runApp(const ProviderScope(child: MyApp())),
    (error, stackTrace) {
      Fimber.e(error.toString());
    },
  );
}
