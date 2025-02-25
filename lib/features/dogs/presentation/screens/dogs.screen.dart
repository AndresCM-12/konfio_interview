import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sh_mobile/config/utils/constant/constants.dart';
import 'package:sh_mobile/config/utils/injections.dart';
import 'package:sh_mobile/features/dogs/presentation/bloc/dogs/dogs.bloc.dart';
import 'package:sh_mobile/features/dogs/presentation/bloc/dogs/dogs.event.dart';
import 'package:sh_mobile/features/dogs/presentation/bloc/dogs/dogs.state.dart';

@RoutePage()
class DogsScreen extends StatelessWidget {
  const DogsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DogsRemoteBloc>(
      create: (context) => sl()..add(const GetDogs()),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.chevron_left),
            iconSize: 28.0,
            onPressed: () => context.router.back(),
          ),
          title: const Text(Constants.appName),
        ),
        body: _buildBody(),
      ),
    );
  }

  _buildBody() {
    return BlocBuilder<DogsRemoteBloc, DogsRemoteState>(
      builder: (context, state) {
        if (state is DogsRemoteLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is DogsRemoteSuccess) {
          final dogs = state.dogs!;
          return ListView.builder(
            itemCount: dogs.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(dogs[index].dogName ?? ''),
                subtitle: Text(dogs[index].age?.toString() ?? ''),
              );
            },
          );
        }

        if (state is DogsRemoteFailed) {
          return Center(child: Text(state.error!.message!));
        }

        return const SizedBox.shrink();
      },
    );
  }
}
