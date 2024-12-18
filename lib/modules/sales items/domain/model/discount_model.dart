import 'package:hive_flutter/adapters.dart';
part 'discount_model.g.dart';

@HiveType(typeId: 5)
class DiscountModel extends HiveObject {
  @HiveField(0)
  String? name;
  @HiveField(1)
  double? value;
  @HiveField(2)
  bool? isSelected;
  @HiveField(3)
  bool? isPercentage;
  @HiveField(4)
  String? uuid;
  DiscountModel(
      {this.name, this.isSelected, this.isPercentage, this.value, this.uuid});

  DiscountModel.copy(DiscountModel other)
      : name = other.name,
        isSelected = other.isSelected,
        isPercentage = other.isPercentage,
        uuid = other.uuid,
        value = other.value;

  DiscountModel copy() {
    return DiscountModel.copy(this);
  }
}
