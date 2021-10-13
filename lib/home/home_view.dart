import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home.dart';
import 'widgets/widgets.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late final TextEditingController _searchController;
  late final SeachCubit _albumCubit;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _albumCubit = context.read<SeachCubit>();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: kToolbarHeight,
          left: 0,
          right: 0,
          bottom: 0,
          child: BlocBuilder<SeachCubit, SearchState>(
            builder: (context, state) {
              switch (state.status) {
                case SearchAlbumStatus.idle:
                  return const Center(child: Text('Search for any album'));
                case SearchAlbumStatus.loading:
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                case SearchAlbumStatus.success:
                  if (state.albums.isEmpty) {
                    return const Text('No album found');
                  }
                  return SearchResultView(
                    albums: state.albums,
                    artists: state.artists,
                    tracks: state.tracks,
                  );
                case SearchAlbumStatus.failure:
                  return Center(child: Text(state.errorMessage!));
              }
            },
          ),
        ),
        Positioned(
          height: kToolbarHeight,
          left: 0,
          right: 0,
          child: SearchBar(
            _searchController,
            onSearch: _albumCubit.search,
          ),
        ),
      ],
    );
  }
}
