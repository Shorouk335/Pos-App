

import 'package:flutter_bloc/flutter_bloc.dart';
part 'charge_state.dart';

class ChargeCubit extends Cubit<ChargeState> {
  ChargeCubit() : super(InitialChargeState());

  static ChargeCubit get(context) => BlocProvider.of(context);

  // SPLIT

  //List of split price
  List<String> subSplitPriceList = <String>[];
  List<bool> paidSplitPriceList = <bool>[];

  // initial split number // length of list
  int splitNumber = 2;

  // initial price
  num currentPrice = 0;

  //price parameter which change  + or  -
  num paidPrice = 0;
  num paidNumber = 0;

  initialSplitPrice(num price) {
    currentPrice = price;
    subSplitPriceList = [
      (price / splitNumber).toStringAsFixed(2),
      (price / splitNumber).toStringAsFixed(2)
    ];
    paidSplitPriceList = [false, false];
    emit(GetInitialSplitPriceChargeState());
  }

  String getCurrentSubPrice() {
    return ((currentPrice - paidPrice) / (splitNumber - paidNumber))
        .toStringAsFixed(2);
  }
  String getCurrentRestPrice() {
    return (currentPrice - paidPrice).toStringAsFixed(2) ;
  }

  String getRestPriceWithoutChangeValue(String value){
    return (((currentPrice - paidPrice) - num.parse(value) ) / (splitNumber -1 - paidNumber)).toStringAsFixed(2);
  }

  increaseSplitNumber() {
    splitNumber += 1;
    paidSplitPriceList.add(false);
    subSplitPriceList.add(getCurrentSubPrice());
    for (int i = 0; i < subSplitPriceList.length; i++) {
      if (paidSplitPriceList[i] == false) {
        subSplitPriceList[i] = getCurrentSubPrice();
      }
    }
    emit(IncreaseSplitPriceChargeState());
  }

  // changeValueOfSplitPrice(int index , String value) {
  //   subSplitPriceList[index] = value ; 
  //   for (int i = 0; i < subSplitPriceList.length; i++) {
  //     if (paidSplitPriceList[i] == false && i != index ) {
  //       subSplitPriceList[i] =getRestPriceWithoutChangeValue(value);
  //     }
  //   }
  //    emit(ChangeValueSplitPriceChargeState());
  // }

  decreaseSplitNumber(int index) { 
    ///// if delete paid //////////
    if (paidSplitPriceList[index] == true) {
      deletePaidPrice(subSplitPriceList[index]);
    }
    splitNumber -= 1;
    paidSplitPriceList.removeAt(index);
    subSplitPriceList.removeAt(index);
    for (int i = 0; i < subSplitPriceList.length; i++) {
      if (paidSplitPriceList[i] == false) {
        subSplitPriceList[i] = getCurrentSubPrice();
      }
    }
    emit(DecreaseSplitPriceChargeState());
  }

  addPaidPrice(String paidValue, int index) {
    num value = num.parse(paidValue);
    paidPrice += value;
    paidNumber += 1;
    paidSplitPriceList[index] = true;
    emit(AddPaidSplitPriceChargeState());
  }

  deletePaidPrice(String paidValue) {
    num value = num.parse(paidValue);
    paidPrice -= value;
    paidNumber -= 1;
  }
}
