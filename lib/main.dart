import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:state/cubit/counter_state.dart';
import 'package:state/cubit/cubit_counter.dart';

import 'counter_provider/counter_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // provider
    // return MultiProvider(
    //   providers: [
    //     ChangeNotifierProvider(create: (BuildContext context) => CounterProvider(),)
    //   ],
    //
    //   child: MaterialApp(
    //     title: 'Flutter Demo',
    //     theme: ThemeData(
    //       colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    //       useMaterial3: true,
    //     ),
    //     home:  MyHomePage(title: 'Flutter Demo Home Page'),
    //   ),
    // );
    // Cubit
    return  BlocProvider(
      create: (BuildContext context) => CounterCubit(),
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home:  MyHomePage(title: 'Flutter Demo Home Page'),
        ),
    );
    // );
  }
}

class MyHomePage extends StatelessWidget {
   MyHomePage({super.key, required this.title});
  final String title;


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),

            // PROVIDER
            // Consumer<CounterProvider>(
            //   builder: (BuildContext context, value, Widget? child) {
            //   return  Text(
            //     '${value.counter}',
            //     style: Theme.of(context).textTheme.headlineMedium,
            //   );}
            // ),


            BlocBuilder<CounterCubit,CounterState>
              (builder: (context, state)=>  Text(
                "${CounterCubit.get(context).counter}"
            )),

          ],
        ),
      ),
      //provider
      // floatingActionButton: Row(
      //   mainAxisAlignment: MainAxisAlignment.spaceAround,
      //   children: [
      //     FloatingActionButton(
      //       onPressed: Provider.of<CounterProvider>(context).incrementCounter,
      //       tooltip: 'Increment',
      //       child: const Icon(Icons.add),
      //     ),
      //     FloatingActionButton(
      //       onPressed: Provider.of<CounterProvider>(context).decrementCounter,
      //       tooltip: 'Decrement',
      //       child: const Icon(Icons.minimize_outlined),
      //     ),
      //   ],
      // ), // This trailing comma makes auto-formatting nicer for build methods.
      //cubit
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            onPressed: CounterCubit.get(context).incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: CounterCubit.get(context).decrementCounter,
            tooltip: 'Decrement',
            child: const Icon(Icons.minimize_outlined),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
