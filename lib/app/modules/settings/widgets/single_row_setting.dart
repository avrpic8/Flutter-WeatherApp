import 'package:flutter/material.dart';
import 'package:flutter_weather/app/core/theme.dart';

class SingleRowSetting extends StatelessWidget {
  final Color backgroundIconColor;
  final IconData icon;
  final Color iconColor;
  final String titleSetting;
  final Widget subtitle;
  final Widget switchWidget;
  final bool showDivider;

  SingleRowSetting({
    Key? key,
    this.backgroundIconColor = Colors.black12,
    required this.icon,
    this.iconColor = Colors.grey,
    required this.titleSetting,
    required this.subtitle,
    required this.switchWidget,
    required this.showDivider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.fromLTRB(16, 6, 16, 6),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    color: backgroundIconColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    icon,
                    size: 22,
                    color: iconColor,
                  ),
                ),
                SizedBox(
                  width: 32,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        titleSetting,
                        style: normalTextTheme.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black.withOpacity(0.7),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      subtitle
                    ],
                  ),
                ),
                switchWidget
              ],
            ),
            SizedBox(
              height: 5,
            ),
            showDivider
                ? Padding(
                    padding: EdgeInsets.fromLTRB(4.0, 0, 4.0, 0),
                    child: Divider(
                      thickness: 2,
                    ),
                  )
                : SizedBox(
                    width: 0,
                  ),
            SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }
}
