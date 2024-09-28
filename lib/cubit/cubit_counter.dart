

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state/cubit/counter_state.dart';

class CounterCubit extends Cubit<CounterState>{
  CounterCubit(): super (InitState());

 static  CounterCubit get(context)=> BlocProvider.of(context);

  int counter = 0;

  void incrementCounter() {
    counter++;
    print(counter);
   emit(IncrementCounterState());
  }
  void decrementCounter() {
    counter--;
    print(counter);
    emit(DecrementCounterState());
  }

}