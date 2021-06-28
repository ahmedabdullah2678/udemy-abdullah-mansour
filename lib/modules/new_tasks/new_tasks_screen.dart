import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:structure/shared/components/components.dart';

import 'package:structure/shared/cubit/cubit.dart';
import 'package:structure/shared/cubit/states.dart';

class NewTasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var tasks = AppCubit.get(context).newtasks;
        return ListView.separated(
          itemBuilder: (context, index) => BuildTaskItem(tasks[index]),
          separatorBuilder: (context, index) => Padding(
            padding: const EdgeInsetsDirectional.only(
              start: 20.0,
            ),
            child: Container(
              width: double.infinity,
              height: 1.0,
              color: Colors.grey[300],
            ),
          ),
          itemCount: tasks.length,
        );
      },
    );
  }
}
