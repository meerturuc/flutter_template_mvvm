import 'package:flutter/cupertino.dart';
import 'package:flutter_template/core/init/network/network_manager.dart';
import 'package:flutter_template/view/authenticate/test/model/test_model.dart';
import '../../../../core/constants/enums/app_theme_enum.dart';
import '../../../../core/init/notifier/theme_notifier.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
part 'test_view_model.g.dart';

class TestViewModel = _TestViewModelBase with _$TestViewModel;

abstract class _TestViewModelBase with Store {
  BuildContext context;

  void setContext(BuildContext context) {
    this.context = context;
  }

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
    Provider.of<ThemeNotifier>(context, listen: false)
        .changeValue(AppThemes.DARK);
  }

  @action
  Future<void> getSampleReguest() async {
    isLoading = true;
    final list = await NetworkManager.instance.dioGet('x', TestModel());
    if (list is List) {
      //print true
    }
    isLoading = false;
  }
}
