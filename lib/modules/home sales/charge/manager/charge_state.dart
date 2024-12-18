part of 'charge_cubit.dart';

abstract class ChargeState {}

final class InitialChargeState extends ChargeState {} 
final class GetInitialSplitPriceChargeState extends ChargeState {} 
final class IncreaseSplitPriceChargeState extends ChargeState {} 
final class DecreaseSplitPriceChargeState extends ChargeState {} 
final class AddPaidSplitPriceChargeState extends ChargeState {} 
final class ChangeValueSplitPriceChargeState extends ChargeState {} 

