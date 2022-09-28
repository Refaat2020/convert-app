
import 'package:bloc_test/bloc_test.dart';
import 'package:currencyconverter/feature/conver_currency_feature/domain/cubit/convert_cubit.dart';
import 'package:currencyconverter/locator.dart';
import 'package:test/test.dart';

void main() {
  setupLocator();
  convertCubitTest();

}

void convertCubitTest(){
  group('ConvertCubit', () {
    late ConvertCubit convertCubit;
    setUp(() {
      convertCubit = ConvertCubit();
    });

    tearDown(() {
      convertCubit.close();
    });

    test('initial state of ConvertCubit is ConvertState()', () {
      expect(convertCubit.state,isA<ConvertInitial>());
    });


    blocTest<ConvertCubit,ConvertState>(
        'the convertCubit should emit a ConvertDone when save value function is called',
        build: () => convertCubit,
        act: (cubit) => convertCubit.saveValue("EGP",true),
        expect: () => [isA<ConvertDone>()],
        wait: const Duration(milliseconds: 500)
    );
  });

}