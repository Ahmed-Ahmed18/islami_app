import 'package:flutter/material.dart';
import 'package:islame_app/app_colors.dart';
import 'package:islame_app/quran/sura_details_screen.dart';
import 'quran_tab.dart';

class ItemSuraName extends StatelessWidget {
  final SuraData data;

  ItemSuraName({required this.data});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Text(
          data.suraNumber,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium,
        )),
        SizedBox(
          height: 40,
          child: VerticalDivider(
            color: AppColors.primarylightcolor,
            thickness: 2,
          ),
        ),
        Expanded(
            child: Text(
          data.suraName,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium,
        )),
      ],
    );
  }
}
