import 'package:bloc/bloc.dart';
import 'package:e_ticket_app/core/data_service/hive/hive.dart';
import 'package:e_ticket_app/modules/home%20sales/open%20ticket/manager/employee%20ticket/employee_ticket_state.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/domain/model/ticket_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmployeeTicketCubit extends Cubit<EmployeeTicketState> {
  EmployeeTicketCubit() : super(InitialEmployeeTicketState());
  static EmployeeTicketCubit get(context) => BlocProvider.of(context);

  String employee = "ali mohamed";

  transferEmployeeToTicket(List<TicketModel> ticketModelList) {
    for (var ticketModel in ticketModelList) {
      ticketModel.employeeName = employee;
    }
    HiveService.updateTicketList(ticketModelList);
    emit(TransferEmployeeTicketState());
  }
  
}
