import 'package:flutter/material.dart';
import 'package:flutter_weather/app/core/constants.dart';
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
          backgroundIconColor: backgroundIconColor1,
          icon: Icons.update,
          iconColor: backgroundIconColor1,
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
          backgroundIconColor: backgroundIconColor2,
          icon: Icons.currency_bitcoin_outlined,
          iconColor: backgroundIconColor2,
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
        ),
        SizedBox(
          height: 15,
        ),
        SingleRowSetting(
          backgroundIconColor: backgroundIconColor3,
          icon: Icons.notifications,
          iconColor: backgroundIconColor3,
          titleSetting: 'Notification',
          subtitle: Obx(
            () => Text(
              controller.notificationFlag ? 'Enable' : 'Disable',
              style: normalTextTheme.copyWith(
                fontSize: 13,
                color: Colors.black26,
              ),
            ),
          ),
          switchWidget: Obx(
            () => Switch(
              value: controller.notificationFlag,
              onChanged: (newValue) {
                controller.setNotificationFlag(newValue);
              },
            ),
          ),
          showDivider: false,
        ),
        SizedBox(
          height: 15,
        ),
        SingleRowSetting(
          backgroundIconColor: backgroundIconColor4,
          icon: Icons.palette,
          iconColor: backgroundIconColor4,
          titleSetting: 'Notification',
          subtitle: Text(
            controller.unitFlag ? 'Disable' : 'Enable',
            style: normalTextTheme.copyWith(
              fontSize: 13,
              color: Colors.black26,
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
        ),
        SizedBox(
          height: 15,
        ),
        SingleRowSetting(
          backgroundIconColor: backgroundIconColor5,
          icon: Icons.storage,
          iconColor: backgroundIconColor5,
          titleSetting: 'DataBase',
          subtitle: Text(
            'Remove all stored data',
            style: normalTextTheme.copyWith(
              fontSize: 13,
              color: Colors.black26,
            ),
          ),
          switchWidget: TextButton(
            child: Text('Clear all'),
            onPressed: () => controller.removeAllCities(context),
          ),
          showDivider: false,
        ),
      ],
    );
  }
}
