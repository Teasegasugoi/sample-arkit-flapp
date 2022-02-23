import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'sample_state.dart';

final SampleViewModelProvider =
    StateNotifierProvider.autoDispose<SampleViewModel, AsyncValue<SampleState>>(
  (ref) => SampleViewModel(ref: ref),
);

class SampleViewModel extends StateNotifier<AsyncValue<SampleState>> {
  final AutoDisposeStateNotifierProviderRef _ref;
  SampleViewModel({required AutoDisposeStateNotifierProviderRef ref})
      : _ref = ref,
        super(const AsyncLoading()) {
    load();
  }

  // 初期化
  void load() {
    state = const AsyncValue.data(
      SampleState(count: 0),
    );
  }

  // カウントを+1
  void increment() {
    final count = state.value!.count;
    state = AsyncValue.data(
      SampleState(count: count + 1),
    );
  }
}
