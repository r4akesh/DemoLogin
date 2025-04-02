import 'package:bloc_login/counter/bloc/counter_bloc.dart';
import 'package:bloc_login/counter/bloc/counter_event.dart';
import 'package:bloc_login/counter/bloc/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final counterBloc = context.read<CounterBloc>();
    return Scaffold(
      appBar: AppBar(
        title: Text("CounterDemo"),
      ),
      body: Center(
        child:
            BlocBuilder<CounterBloc, CounterState>(builder: (context, state) {
          return Text('Counter - ${state.counter}');
        }),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              counterBloc.add(IncrementCounter());
            },
            child: Icon(Icons.add),
           // heroTag: 'increment',
          ),
          FloatingActionButton(
            onPressed: () {
              counterBloc.add(DecrementCounter());
            },
            child: Icon(Icons.remove),
           // heroTag: 'decrement',
          ),
        ],
      ),
    );
  }
}
