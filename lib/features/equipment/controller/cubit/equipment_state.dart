// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'equipment_cubit.dart';

abstract class EquipmentState extends Equatable {
  const EquipmentState();

  @override
  List<Object> get props => [];
}

class EquipmentInitial extends EquipmentState {}

class ItemsLoading extends EquipmentState {}

class ItemsEmpty extends EquipmentState {}

class ItemsLoaded extends EquipmentState {
  final List<Item> items;
  const ItemsLoaded({
    required this.items,
  });
}
