import 'package:sample_arkit_flapp/data/repository/sample/sample_repository.dart';
import 'package:sample_arkit_flapp/data/repository/sample/sample_repository_impl.dart';
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

  // xxxRepository
  late final SampleRepository xxxRepository =
      _ref.read(sampleRepositoryProvider);

  // 初期化
  Future<void> load() async {
    final result = await xxxRepository.fetch();
    result.when(
      success: (data) {
        state = AsyncValue.data(
          SampleState(count: data),
        );
      },
      failure: (error) {
        state = AsyncValue.error(error);
      },
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
