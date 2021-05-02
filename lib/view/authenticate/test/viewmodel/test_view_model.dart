import 'package:mobx/mobx.dart';
part 'test_view_model.g.dart';

class TestViewModel = _TestViewModelBase with _$TestViewModel;

abstract class _TestViewModelBase with Store {
  @observable // Sabit bir değer ise observable
  int number = 0;

  @computed // Bir işlem yapalıcaksa computed
  bool get isEven => number % 2 == 0;

  @action // Bir aksiyona giriyosanız action
  void incrementNumber() {
    number++;
  }
}
