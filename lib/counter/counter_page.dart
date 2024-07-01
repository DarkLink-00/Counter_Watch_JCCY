import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/counter_cubit.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterCubit(),
      child: const CounterView(),
    );
  }
}

class CounterView extends StatefulWidget {
  const CounterView({super.key});

  @override
  State<CounterView> createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<CounterCubit, int>(
        listener: (context, state) {
          if (state == 10 || state == -10) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Límite alcanzado')),
            );
          }
        },
        child: SizedBox.expand(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Counter',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              const SizedBox(
                height: 5,
              ),
              ElevatedButton(
                  onPressed: () => context.read<CounterCubit>().increment(),
                  child: const Icon(Icons.add)),
              const SizedBox(
                height: 5,
              ),
              const CounterText(),
              const SizedBox(
                height: 5,
              ),
              ElevatedButton(
                  onPressed: () => context.read<CounterCubit>().decrement(),
                  child: const Icon(Icons.remove)),
              const SizedBox(
                height: 5,
              ),
              ElevatedButton(
                  onPressed: () => context.read<CounterCubit>().reset(),
                  child: const Text('Reset')),
            ],
          ),
        ),
      ),
    );
  }
}

class CounterText extends StatelessWidget {
  const CounterText({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final count = context.select((CounterCubit cubit) => cubit.state);
    return Text('$count', style: theme.textTheme.displayMedium);
  }
}
