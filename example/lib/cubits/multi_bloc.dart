import 'package:example/cubits/auth/auth_cubit.dart';
import 'package:example/cubits/bottom_navigation/bottom_navigation_cubit.dart';
import 'package:example/cubits/home/home_cubit.dart';
import 'package:example/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MultiBloc extends StatelessWidget {
  const MultiBloc({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<AuthCubit>(create: (_) => AuthCubit()),
      BlocProvider<HomeCubit>(
        create: (_) => HomeCubit(),
      ),
      BlocProvider<BottomNavigationCubit>(
          create: (_) => BottomNavigationCubit())
    ], child: const ExampleApp());
  }
}
