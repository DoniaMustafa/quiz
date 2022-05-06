import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/di.dart';
import 'package:quiz_app/sre/core/utils/constans.dart';
import 'package:quiz_app/sre/data/models/lang_model.dart';
import 'package:quiz_app/sre/presentation/cubits/app/app_cubit.dart';
import 'package:quiz_app/sre/presentation/cubits/select_lan/select_lan_cubit.dart';
import 'package:quiz_app/sre/presentation/widgets/custom_button.dart';

class SelectLanguage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // _buildTitle1(context),
                    const SizedBox(
                      height: 20,
                    ),
                    // Text(
                    //   di<AppCubit>().translationModel!.selectTitle2.toString(),
                    //   // translateModel. ,
                    //   style: Theme.of(context).textTheme.headline5,
                    //
                    //   textDirection: di<AppCubit>().textDirection,
                    //   textAlign: TextAlign.right,
                    // ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              _buildListView(),
              const Spacer(
                flex: 1,
              ),
              CustomButton(
                text: 'Done',
                onPress: () {
                  print('dv');
                  di<AppCubit>().selectLanConfig(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  _buildTitle1(context) => MediaQuery(
        data: MediaQueryData(textScaleFactor: 1.0),
        child: Text(
          di<AppCubit>().translationModel!.selectTitle1.toString(),
          style: Theme.of(context).textTheme.headline5,
          // style: white20(),
        ),
      );
  _buildListView() => Expanded(
        child: ListView.separated(
            physics: BouncingScrollPhysics(),
            itemCount: listLang.length,
            separatorBuilder: (context, index) => const Divider(
                  thickness: 2,
                ),
            itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.all(10.0),
                  child: languageItem(
                      model: listLang[index], index: index, context: context),
                )),
      );
  languageItem({required LanguageModel model, context, required int index}) =>
      BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          return InkWell(
              onTap: () {
                print(index);
                di<AppCubit>().changeSelectLanguage(index);
              },
              child: Row(
                children: [
                  Text(
                    '${model.language}',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  if (di<AppCubit>().itemLang[index])
                    const Icon(
                      Icons.check_circle,
                      color: Colors.indigo,
                    ),
                ],
              ));
        },
      );
}
