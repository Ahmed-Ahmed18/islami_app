import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islame_app/app_colors.dart';
import 'package:islame_app/hadeth/hadeth_details_screen.dart';

class HadethTab extends StatefulWidget {
  const HadethTab({super.key});

  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  @override
  Widget build(BuildContext context) {
    if (datalist.isEmpty) loadHadethData();
    return Column(
      children: [
        Image.asset('assets/images/hadeth_logo.png'),
        Divider(
          height: 5,
          thickness: 6,
          color: AppColors.primarylightcolor,
        ),
        Text('ألاحاديث', style: Theme.of(context).textTheme.bodyMedium),
        Divider(
          height: 5,
          thickness: 6,
          color: AppColors.primarylightcolor,
        ),
        Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                            context, HadethDetailsScreen.routeName,
                            arguments: datalist[index]);
                      },
                      child: Text(
                        datalist[index].tittle,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                separatorBuilder: (context, index) => Divider(
                      height: 15,
                      thickness: 2,
                      color: AppColors.primarylightcolor,
                    ),
                itemCount: datalist.length))
      ],
    );
  }

  List<HadethData> datalist = [];

  Future<void> loadHadethData() async {
    String content = await rootBundle.loadString('assets/files/ahadeth.txt');
    List<String> allhdethdata = content.split('#');
    for (int i = 0; i < allhdethdata.length; i++) {
      String singlehadeth = allhdethdata[i].trim();
      int tittlelength = singlehadeth.indexOf('\n');

      String tittle = singlehadeth.substring(0, tittlelength);
      String body = singlehadeth.substring(tittlelength + 1);
      HadethData hadeth = HadethData(tittle: tittle, body: body);
      datalist.add(hadeth);
      setState(() {});
    }
  }
}

class HadethData {
  String tittle;
  String body;

  HadethData({required this.tittle, required this.body});
}
