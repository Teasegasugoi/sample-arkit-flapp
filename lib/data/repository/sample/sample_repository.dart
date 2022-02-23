import 'package:sample_arkit_flapp/data/model/result/result.dart';

// 抽象クラス
abstract class SampleRepository {
  Future<Result<int>> fetch();
}
