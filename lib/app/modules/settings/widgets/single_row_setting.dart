import 'package:flutter/material.dart';
import 'package:flutter_weather/app/core/theme.dart';

class SingleRowSetting extends StatelessWidget {
  final IconData icons;
  final String titleSetting;
  final Widget subtitle;
  final Widget switchWidget;
  final bool showDivider;

  SingleRowSetting({
    Key? key,
    required this.icons,
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
                Icon(
                  icons,
                  size: 22,
                  color: Colors.grey,
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
