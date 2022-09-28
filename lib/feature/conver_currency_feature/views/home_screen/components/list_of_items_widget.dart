import 'package:flutter/material.dart';

import '../../../domain/cubit/convert_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class ListOfItemsWidget extends StatelessWidget {
  const ListOfItemsWidget({Key? key,required this.from}) : super(key: key);
final bool from;
  @override
  Widget build(BuildContext context) {
    final convertCubit = context.watch<ConvertCubit>();

    return AlertDialog(
      insetPadding: const EdgeInsets.all(32),
      actionsPadding: EdgeInsets.zero,
      buttonPadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,

      content: SizedBox(
        height: MediaQuery.of(context).size.height/1.5,
        width: MediaQuery.of(context).size.width/3,
        child: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(height: 15),
          itemCount: convertCubit.currentis.length,
            itemBuilder:(context, index) => InkWell(
              onTap: () {
                convertCubit.saveValue( convertCubit.currentis[index], from);
                Navigator.pop(context);
              } ,
              child: Center(
                child: Text(
                  convertCubit.currentis[index],
                  style: const TextStyle(
                    fontSize: 18,
                    color:  Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ) ),
      ),
    );
  }
}
