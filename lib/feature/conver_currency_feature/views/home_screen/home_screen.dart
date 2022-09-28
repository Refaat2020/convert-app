import 'package:currencyconverter/feature/conver_currency_feature/domain/cubit/convert_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constant/app_colors.dart';
import 'components/currency_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key ?key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<ConvertCubit>().init();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final convertCubit = context.watch<ConvertCubit>();
    return Scaffold(
      appBar: AppBar(
          title: const Text("Currency Convert",style: TextStyle(fontSize: 22,color: Colors.black,fontWeight: FontWeight.w700)),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.only(left: 20,top: 30,right: 20),
          child: Column(
            children: [
              ///currencies widgets
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CurrencyWidget(title: convertCubit.from??"Choose",from: true,),

                const Icon(Icons.compare_arrows),
                  CurrencyWidget(title: convertCubit.to??"Choose",from: false,),
                ],),
              const SizedBox(height: 40,),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: convertCubit.amountTextController,
                decoration: InputDecoration(
                  suffixIcon: Padding(
                    padding:  const EdgeInsets.only(top: 15),
                    child: Text(convertCubit.from??"",style: Theme.of(context).textTheme.subtitle1),
                  ),
                  prefixIcon:Padding(
                    padding:  EdgeInsets.only(top: 15,left: 10,right: 10),
                    child: Text("Amount",style: Theme.of(context).textTheme.subtitle1),
                  ) ,
                  contentPadding: const EdgeInsets.only(
                      right: 15,
                      left: 25,
                      top: 0,
                      bottom: 0),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide:  const BorderSide(
                          color: AppColors.gery05, width: 1)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                          color: AppColors.purple02)),
                  focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                          color: AppColors.purple01)),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                          color: AppColors.red01)),
                  errorStyle:
                  const TextStyle(fontSize: 0, height: 0),
                  hintStyle: const TextStyle(
                      color: Colors.black45,
                      fontWeight: FontWeight.w500,
                      fontSize: 12),
                ),
                onSaved: (value) {},
              ),
              const SizedBox(height: 40,),
              ///convert button
              ElevatedButton(
                onPressed: () {
                  if (convertCubit.to == null || convertCubit.from == null || convertCubit.amountTextController.text.isEmpty) {
                    return;
                  }
                  convertCubit.convert();
                },
                style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all(Size(MediaQuery.of(context).size.width/2, 60)) ,
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      side: const BorderSide(color:AppColors.orange01,width: 2),
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  overlayColor: MaterialStateProperty.all(AppColors.orange01.withOpacity(.5)),
                  backgroundColor: MaterialStateProperty.all(AppColors.orange01),
                ),
                child: const Text(
                    "Convert",
                    style: TextStyle( fontSize: 14,fontWeight: FontWeight.w500,color: Colors.white))
                ),
              const SizedBox(height: 40,),
                /// convert result
              if (convertCubit.result != null)
              Container(
                decoration: BoxDecoration(
                  color: Colors.greenAccent.withOpacity(.3),
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                ),
                padding: const EdgeInsets.all(40),
                child: Column(
                   crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("From ${convertCubit.from}  To ${convertCubit.to}",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w700),),
                    Text("${convertCubit.result!.toStringAsFixed(2)} ${convertCubit.to}",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w700),),

                  ],
                ),
              ),

              const SizedBox(height: 40,),
              ///historical data
              BlocBuilder<ConvertCubit, ConvertState>(
              builder: (context, state) {
                if (state is HistoricalLoading) {
                  return const Center(child: CircularProgressIndicator(),);
                }
                return Container(
                decoration: BoxDecoration(
                  color: Colors.red.withOpacity(.3),
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                ),
                padding: const EdgeInsets.all(40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Historical price form USD to EGP and date :${convertCubit.historicalModel!.date}",style: const TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w700),),
                    Text(convertCubit.historicalModel!.quotes.currency,style: const TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w700),),

                  ],
                ),
              );
  },
),

            ],
          ),
        ),
      ),

    );
  }
}
