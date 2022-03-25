import 'package:flutter/material.dart';
import 'package:flutter_weather/app/core/constants.dart';
import 'package:flutter_weather/app/core/theme.dart';
import 'package:flutter_weather/app/core/util.dart';
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
          backgroundIconColor: HexColor.fromHex('#70a1ff'),
          icon: Icons.update,
          iconColor: HexColor.fromHex('#1e90ff'),
          titleSetting: 'Auto update',
          subtitle: Text(
            'Allow to weather update automatically',
            style: normalTextTheme.copyWith(
              fontSize: 13,
              color: Colors.black26,
            ),
          ),
          switchWidget: Obx(
            () => DropdownButton(
              value: controller.autoUpdateTime,
              items: autoUpdate.entries
                  .map(
                    (e) => DropdownMenuItem(
                        child: Text(
                          e.key,
                          style: normalTextTheme.copyWith(
                            color: Colors.black54,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                        value: e.value),
                  )
                  .toList(),
              onChanged: (int? newValue) {
                controller.setAutoUpdateTime(newValue!);
              },
            ),
          ),
          showDivider: false,
        ),
        SizedBox(
          height: 15,
        ),
        SingleRowSetting(
          backgroundIconColor: HexColor.fromHex('#26de81'),
          icon: Icons.currency_bitcoin_outlined,
          iconColor: HexColor.fromHex('#20bf6b'),
          titleSetting: 'Unit values',
          subtitle: Obx(
            () => Text(
              controller.unitFlag ? 'imperial' : 'metric',
              style: normalTextTheme.copyWith(
                fontSize: 13,
                color: Colors.black26,
              ),
            ),
          ),
          switchWidget: Obx(
            () => Switch(
              value: controller.unitFlag,
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
