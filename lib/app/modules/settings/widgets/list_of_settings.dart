import 'package:flutter/material.dart';
import 'package:flutter_weather/app/core/theme.dart';
import 'package:flutter_weather/app/modules/settings/controllers/settings_controller.dart';
import 'package:flutter_weather/app/modules/settings/widgets/single_row_setting.dart';
import 'package:get/get.dart';

class ListOfSettings extends StatelessWidget {
  const ListOfSettings({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final SettingsController controller;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.fromLTRB(8, 16, 8, 0),
      children: [
        SingleRowSetting(
          icons: Icons.update,
          titleSetting: 'Auto update',
          subtitle: Text(
            'Allow to weather update automatically',
            style: normalTextTheme.copyWith(
              fontSize: 13,
              color: Colors.black26,
            ),
          ),
          switchWidget: Obx(
            () => Switch(
              value: controller.autoUpdateFlag.value,
              onChanged: (newValue) {
                controller.setautoUpdateFlag(newValue);
              },
            ),
          ),
          showDivider: false,
        ),
        SingleRowSetting(
          icons: Icons.currency_bitcoin_outlined,
          titleSetting: 'Unit values',
          subtitle: Obx(
            () => Text(
              controller.unitFlag.value ? 'imperial' : 'metric',
              style: normalTextTheme.copyWith(
                fontSize: 13,
                color: Colors.black26,
              ),
            ),
          ),
          switchWidget: Obx(
            () => Switch(
              value: controller.unitFlag.value,
              onChanged: (newValue) {
                controller.setUnitFlag(newValue);
              },
            ),
          ),
          showDivider: false,
        )
      ],
    );
  }
}
