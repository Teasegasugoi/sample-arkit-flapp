import 'package:sample_arkit_flapp/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'Sample_view_model.dart';

class SamplePage extends HookConsumerWidget {
  const SamplePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(SampleViewModelProvider);
    final viewModel = ref.watch(SampleViewModelProvider.notifier);

    return state.when(
      data: (data) {
        return Scaffold(
          body: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Assets.img.flutterIcon.image(width: 200),
                  Text(
                    L10n.of(context)!.hello,
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  ElevatedButton(
                    onPressed: viewModel.increment,
                    child: Text(data.count.toString()),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      error: (e, msg) => Text(e.toString()),
      loading: () {
        return const Scaffold(
          body: SafeArea(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        );
      },
    );
  }
}
