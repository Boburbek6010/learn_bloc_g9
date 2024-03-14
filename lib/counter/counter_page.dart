import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc_g9/counter/counter_cubit.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CounterCubit, int>(
        builder: (context, state) {
          return SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("$state", style: const TextStyle(
                  fontSize: 35
                ),),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextButton(onPressed: (){
                      context.read<CounterCubit>().increment();
                    }, style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.lightBlue)
                    ), child: const Text("+", style: TextStyle(
                        fontSize: 35
                    ),),),
                    TextButton(onPressed: (){
                      context.read<CounterCubit>().decrement();
                    }, style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.lightBlue)
                    ), child: const Text("-", style: TextStyle(
                        fontSize: 35
                    ),),),
                  ],
                )
              ],
            ),
          );
        }
      ),
    );
  }
}
