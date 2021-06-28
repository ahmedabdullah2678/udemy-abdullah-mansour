import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/modetheme cubit/modetheme_cubit.dart';
import 'cubit/newsapp cubit/newsapp_cubit.dart';

class NewsLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => NewsCubit()
          ..getBusiness()
          ..getSports()
          ..getSciences(),
        child: BlocConsumer<NewsCubit, NewsState>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = NewsCubit.get(context);
            return Scaffold(
              appBar: AppBar(
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.search),
                  ),
                  IconButton(
                    onPressed: () {
                      ModethemeCubit.get(context).changeMode();
                    },
                    icon: Icon(Icons.brightness_4_outlined),
                  ),
                ],
                title: Text('News Application'),
              ),
              body: cubit.screens[cubit.currentIndex],
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: cubit.currentIndex,
                onTap: (index) {
                  cubit.changeBottomNavBar(index);
                },
                items: cubit.bottomItems,
              ),
            );
          },
        ));
  }
}
