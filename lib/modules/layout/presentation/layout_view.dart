import 'package:e_ticket_app/modules/layout/manager/layout_cubit.dart';
import 'package:e_ticket_app/modules/layout/manager/layout_states.dart';
import 'package:e_ticket_app/modules/layout/presentation/widget/layout%20drawer/layout_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LayoutView extends StatefulWidget {
  const LayoutView({super.key});

  @override
  State<LayoutView> createState() => _LayoutViewState();
}

class _LayoutViewState extends State<LayoutView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LayoutCubit() ,
      child: BlocConsumer<LayoutCubit, LayoutStates>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = LayoutCubit.get(context);
          return SafeArea(
            child: Scaffold(
              body: cubit.screensList[cubit.currentIndex],
              drawer: const LayoutDrawerWidget()
            ),
          );
        },
      ),
    );
  }
}
