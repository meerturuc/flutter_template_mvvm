import 'package:flutter/cupertino.dart';

abstract class BaseviewModel {
  BuildContext context;

  void setContext(BuildContext context);
  void init();
}
