import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_managment_ex/cubit/counter2_cubit.dart';
import 'package:state_managment_ex/cubit/counter/counter_cubit.dart';

import 'cubit/counter/counter_states.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => CounterCubit()),
          BlocProvider(create: (context) => Counter2Cubit()),
        ],
        child: BlocBuilder<CounterCubit, CounterState>(
          builder: (BuildContext context, state) {
            final counter = BlocProvider.of<CounterCubit>(context);
            return BlocListener<CounterCubit, CounterState>(
              listener: (context, state) {
               print(state);
              },
              child: Scaffold(
                appBar: AppBar(
                  title: Text('state management'),
                ),
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        'You have pushed the button this many times:',
                      ),
                      Text(
                        '${counter.count}',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                              onPressed: () => counter.increase(),
                              child: Text('increase')),
                          ElevatedButton(
                              onPressed: () => counter.decrease(),
                              child: Text('decrease')),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }
}
