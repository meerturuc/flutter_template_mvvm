import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
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
        floatingActionButton: floatingActionButtonNumber,
        body: textNumber,
      );

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
