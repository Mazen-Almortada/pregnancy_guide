import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pregnancy_guide/core/services/database_service.dart';

import '../../models/item.dart';

part 'equipment_state.dart';

class EquipmentCubit extends Cubit<EquipmentState> {
  EquipmentCubit() : super(EquipmentInitial());
  final DatabaseService _databaseService = DatabaseService();
  void addItem(Item item, String box) async {
    List<Item> items = await _getItems(box);

    items.add(item);

    List itemModelToJson = items.map((item) => item.toMap()).toList();
    await _databaseService.setStringValue(box, json.encode(itemModelToJson));
    getCachedItems(box);
  }

  void checkItem(Item item, String box) async {
    List<Item> items = await _getItems(box);

    items
        .firstWhere((element) =>
            element.title == item.title && element.type == item.type)
        .isChecked = item.isChecked;

    List itemModelToJson = items.map((item) => item.toMap()).toList();
    await _databaseService.setStringValue(box, json.encode(itemModelToJson));
    getCachedItems(box);
  }

  void deleteItem(Item item, String box) async {
    List<Item> items = await _getItems(box);

    items.removeWhere(
        (element) => element.title == item.title && element.type == item.type);

    List itemModelToJson = items.map((item) => item.toMap()).toList();
    await _databaseService.setStringValue(box, json.encode(itemModelToJson));
    getCachedItems(box);
  }

  void getCachedItems(String box) async {
    emit(ItemsLoading());
    final cachedData = await _getItems(box);
    if (cachedData.isEmpty) {
      emit(ItemsEmpty());
    } else {
      emit(ItemsLoaded(items: cachedData.reversed.toList()));
    }
  }

  Future<List<Item>> _getItems(String box) async {
    final jsonString = await _databaseService.getStringValue(box);
    if (jsonString != null) {
      List decodeJsonData = json.decode(jsonString);
      List<Item> jsonToItemModels = decodeJsonData
          .map<Item>((jsonItem) => Item.fromMap(jsonItem))
          .toList();
      return jsonToItemModels;
    }
    return [];
  }
}
