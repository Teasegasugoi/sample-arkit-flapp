import 'package:freezed_annotation/freezed_annotation.dart';

part 'sample_state.freezed.dart';

@freezed
class SampleState with _$SampleState {
  const factory SampleState({
    @Default(0) int count,
  }) = _SampleState;
}
