import 'package:flutter/material.dart';
import 'package:islame_app/app_colors.dart';
import 'package:islame_app/hadeth/hadeth_tab.dart';

class HadethDetailsScreen extends StatelessWidget {
  static const String routeName = 'hadeth details';

  HadethDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as HadethData;

    return Stack(children: [
      Image.asset(
        'assets/images/background.png',
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.fill,
      ),
      Scaffold(
          appBar: AppBar(
            title: Text(
              'اسلامي',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          body: Container(
            margin: EdgeInsets.only(top: 10, right: 30, left: 30, bottom: 80),
            padding: EdgeInsets.only(top: 20, right: 30, left: 30, bottom: 20),
            decoration: BoxDecoration(
                color: Color(0xffF8F8F8).withOpacity(.85),
                borderRadius: BorderRadius.circular(15)),
            child: Column(
              children: [
                Text(
                  args.tittle,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(
                  width: 10,
                ),
                Divider(
                  color: AppColors.primarylightcolor,
                ),
                Expanded(
                  child: ListView.separated(
                      separatorBuilder: (context, index) => SizedBox(
                            height: 20,
                            child: Divider(
                              height: 2,
                              thickness: 3,
                              color: AppColors.primarylightcolor,
                            ),
                          ),
                      itemBuilder: (context, index) => Text(
                            args.body,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                      itemCount: 1),
                )
              ],
            ),
          )),
    ]);
  }
}
