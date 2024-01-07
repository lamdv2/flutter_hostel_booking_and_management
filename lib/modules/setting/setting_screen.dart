import 'package:flutter/material.dart';
import 'package:flutter_getx_base/shared/widgets/app_bar_widget.dart';

import '../../shared/utils/size_utils.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          titles: "Setting",
          height: getSize(68),
        ),
        body: Container(
          child: Text(
            "Setting",
          ),
        ),
      ),
    );
  }
}
