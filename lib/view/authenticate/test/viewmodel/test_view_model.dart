import 'package:flutter/cupertino.dart';
import 'package:flutter_template/core/base/model/base_view_model.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/enums/app_theme_enum.dart';
// import '../../../../core/init/network/network_manager.dart';
import '../../../../core/init/notifier/theme_notifier.dart';
import '../model/test_model.dart';

part 'test_view_model.g.dart';

class TestViewModel = _TestViewModelBase with _$TestViewModel;

abstract class _TestViewModelBase with Store, BaseviewModel {
  @override
  void setContext(BuildContext context) => this.context = context;

  @override
  void init() {}

  @observable
  bool isLoading = false;
  @observable // Sabit bir değer ise observable
  int number = 0;

  @computed // Bir işlem yapalıcaksa computed
  bool get isEven => number % 2 == 0;

  @action // Bir aksiyona giriyosanız action
  void incrementNumber() {
    number++;
  }

  void changeTheme() {
    Provider.of<ThemeNotifier>(context!, listen: false)
        .changeValue(AppThemes.DARK);
  }

//  @action
//   Future<void> getSampleRequest() async {
//     isLoading = true;

//     final response = await coreDio!.send<List<TestModel>, TestModel>('x', type: HttpTypes.GET, parseModel: TestModel());
//     if (response.data is List<TestModel>) {
//     } else {}
//     isLoading = false;
//   }
}
