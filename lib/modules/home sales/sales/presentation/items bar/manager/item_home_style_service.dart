import 'package:e_ticket_app/core/data_service/PrefService/prefService.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/presentation/items%20bar/discount%20item/discount_grid_home_style.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/presentation/items%20bar/discount%20item/discount_list_home_style.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/presentation/items%20bar/favorite%20item/item_favorite_grid_home_style.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/presentation/items%20bar/favorite%20item/item_favorite_list_home_style.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/presentation/items%20bar/items%20list/item_List_home_style.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/presentation/items%20bar/items%20list/item_grid_home_style.dart';
import 'package:flutter/material.dart';

enum ItemHomeStyle { normal, byCategory, favorite, discount }

class ItemHomeStyleService {

 static  Widget getItemHomeStyle({required ItemHomeStyle itemHomeStyle}) {
    switch (itemHomeStyle) {
      case ItemHomeStyle.normal:
       return  PrefService.itemStyle == "grid"
            ? const ItemGridHomeStyle()
            : const ItemListHomeStyle();
      case ItemHomeStyle.byCategory:
       return PrefService.itemStyle == "grid"
            ? const ItemGridHomeStyle()
            : const ItemListHomeStyle();
      case ItemHomeStyle.favorite:
       return PrefService.itemStyle == "grid"
            ? const ItemFavoriteGridHomeStyle()
            : const ItemFavoriteListHomeStyle();
      case ItemHomeStyle.discount:
       return PrefService.itemStyle == "grid"
            ? const DiscountGridHomeStyle()
            : const DiscountListHomeStyle();
      default : 
      return PrefService.itemStyle == "grid"
            ? const ItemGridHomeStyle()
            : const ItemListHomeStyle();


    }
  }
}
