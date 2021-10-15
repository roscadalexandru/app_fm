import '../error_handler/error_handler.dart';
import '../error_handler/error_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ErrorListener(
      child: BlocProvider(
        create: (context) => SearchCubit(),
        child: BlocListener<SearchCubit, SearchState>(
          listener: (context, state) {
            if (state.status == SearchAlbumStatus.failure) {
              context
                  .read<ErrorHandlerCubit>()
                  .displayError(state.errorMessage!);
            }
          },
          child: const Scaffold(
            body: HomeView(),
          ),
        ),
      ),
    );
  }
}
