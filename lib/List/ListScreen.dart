import 'package:bloc_login/List/list_bloc.dart';
import 'package:bloc_login/List/list_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'list_event.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});



  @override
  Widget build(BuildContext context) {
    context.read<ListBloc>().add(FetchItem());
    return Scaffold(
      appBar: AppBar(
        title: Text('Dummy List'),
      ),
      body: BlocBuilder<ListBloc,ListState>(
          builder: (context, state) {
        if (state is ItemLoading) {
          return Center(
            child: Text('Loading...'),
          );
        } else if (state is ItemLoaded) {
          return ListView.builder(
              //itemCount: state.items.length,
              itemCount: 10,
              itemBuilder: (context, index) {
                final itemm = state.items[index];
                return ListTile(
                  title: Text('${itemm.id}'),
                  subtitle: Text('${itemm.title}'),
                  trailing: IconButton(
                      onPressed: (){
                          context.read<ListBloc>().add(DeleteItem(itemm.id));
                      },
                     icon: Icon(Icons.delete),
                ));
              });
        } else if (state is ItemError) {
          return  Text(state.message);
        }
        return const Center(child: Text('Press the button to fetch items.'));
      }),
    );
  }
}
