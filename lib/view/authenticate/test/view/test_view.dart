import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_template/core/extension/string_entension.dart';
import 'package:flutter_template/core/init/lang/lang_manager.dart';
import 'package:flutter_template/core/init/lang/locale_keys.g.dart';
import 'package:flutter_template/view/authenticate/test/viewmodel/test_view_model.dart';
import '../../../../core/base/state/base_state.dart';
import '../../../../core/base/view/base_widget.dart';

class TestsView extends StatefulWidget {
  @override
  _TestsViewState createState() => _TestsViewState();
}

class _TestsViewState extends BaseState<TestsView> {
  TestViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return BaseView<TestViewModel>(
      viewModel: TestViewModel(),
      onModelReady: (model) {
        viewModel = model;
      },
      onPageBuilder: (context, value) => Text("data"),
    );
  }

  Widget get scaffoldBody => Scaffold(
        appBar: AppBar(
            title: textWelcomeWidget(), actions: [iconButtonChangeTheme()]),
        floatingActionButton: floatingActionButtonNumber,
        body: textNumber,
      );

  Text textWelcomeWidget() => Text(LocaleKeys.welcome.locale);

  IconButton iconButtonChangeTheme() {
    return IconButton(
        icon: Icon(Icons.change_history),
        onPressed: () {
          context.setLocale(LanguageManager.instance.enLocale);
        });
  }

  FloatingActionButton get floatingActionButtonNumber {
    return FloatingActionButton(
      onPressed: () => viewModel.incrementNumber(),
    );
  }

  Widget get textNumber {
    return Observer(
      builder: (context) => Text(
        viewModel.number.toString(),
      ),
    );
  }
}
