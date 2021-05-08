import 'package:flutter/cupertino.dart';
import 'package:flutter_template/core/constants/enums/app_theme_enum.dart';
import 'package:flutter_template/core/init/notifier/theme_notifier.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
part 'test_view_model.g.dart';

class TestViewModel = _TestViewModelBase with _$TestViewModel;

abstract class _TestViewModelBase with Store {
  BuildContext context;

  void setContext(BuildContext context) {
    this.context = context;
  }

  @observable // Sabit bir değer ise observable
  int number = 0;

  @computed // Bir işlem yapalıcaksa computed
  bool get isEven => number % 2 == 0;

  @action // Bir aksiyona giriyosanız action
  void incrementNumber() {
    number++;
  }

  void changeTheme() {
    Provider.of<ThemeNotifier>(context, listen: false)
        .changeValue(AppThemes.DARK);
  }
}
