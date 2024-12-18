import 'package:e_ticket_app/modules/home%20sales/sales/domain/model/ticket_model.dart';

class EditAssignEmployeePageModel {
  final List<TicketModel> ticketModeList;
  final bool isEdit;

  EditAssignEmployeePageModel(
      {required this.ticketModeList, required this.isEdit});
}
