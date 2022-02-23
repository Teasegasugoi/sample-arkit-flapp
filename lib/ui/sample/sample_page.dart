import 'package:sample_arkit_flapp/gen/assets.gen.dart';
import 'package:sample_arkit_flapp/ui/hooks/use_l10n.dart';
import 'package:sample_arkit_flapp/ui/theme/app_text_theme.dart';
import 'package:sample_arkit_flapp/ui/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'sample_view_model.dart';

class SamplePage extends HookConsumerWidget {
  const SamplePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    final state = ref.watch(SampleViewModelProvider);
    final viewModel = ref.watch(SampleViewModelProvider.notifier);
    final l10n = useL10n(); // l10n.hello などでアクセス可能

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
                    l10n.hello,
                    style: theme.textTheme.h70.bold(),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: theme.appColors.primary,
                      onPrimary: theme.appColors.onPrimary,
                    ),
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
              child: CircularProgressIndicator(
                  // color: theme.appColors.primary,
                  ),
            ),
          ),
        );
      },
    );
  }
}
