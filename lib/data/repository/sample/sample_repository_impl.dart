import 'dart:math';

import 'package:sample_arkit_flapp/data/model/result/result.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'sample_repository.dart';

final sampleRepositoryProvider =
    Provider<SampleRepository>((ref) => SampleRepositoryImpl(ref.read));

// 実装クラス(implementクラス)
class SampleRepositoryImpl implements SampleRepository {
  SampleRepositoryImpl(this._reader);
  final Reader _reader;

  @override
  Future<Result<int>> fetch() async {
    return Result.guardFuture(() async {
      await Future.delayed(const Duration(seconds: 2)); // 2秒待機

      final rand = Random();
      return rand.nextInt(100); // 0~100の乱数
    });
  }
}
