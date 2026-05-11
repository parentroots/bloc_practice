import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/counter_cubit.dart';
import '../cubit/counter_state.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('Counter Screen');
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                'Counter Cubit',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              centerTitle: true,
              elevation: 0,
              backgroundColor: Colors.transparent,
              foregroundColor: Colors.deepPurple,
            ),
            body: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.white, Colors.deepPurple.shade50],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Current Count',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.deepPurple,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(height: 10),
                  BlocBuilder<CounterCubit, CounterState>(
                    builder: (context, state) {
                      return Text(
                        '${state.count}',
                        style: TextStyle(
                          fontSize: 80,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple.shade700,
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _CounterButton(
                        icon: Icons.remove,
                        onPressed: () => context.read<CounterCubit>().decrement(),
                        color: Colors.redAccent,
                      ),
                      const SizedBox(width: 20),
                      _CounterButton(
                        icon: Icons.refresh,
                        onPressed: () => context.read<CounterCubit>().resetCount(),
                        color: Colors.orangeAccent,
                      ),
                      const SizedBox(width: 20),
                      _CounterButton(
                        icon: Icons.add,
                        onPressed: () => context.read<CounterCubit>().increment(),
                        color: Colors.greenAccent.shade700,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _CounterButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final Color color;

  const _CounterButton({
    required this.icon,
    required this.onPressed,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(20),
        child: Ink(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: color.withOpacity(0.5), width: 2),
          ),
          child: Icon(icon, size: 30, color: color),
        ),
      ),
    );
  }
}
