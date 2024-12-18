import 'package:e_ticket_app/modules/home%20sales/sales/domain/model/ticket_model.dart';

abstract class OpenTicketStates {}

class InitialOpenTicketDataStates extends OpenTicketStates {}

class GetOpenTicketDataStates extends OpenTicketStates {}

class ChangeSelectTicketStates extends OpenTicketStates {}

class SelectAllOpenTicketStates extends OpenTicketStates {}

class MergeOpenTicketStates extends OpenTicketStates {}

class DeleteOpenTicketStates extends OpenTicketStates {}

class SortByNameTicketStates extends OpenTicketStates {}

class SortByTimeTicketStates extends OpenTicketStates {}

class SortByAmountTicketStates extends OpenTicketStates {}

class SortByEmployeeTicketStates extends OpenTicketStates {}

class SuccessSearchInOpenTicketState extends OpenTicketStates {}

class ErrorSearchInOpenTicketState extends OpenTicketStates {}

class ChangeSearchModelOpenTicketState extends OpenTicketStates {}

class DeleteCurrentTicketStates extends OpenTicketStates {}
