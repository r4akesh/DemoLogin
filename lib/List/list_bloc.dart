import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:bloc_login/List/list_event.dart';
import 'package:bloc_login/List/list_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'ItemModel.dart';

class ListBloc extends Bloc<ListEvent,ListState>{
  ListBloc():super(ItemIntial()){

    on<FetchItem>(_onFetchItems);


    on<DeleteItem>((event,emit){
      final delItem = List<ItemModel>.from((state as ItemLoaded).items);
      delItem.removeWhere((item)=>event.id== item.id);
     //delItem.remove(event.id);
       // ..remove(event.id);
      emit(ItemLoaded(delItem));
    });


  }


  Future<void> _onFetchItems(ListEvent event, Emitter<ListState> emit) async {
    emit(ItemLoading());
    try {
      final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        final items = data.map((json) => ItemModel.fromJson(json)).toList();
        emit(ItemLoaded(items));
      } else {
        emit(ItemError('Failed to fetch data'));
      }
    } catch (e) {
      emit(ItemError('An error occurred: $e'));
    }
  }
}




