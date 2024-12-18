import 'dart:math';

import 'package:e_ticket_app/core/data_service/hive/hive.dart';
import 'package:e_ticket_app/modules/sales%20items/core/discount%20cubit/discount_states.dart';
import 'package:e_ticket_app/modules/sales%20items/domain/model/discount_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DiscountCubit extends Cubit<DiscountStates> {
  DiscountCubit() : super(InitialDiscountStates());

  static DiscountCubit get(context) => BlocProvider.of(context);

  List<DiscountModel> discountList = <DiscountModel>[];

  getDiscountList() {
    discountList = HiveService.getDiscountList();
    for (var element in discountList) {
      element.isSelected = false;
    }
    discountList.isEmpty
        ? emit(EmptyDiscountListStates())
        : emit(SuccessGetDiscountListStates());
  }

  selectDiscountOrNot(DiscountModel item) {
    item.isSelected = !item.isSelected!;
    emit(ChangeSelectValueOfDiscount());
  }

  deleteDiscounts() async {
    List<String> keys = <String>[];
    final result =  discountList.where((item)=> item.isSelected ==true);
    for (var element in result) {
      keys.add(element.uuid!); 
    } 
    print(keys.length);
    await HiveService.clearDiscountList(keys);
    getDiscountList();
  }

  int getNumberOfSelectedDiscount() {
    int count = 0;
    for (int i = 0; i < discountList.length; i++) {
      if (discountList[i].isSelected == true) {
        count++;
      }
    }
    return count;
  }

  bool isSelectedOrNotDiscount() {
    return discountList.any((element) => element.isSelected == true);
  }

  removeSelectMode() {
    for (var element in discountList) {
      element.isSelected = false;
    }
    emit(RemoveDeleteDiscountMode());
  }
}
