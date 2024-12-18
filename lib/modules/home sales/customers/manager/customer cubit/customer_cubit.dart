import 'package:e_ticket_app/modules/home%20sales/customers/manager/customer%20cubit/customer_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomerCubit extends Cubit<CustomerStates> {
  CustomerCubit() : super(InitialCustomerSales());

  static CustomerCubit get(context) => BlocProvider.of(context);

  List<String> customerList = ["mohamed", "ahmed", "ali"];

  getCustomerData() {}

  addCustomer(String name) {
    customerList.add(name);
  } 
   

}
