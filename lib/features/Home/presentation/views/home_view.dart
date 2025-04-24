import 'package:book_list_app/features/Home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:book_list_app/features/Home/presentation/views/widgets/home_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static String id = "HomeView";
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..fetchBooksInitialize(),
      child: Scaffold(
        body: HomeViewBody(),
      ),
    );
  }
}
