import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/core/init/notifier/provider_list.dart';
import 'package:flutter_template/core/init/notifier/theme_notifier.dart';
import 'package:provider/provider.dart';

import 'core/constants/app/app_constants.dart';
import 'core/init/lang/lang_manager.dart';
import 'view/authenticate/test/view/test_view.dart';

class MyApp extends StatelessWidget {
  void main() {
    runApp(EasyLocalization(
        child: MyApp(),
        supportedLocales: LanguageManager.instance.supportedLocales,
        path: ApplicationConstants.LANG_ASSET_PATH));
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [ApplicationProvider.instance.dependItems],
        child: MaterialApp(
          theme:
              Provider.of<ThemeNotifier>(context, listen: false).currentTheme,
          home: TestsView(),
        ));
  }
}
