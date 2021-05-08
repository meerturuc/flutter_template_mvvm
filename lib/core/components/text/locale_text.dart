import 'package:flutter/material.dart';

import '../../extension/string_entension.dart';

class LocaleText extends StatelessWidget {
  final String value;

  const LocaleText({Key key, this.value}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(value.locale);
  }
}
