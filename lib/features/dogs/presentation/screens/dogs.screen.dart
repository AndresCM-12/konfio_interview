import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sh_mobile/config/utils/constant/constants.dart';
import 'package:sh_mobile/config/utils/injections.dart';
import 'package:sh_mobile/features/dogs/presentation/bloc/dogs/dogs.bloc.dart';
import 'package:sh_mobile/features/dogs/presentation/bloc/dogs/dogs.event.dart';
import 'package:sh_mobile/features/dogs/presentation/bloc/dogs/dogs.state.dart';
import 'package:sh_mobile/features/dogs/presentation/widgets/dog.widget.dart';
import 'package:sh_mobile/shared/widgets/appbar_title.dart';
import 'package:sh_mobile/shared/widgets/text_body.dart';
import 'package:skeletonizer/skeletonizer.dart';

@RoutePage()
class DogsScreen extends StatelessWidget {
  const DogsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DogsRemoteBloc>(
      create: (context) => sl()..add(const GetDogs()),
      child: Scaffold(
        backgroundColor: const Color(Constants.backgroundColor),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color(Constants.backgroundColor),
          elevation: 0.0,
          leading: IconButton(
            icon: const Icon(Icons.chevron_left),
            iconSize: 32.0,
            color: const Color(Constants.secondaryFontColor),
            onPressed: () => context.router.back(),
          ),
          title: const AppBarTitle(title: Constants.appName),
        ),
        body: body(),
      ),
    );
  }

  body() {
    return BlocBuilder<DogsRemoteBloc, DogsRemoteState>(
      builder: (context, state) {
        if (state is DogsRemoteSuccess) {
          return handleSuccess(state, context);
        }

        if (state is DogsRemoteLoading) {
          return handleLoading();
        }

        if (state is DogsRemoteFailed) {
          return handleFailed(state);
        }

        return const SizedBox.shrink();
      },
    );
  }

  Widget handleSuccess(DogsRemoteSuccess state, BuildContext context) {
    final dogs = state.dogs!;

    if (dogs.isEmpty) {
      return const Center(child: TextBody(text: "No dogs found 😭"));
    }

    return RefreshIndicator(
      onRefresh: () async =>
          context.read<DogsRemoteBloc>().add(const GetDogs(forceRefresh: true)),
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
        itemCount: dogs.length,
        separatorBuilder: (context, index) => const SizedBox(height: 32.0),
        itemBuilder: (context, index) => DogWidget(dog: dogs[index]),
      ),
    );
  }

  Widget handleLoading() {
    return Skeletonizer(
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
        itemCount: Constants.mockedDogs.length,
        separatorBuilder: (context, index) => const SizedBox(height: 32.0),
        itemBuilder: (context, index) =>
            DogWidget(dog: Constants.mockedDogs[index]),
      ),
    );
  }

  Center handleFailed(DogsRemoteFailed state) {
    return Center(child: TextBody(text: state.error!.message!));
  }
}
