
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/my_product_bloc.dart';
import 'bloc/my_product_event.dart';
import 'bloc/my_product_state.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Product2"),),
      body: BlocBuilder<MyProductBloc, MyProductState>(
        builder: (context, state) {
          if(state is ProductLoading){
            return Center(child: CircularProgressIndicator());
          }
          else if(state is ProductLoaded){
            return ListView.builder(
                itemCount: state.listItem.length,
                itemBuilder: (context, index) {
                  var pProduct= state.listItem[index];
                  return ListTile(
                    title: Text(pProduct.name),
                    trailing: IconButton(
                        onPressed: () {
                          context.read<MyProductBloc>().add(DeleteMyProduct(pProduct.id));
                        }, icon: Icon(Icons.delete)),
                  );
                });
          }{
            return Center(child: Text("Error loading products"));
          }

        },
      ),
    );
  }
}
