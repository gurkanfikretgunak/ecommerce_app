import 'package:example/cubits/auth/auth_cubit.dart';
import 'package:example/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MultiBloc extends StatelessWidget {
  const MultiBloc({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [BlocProvider<AuthCubit>(create: (_) => AuthCubit())],
        child: const ExampleApp());
  }
}
