import 'package:e_ticket_app/core/data_service/hive/hive.dart';
import 'package:e_ticket_app/modules/apps/presentation/apps_view.dart';
import 'package:e_ticket_app/modules/auth/presentation/forget_password/change_password_View.dart';
import 'package:e_ticket_app/modules/auth/presentation/forget_password/forget_password_view.dart';
import 'package:e_ticket_app/modules/auth/presentation/forget_password/verification_password_view.dart';
import 'package:e_ticket_app/modules/auth/presentation/login/login_view.dart';
import 'package:e_ticket_app/modules/auth/presentation/register/register_view.dart';
import 'package:e_ticket_app/modules/back%20office/presentation/back_office_view.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/presentation/favorite/add_favorite_item_view.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/presentation/favorite/edit_favorite_item_view.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/presentation/ticket%20details/show_all_discount_in_ticket_view.dart';
import 'package:e_ticket_app/modules/layout/presentation/layout_view.dart';
import 'package:e_ticket_app/modules/receipts/presentation/email%20receipt/emil_receipt_view.dart';
import 'package:e_ticket_app/modules/receipts/presentation/receipts%20details/receipts_details_view.dart';
import 'package:e_ticket_app/modules/receipts/presentation/refund%20receipt/refund_receipt_view.dart';
import 'package:e_ticket_app/modules/home%20sales/customers/presentation/add%20edit%20customer/add_edit_customer_view.dart';
import 'package:e_ticket_app/modules/home%20sales/customers/presentation/customer%20details/customer_details_view.dart';
import 'package:e_ticket_app/modules/home%20sales/customers/presentation/customers_view.dart';
import 'package:e_ticket_app/modules/sales%20items/domain/model/discount_model.dart';
import 'package:e_ticket_app/modules/sales%20items/presentation/categories/add%20edit%20categories/add_edit_categories_view.dart';
import 'package:e_ticket_app/modules/sales%20items/presentation/categories/add%20edit%20categories/assign_item_page_view.dart';
import 'package:e_ticket_app/modules/sales%20items/presentation/categories/categories_view.dart';
import 'package:e_ticket_app/modules/sales%20items/presentation/discounts/add%20edit%20discounts/add_edit_discounts_view.dart';
import 'package:e_ticket_app/modules/sales%20items/presentation/discounts/discounts_view.dart';
import 'package:e_ticket_app/modules/sales%20items/presentation/items/add%20edit%20items/add_edit_items_view.dart';
import 'package:e_ticket_app/modules/sales%20items/presentation/items/items_view.dart';
import 'package:e_ticket_app/modules/sales%20items/presentation/modifiers/add%20edit%20modifiers/add_edit_modifiers_view.dart';
import 'package:e_ticket_app/modules/sales%20items/presentation/modifiers/modifiers_view.dart';
import 'package:e_ticket_app/modules/sales%20items/presentation/sales_items_view.dart';
import 'package:e_ticket_app/modules/receipts/presentation/receipts_view.dart';
import 'package:e_ticket_app/modules/home%20sales/customers/presentation/purchase%20history/purchase_history_customer_view.dart';
import 'package:e_ticket_app/modules/home%20sales/open%20ticket/domain/model/employee_page_model.dart';
import 'package:e_ticket_app/modules/home%20sales/open%20ticket/presentation/employee_ticket_view.dart';
import 'package:e_ticket_app/modules/home%20sales/open%20ticket/presentation/merge_ticket_view.dart';
import 'package:e_ticket_app/modules/home%20sales/open%20ticket/presentation/merge_with_ticket_view.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/domain/model/charge_ticket_model.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/domain/model/ticket_model.dart';
import 'package:e_ticket_app/modules/home%20sales/charge/presentation/charge%20cash%20card/card_ticket_view.dart';
import 'package:e_ticket_app/modules/home%20sales/charge/presentation/charge%20cash%20card/cash_ticket_view.dart';
import 'package:e_ticket_app/modules/home%20sales/charge/presentation/charge%20cash%20card/charge_ticket_view.dart';
import 'package:e_ticket_app/modules/home%20sales/charge/presentation/split/split_charge_ticket_view.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/presentation/item%20details/item_details_view.dart';
import 'package:e_ticket_app/modules/home%20sales/open%20ticket/presentation/open_ticket_view.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/presentation/sales%20home/sales_view.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/presentation/sales%20home/save_ticket_view.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/presentation/split%20ticket/presentation/edit_split_ticket_view.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/presentation/split%20ticket/presentation/split_ticket_view.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/presentation/ticket%20details/edit_item_ticket_view.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/presentation/ticket%20details/ticket_details_view.dart';
import 'package:e_ticket_app/modules/setting/domain/model/setting_item_model.dart';
import 'package:e_ticket_app/modules/setting/presentation/customer%20displays/create%20edit%20displays/create_edit_customer_displays_view.dart';
import 'package:e_ticket_app/modules/setting/presentation/customer%20displays/customer_displays_view.dart';
import 'package:e_ticket_app/modules/setting/presentation/general/change_home_screen_layout_view.dart';
import 'package:e_ticket_app/modules/setting/presentation/general/general_view.dart';
import 'package:e_ticket_app/modules/setting/presentation/printers/create%20edit%20printers/create_edit_printer_view.dart';
import 'package:e_ticket_app/modules/setting/presentation/printers/printers_view.dart';
import 'package:e_ticket_app/modules/setting/presentation/setting_view.dart';
import 'package:e_ticket_app/modules/setting/presentation/taxes/create%20edit%20tax/create_edit_taxes_view.dart';
import 'package:e_ticket_app/modules/setting/presentation/taxes/taxes_view.dart';
import 'package:e_ticket_app/modules/shift/presentation/async%20shifts/async_shifts_view.dart';
import 'package:e_ticket_app/modules/shift/presentation/async%20shifts/report_shift_view.dart';
import 'package:e_ticket_app/modules/shift/presentation/cash%20managment/cash_management_view.dart';
import 'package:e_ticket_app/modules/shift/presentation/close%20shift/close_shift_view.dart';
import 'package:e_ticket_app/modules/shift/presentation/shift_view.dart';
import 'package:e_ticket_app/modules/splach/presentation/splach_view.dart';
import 'package:e_ticket_app/modules/support/presetation/account/account_delete_view.dart';
import 'package:e_ticket_app/modules/support/presetation/help/help_view.dart';
import 'package:e_ticket_app/modules/support/presetation/legal%20information/legal_information_view.dart';
import 'package:e_ticket_app/modules/support/presetation/support_view.dart';
import 'package:e_ticket_app/modules/support/presetation/widget/web_page_view.dart';
import 'package:e_ticket_app/shared/models/item_model.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static const String splachRoute = "/";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String forgetPasswordRoute = "/forgetPassword";
  static const String changePasswordRoute = "/changePassword";
  static const String verificationRoute = "/verification";

  static const String layoutRoute = "/layout";

  static const String salesRoute = "/sales";
  static const String itemDetailsRoute = "/itemDetails";
  static const String openTicketRoute = "/openTicket";
  static const String saveTicketRoute = "/saveTicket";
  static const String mergeTicketRoute = "/mergeTicket";
  static const String employeeTicketRoute = "/employeeTicket";
  static const String chargeTicketRoute = "/chargeTicket";
  static const String cashTicketRoute = "/cashTicket";
  static const String cardTicketRoute = "/cardTicket";
  static const String splitChargeTicketRoute = "/splitChargeTicket";
  static const String mergeWithTicketRoute = "/mergeWith";
  static const String ticketDetailsRoute = "/ticketDetails";
  static const String splitTicketRoute = "/splitTicket";
  static const String editSplitTicketRoute = "/editSplitTicket";
  static const String editItemTicketRoute = "/editItemTicket";
  static const String editFavoriteItemRoute = "/editItemFavorite";
  static const String addFavoriteItemRoute = "/addFavoriteItem";

  static const String customerRoute = "/customer";
  static const String addEditCustomerRoute = "/addEditCustomer";
  static const String customerDetailsRoute = "/customerDetails";
  static const String purchaseHistoryCustomerRoute = "/purchaseHistoryCustomer";

  static const String shiftRoute = "/shift";
  static const String closeShiftRoute = "/closeShift";
  static const String asyncShiftsRoute = "/asyncShift";
  static const String reportShiftRoute = "/reportShift";
  static const String cashManagementRoute = "/cashManagement";

  static const String receiptsRoute = "/receipts";
  static const String receiptsDetailsRoute = "/ReceiptsDetails";
  static const String refundReceiptsRoute = "/refundReceipt";
  static const String emailReceiptsRoute = "/emailReceipt";

  static const String salesItemsRoute = "/salesItems";
  static const String itemsRoute = "/items";
  static const String addEditItemsRoute = "/addEditItems";
  static const String categoriesRoute = "/categories";
  static const String addEditCategoriesRoute = "/addEditCategories";
  static const String assignItemToPageRoute = "/assignItemToPage";
  static const String modifiersRoute = "/modifiers";
  static const String addEditModifiersRoute = "/addEditModifiers";
  static const String discountsRoute = "/discounts";
  static const String addEditDiscountsRoute = "/addEditDiscounts";
  static const String showAllDiscountsInTicketRoute = "/showAllDiscountInTicket";

  static const String settingRoute = "/setting";
  static const String printersSettingRoute = "/printersSetting";
  static const String createEditEditPrintersSettingRoute =
      "/createEditPrintersSetting";
  static const String customerDisplaysRoute = "/customerDisplaysSetting";
  static const String createEditCustomerDisplaysRoute =
      "/createEditCustomerDisplaysSetting";
  static const String taxesSettingRoute = "/taxesSetting";
  static const String createEditTaxesSettingRoute = "/createEditTaxesSetting";
  static const String generalSettingRoute = "/generalSetting";
  static const String changeHomeScreenLayoutSettingRoute =
      "/changeHomeScreenLayoutSetting";

  static const String backOfficeRoute = "/backOffice";
  static const String appsRoute = "/apps";
  static const String supportRoute = "/support";
  static const String helpRoute = "/help";
  static const String legalInformationRoute = "/legalInformation";
  static const String accountRoute = "/account";
  static const String webPageRoute = "/webPage";

  static GoRouter goRoute = GoRouter(
      initialLocation: HiveService.getUserToken() != null
          ? AppRouter.layoutRoute
          : AppRouter.splachRoute,
      routes: [
        ////////////////////////SPLACH/////////////////////////////////
        GoRoute(
          path: splachRoute,
          name: AppRouter.splachRoute,
          builder: (context, state) => const SplachView(),
        ),
        ////////////////////////////AUTH////////////////////////////////
        GoRoute(
          path: loginRoute,
          name: AppRouter.loginRoute,
          builder: (context, state) => const LoginView(),
        ),
        GoRoute(
          path: registerRoute,
          name: AppRouter.registerRoute,
          builder: (context, state) => const RegisterView(),
        ),
        GoRoute(
          path: forgetPasswordRoute,
          name: AppRouter.forgetPasswordRoute,
          builder: (context, state) => const ForgetPasswordView(),
        ),
        GoRoute(
          path: changePasswordRoute,
          name: AppRouter.changePasswordRoute,
          builder: (context, state) => const ChangePasswordView(),
        ),
        GoRoute(
          path: verificationRoute,
          name: AppRouter.verificationRoute,
          builder: (context, state) => const VerificationPasswordView(),
        ),
        /////////////////////////////LAYOUT////////////////////////////
        GoRoute(
          path: layoutRoute,
          name: AppRouter.layoutRoute,
          builder: (context, state) => const LayoutView(),
        ),
        ////////////////////////////SALES//////////////////////////////
        GoRoute(
          path: salesRoute,
          name: AppRouter.salesRoute,
          builder: (context, state) => const SalesView(),
        ),
        ///////////////////////Favorite/////////////////////////////
        GoRoute(
          path: addFavoriteItemRoute,
          name: AppRouter.addFavoriteItemRoute,
          builder: (context, state) => const AddFavoriteItemView(),
        ),
        GoRoute(
          path: editFavoriteItemRoute,
          name: AppRouter.editFavoriteItemRoute,
          builder: (context, state) => const EditFavoriteItemView(),
        ),
        
        /////////////////////////////ITEM DETAILS////////////////////////
        GoRoute(
          path: itemDetailsRoute,
          name: AppRouter.itemDetailsRoute,
          builder: (context, state) => ItemDetailsView(
            itemModel: state.extra as ItemModel,
          ),
        ),
        /////////////////////////////SAVE TICKET///////////////////////////

        GoRoute(
          path: saveTicketRoute,
          name: AppRouter.saveTicketRoute,
          builder: (context, state) => SaveTicketView(
            isEditName: state.extra as bool,
          ),
        ),
        ////////////////////////////ADD CUSTOMER ///////////////////////////////
        GoRoute(
          path: customerRoute,
          name: AppRouter.customerRoute,
          builder: (context, state) => const CustomersView(),
        ),
        GoRoute(
          path: addEditCustomerRoute,
          name: AppRouter.addEditCustomerRoute,
          builder: (context, state) => const AddEditCustomerView(),
        ),
        GoRoute(
          path: customerDetailsRoute,
          name: AppRouter.customerDetailsRoute,
          builder: (context, state) => const CustomerDetailsView(),
        ),
        GoRoute(
          path: purchaseHistoryCustomerRoute,
          name: AppRouter.purchaseHistoryCustomerRoute,
          builder: (context, state) => const PurchaseHistoryCustomerView(),
        ),
        /////////////////////////////OPEN TICKET ////////////////////////
        GoRoute(
          path: openTicketRoute,
          name: AppRouter.openTicketRoute,
          builder: (context, state) => const OpenTicketView(),
        ),
        GoRoute(
          path: mergeTicketRoute,
          name: AppRouter.mergeTicketRoute,
          builder: (context, state) => MergeTicketView(
            margeTicketList: state.extra as List<TicketModel>,
          ),
        ),
        GoRoute(
            path: employeeTicketRoute,
            name: AppRouter.employeeTicketRoute,
            builder: (context, state) {
              return AssignEmployeeTicketView(
                editAssignEmployeePageModel:
                    state.extra as EditAssignEmployeePageModel,
              );
            }),
        ////////////////////////CHARGE TICKET///////////////////////////////
        GoRoute(
          path: chargeTicketRoute,
          name: AppRouter.chargeTicketRoute,
          builder: (context, state) => ChargeTicketView(
            chargeTicketModel: state.extra as ChargePriceTicketPageModel,
          ),
        ),
        GoRoute(
          path: cashTicketRoute,
          name: AppRouter.cashTicketRoute,
          builder: (context, state) => CashTicketView(
              chargePriceTicketModel:
                  state.extra as ChargePriceTicketPageModel),
        ),
        GoRoute(
          path: cardTicketRoute,
          name: AppRouter.cardTicketRoute,
          builder: (context, state) => CardTicketView(
              chargePriceTicketModel:
                  state.extra as ChargePriceTicketPageModel),
        ),
        GoRoute(
          path: splitChargeTicketRoute,
          name: AppRouter.splitChargeTicketRoute,
          pageBuilder: (context, state) => NoTransitionPage(
              child: SplitChargeTicketView(
            currentPrice: state.extra as num,
          )),
        ),
        //////////////////////////////////POP UP TICKET ///////////////////////////
        GoRoute(
          path: mergeWithTicketRoute,
          name: AppRouter.mergeWithTicketRoute,
          builder: (context, state) =>
              MergeWithTicketView(ticketModel: state.extra as TicketModel),
        ),
        GoRoute(
            path: splitTicketRoute,
            name: AppRouter.splitTicketRoute,
            builder: (context, state) => SplitTicketView(
                  ticketModel: state.extra as TicketModel,
                )),
        GoRoute(
            path: editSplitTicketRoute,
            name: AppRouter.editSplitTicketRoute,
            builder: (context, state) => EditTicketSplitView(
                  ticketModel: state.extra as TicketModel,
                )),

        /////////////////////////TICKET DETAILS ////////////////////////////////////
        GoRoute(
          path: ticketDetailsRoute,
          name: AppRouter.ticketDetailsRoute,
          builder: (context, state) => const TicketDetailsView(),
        ),
        GoRoute(
          path: editItemTicketRoute,
          name: AppRouter.editItemTicketRoute,
          builder: (context, state) => EditItemTicketView(
            itemModel: state.extra as ItemModel,
          ),
        ),
         GoRoute(
          path: showAllDiscountsInTicketRoute,
          name: AppRouter.showAllDiscountsInTicketRoute,
          builder: (context, state) => const ShowAllDiscountInTicketView(),
        ),

        ////////////////////////////SHIFT/////////////////////////////////////////
        GoRoute(
          path: shiftRoute,
          name: AppRouter.shiftRoute,
          builder: (context, state) => const ShiftView(),
        ),

        GoRoute(
          path: closeShiftRoute,
          name: AppRouter.closeShiftRoute,
          builder: (context, state) => const CloseShiftView(),
        ),
        GoRoute(
          path: asyncShiftsRoute,
          name: AppRouter.asyncShiftsRoute,
          builder: (context, state) => const AsyncShiftsView(),
        ),
        GoRoute(
          path: reportShiftRoute,
          name: AppRouter.reportShiftRoute,
          builder: (context, state) => const ReportShiftView(),
        ),
        GoRoute(
          path: cashManagementRoute,
          name: AppRouter.cashManagementRoute,
          builder: (context, state) => const CashManagementView(),
        ),
        ////////////////////////////SALES ITEMS/////////////////////////////////////////
        GoRoute(
          path: salesItemsRoute,
          name: AppRouter.salesItemsRoute,
          builder: (context, state) => const SalesItemsView(),
        ),
        GoRoute(
          path: itemsRoute,
          name: AppRouter.itemsRoute,
          builder: (context, state) => const ItemsView(),
        ),
        GoRoute(
          path: addEditItemsRoute,
          name: AppRouter.addEditItemsRoute,
          builder: (context, state) =>
              AddEditItemsView(item: state.extra as ItemModel?),
        ),
        GoRoute(
          path: categoriesRoute,
          name: AppRouter.categoriesRoute,
          builder: (context, state) => const CategoriesView(),
        ),
        GoRoute(
          path: addEditCategoriesRoute,
          name: AppRouter.addEditCategoriesRoute,
          builder: (context, state) => AddEditCategoriesView(
            name: state.extra as String?,
          ),
        ),
        GoRoute(
          path: assignItemToPageRoute,
          name: AppRouter.assignItemToPageRoute,
          builder: (context, state) => AssignItemPageView(
            isFromTaxes: state.extra as bool,
          ),
        ),
        GoRoute(
          path: modifiersRoute,
          name: AppRouter.modifiersRoute,
          builder: (context, state) => const ModifiersView(),
        ),
        GoRoute(
          path: addEditModifiersRoute,
          name: AppRouter.addEditModifiersRoute,
          builder: (context, state) => AddEditModifiersView(
            modifier: state.extra as String?,
          ),
        ),
        GoRoute(
          path: discountsRoute,
          name: AppRouter.discountsRoute,
          builder: (context, state) => const DiscountsView(),
        ),
        GoRoute(
          path: addEditDiscountsRoute,
          name: AppRouter.addEditDiscountsRoute,
          builder: (context, state) => AddEditDiscountsView(
            discount: state.extra as DiscountModel?,
          ),
        ),

        ////////////////////////////RECEIPT/////////////////////////////////////////
        GoRoute(
          path: receiptsRoute,
          name: AppRouter.receiptsRoute,
          builder: (context, state) => const ReceiptsView(),
        ),
        GoRoute(
          path: receiptsDetailsRoute,
          name: AppRouter.receiptsDetailsRoute,
          builder: (context, state) => ReceiptsDetailsView(
            ticket: state.extra as TicketModel,
          ),
        ),
        GoRoute(
          path: refundReceiptsRoute,
          name: AppRouter.refundReceiptsRoute,
          builder: (context, state) => RefundReceiptView(
            ticket: state.extra as TicketModel,
          ),
        ),
        GoRoute(
            path: emailReceiptsRoute,
            name: AppRouter.emailReceiptsRoute,
            builder: (context, state) => const EmailReceiptView()),
        /////////////////////////Setting /////////////////////////
        GoRoute(
          path: settingRoute,
          name: AppRouter.settingRoute,
          builder: (context, state) => const SettingView(),
        ),
        GoRoute(
          path: printersSettingRoute,
          name: AppRouter.printersSettingRoute,
          builder: (context, state) => const PrintersView(),
        ),
        GoRoute(
          path: createEditEditPrintersSettingRoute,
          name: AppRouter.createEditEditPrintersSettingRoute,
          builder: (context, state) => CreateEditPrinterView(
            settingItemModel: state.extra as SettingItemModel?,
          ),
        ),
        GoRoute(
          path: customerDisplaysRoute,
          name: AppRouter.customerDisplaysRoute,
          builder: (context, state) => const CustomerDisplaysView(),
        ),
        GoRoute(
          path: createEditCustomerDisplaysRoute,
          name: AppRouter.createEditCustomerDisplaysRoute,
          builder: (context, state) => CreateEditCustomerDisplaysView(
            settingItemModel: state.extra as SettingItemModel?,
          ),
        ),
        GoRoute(
          path: taxesSettingRoute,
          name: AppRouter.taxesSettingRoute,
          builder: (context, state) => const TaxesView(),
        ),
        GoRoute(
          path: createEditTaxesSettingRoute,
          name: AppRouter.createEditTaxesSettingRoute,
          builder: (context, state) => CreateEditTaxesView(
              settingItemModel: state.extra as SettingItemModel?),
        ),

        GoRoute(
          path: generalSettingRoute,
          name: AppRouter.generalSettingRoute,
          builder: (context, state) => const GeneralView(),
        ),
        GoRoute(
          path: changeHomeScreenLayoutSettingRoute,
          name: AppRouter.changeHomeScreenLayoutSettingRoute,
          builder: (context, state) => const ChangeHomeScreenLayoutView(),
        ),
        ////////////////////////////Back office/////////////////////////////////////////
        GoRoute(
          path: backOfficeRoute,
          name: AppRouter.backOfficeRoute,
          builder: (context, state) => const BackOfficeView(),
        ),
        ////////////////////////////Apps/////////////////////////////////////////
        GoRoute(
          path: appsRoute,
          name: AppRouter.appsRoute,
          builder: (context, state) => const AppsView(),
        ),
        ////////////////////////////Support/////////////////////////////////////////

        GoRoute(
          path: supportRoute,
          name: AppRouter.supportRoute,
          builder: (context, state) => const SupportView(),
        ),
        GoRoute(
          path: helpRoute,
          name: AppRouter.helpRoute,
          builder: (context, state) => const HelpView(),
        ),
        GoRoute(
          path: legalInformationRoute,
          name: AppRouter.legalInformationRoute,
          builder: (context, state) => const LegalInformationView(),
        ),
        GoRoute(
          path: accountRoute,
          name: AppRouter.accountRoute,
          builder: (context, state) => const AccountDeleteView(),
        ),
        GoRoute(
          path: webPageRoute,
          name: AppRouter.webPageRoute,
          builder: (context, state) => WebPageView(
            url: state.extra as String?,
          ),
        ),
      ]);
}
