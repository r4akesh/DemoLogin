import 'package:bloc_login/ContactScreen.dart';
import 'package:bloc_login/List/ListScreen.dart';
import 'package:bloc_login/List/list_bloc.dart';
import 'package:bloc_login/MainTabBar.dart';
import 'package:bloc_login/botton_nav/bottombar_bloc.dart';
import 'package:bloc_login/counter/bloc/counter_bloc.dart';
import 'package:bloc_login/login/login_bloc.dart';
import 'package:bloc_login/login/login_event.dart';
import 'package:bloc_login/login/login_state.dart';
import 'package:bloc_login/product/ProductScreen.dart';
import 'package:bloc_login/product/bloc/my_product_event.dart';
import 'package:bloc_login/shopping/UI/CartScreen.dart';
import 'package:bloc_login/sqlite/DbHomeScreen.dart';
import 'package:bloc_login/to_do/bloc/todo_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:share_plus/share_plus.dart';

import 'product/bloc/my_product_bloc.dart';
import 'shopping/cart_bloc/cart_bloc.dart';
import 'shopping/product_bloc/product_bloc.dart';
import 'shopping/product_bloc/product_event.dart';
import 'shopping/repo/product_repository.dart';

void main() {
  final productRepository = ProductRepository();
  runApp(  MyApp(productRepository: productRepository));


}

class MyApp extends StatelessWidget {
  final ProductRepository productRepository;
    MyApp({required this.productRepository});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<BottombarBloc>(create: (context)=>BottombarBloc()),
      BlocProvider<LoginBloc>(create: (context)=>LoginBloc()),
      BlocProvider<CartBloc>(create: (context)=>CartBloc()),
     // BlocProvider(create: (_) => ProductBloc(productRepository)..add(LoadProducts()),),
      BlocProvider<CounterBloc>(create: (context)=>CounterBloc()),
      BlocProvider<TodoBloc>(create: (context)=>TodoBloc()),
      BlocProvider<ListBloc>(create: (context)=>ListBloc()),
      BlocProvider<MyProductBloc>(create: (context)=>MyProductBloc())
    ], child:  MaterialApp(
      title: 'Bloc Login Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const MyHomePage(title: 'BlocDemoHome'),
      home: BlocProvider(
        create: (context) => MyProductBloc()..add(LoadMyProducts()),

         child: LoginScreen(),
         // child: DbHomeScreen(),
        // child: ContactScreen(),
     // child: ProductScreen(),
      ),
    ));
  }
}

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginBloc = BlocProvider.of<LoginBloc>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            BlocBuilder<LoginBloc, LoginState>(
              builder: (context, state) {
                return TextField(
                  onChanged: (value) => loginBloc.add(EmailChanged(value)),
                  decoration: InputDecoration(
                    labelText: 'Email',
                    errorText: state.emailCorrect
                        ? 'Invalid email'
                        : null,
                  ),
                );
              },
            ),
            SizedBox(height: 16),
            BlocBuilder<LoginBloc, LoginState>(
              builder: (context, state) {
                return TextField(
                  onChanged: (value) => loginBloc.add(PasswordChanged(value)),
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    errorText: state.pwdCorrect? 'Invalid  password' : null,
                  ),
                );
              },
            ),
            SizedBox(height: 16),
            BlocBuilder<LoginBloc, LoginState>(
              builder: (context, state) {
                if (state.isSubmitting) {
                  return CircularProgressIndicator();
                }

                return ElevatedButton(
                  onPressed: () {
                    //loginBloc.add(LoginSubmitted());
                    shareAppVersion();
                  },
                  child: Text('Login'),
                );
              },
            ),
            SizedBox(height: 16),
            BlocBuilder<LoginBloc, LoginState>(
              builder: (context, state) {
                if (state.isSuccess) {
                  return Text('Login Successful!',
                      style: TextStyle(color: Colors.green));
                } else if (state.emailCorrect) {
                  return Text(
                      'emailCorrect Failed!', style: TextStyle(color: Colors.red));
                }else if (state.isFailure) {
                  return Text(
                      'Login Failed!', style: TextStyle(color: Colors.red));
                }
                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> shareAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    String version = packageInfo.version;  // Example: "1.0.0"
    String webAppUrl = "https://your-web-app.com"; // Replace with your actual link

   // String message = "Check out my web app (Version: $version) 🌍\n$webAppUrl";
    String message = "Check out my web app (Version: $version) 🌍\n$webAppUrl";

    Share.share(message);
  }
}




