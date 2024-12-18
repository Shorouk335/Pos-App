abstract class SalesStates {}

class InitialSalesStates extends SalesStates {}

class AddItemToTicketStates extends SalesStates {} // TICKET +++ > 0

class SaveTicketSalesStates extends SalesStates {} // TICKET IS SAVE OR CHARGE

class ChangeCustomerNameInTicketSalesStates extends SalesStates {}

class DeleteOpenTicketSalesStates extends SalesStates {}

class ChangeTicketSalesStates extends SalesStates {}

class DeleteCurrentTicketSalesStates extends SalesStates {}

class EditCustomerTicketSalesStates extends SalesStates {}

class EditEmployeeTicketSalesStates extends SalesStates {}

class ChangeCurrentTicketSalesStates extends SalesStates {}

class EditItemTicketSalesStates extends SalesStates {}

class DeleteItemFromTicketSalesStates extends SalesStates {}

class ChangeTicketTypeSalesStates extends SalesStates {}

class ChangeSearchInItemsSalesStates extends SalesStates {}

class ChangeShowItemsSalesStates extends SalesStates {}

class ChangeThemeState extends SalesStates {}

class GetFavoriteListFromDBState extends SalesStates {} 

class ChangeFavoriteListState extends SalesStates {}

class ChangeInDiscountListInTicketState extends SalesStates {}

