import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islame_app/app_colors.dart';
import 'package:islame_app/quran/quran_tab.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = 'sura details';

  SuraDetailsScreen({super.key});

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as SuraData;

    if (content.isEmpty) loadData(args.suraNumber);

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
              style: Theme.of(context).textTheme.bodyLarge,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      args.suraName,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Icon(Icons.play_circle),
                  ],
                ),
                Divider(
                  color: AppColors.primarylightcolor,
                ),
                versesList.isEmpty
                    ? Center(
                        child: CircularProgressIndicator(
                        color: AppColors.primarylightcolor,
                      ))
                    : Expanded(
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
                            '{${index + 1}} ${versesList[index]}',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          itemCount: versesList.length,
                        ),
                      )
              ],
            ),
          )),
    ]);
  }

  String content = '';
  List<String> versesList = [];

  Future<void> loadData(String suranumber) async {
    content = await rootBundle.loadString('assets/files/$suranumber.txt');
    versesList = content.split('\n');
    setState(() {});
    print(content);
  }
}
