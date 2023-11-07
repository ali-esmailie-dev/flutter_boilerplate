import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/core/widgets/app_error_again.dart';
import 'package:flutter_boilerplate/core/widgets/app_loading.dart';
import 'package:flutter_boilerplate/core/widgets/app_pull_to_refresh.dart';
import 'package:flutter_boilerplate/core/widgets/app_scaffold.dart';
import 'package:flutter_boilerplate/core/widgets/general_appbar.dart';
import 'package:flutter_boilerplate/core/widgets/lists/app_list_view_builder.dart';
import 'package:flutter_boilerplate/features/stores_feature/presentation/bloc/stores_bloc.dart';

class StoresScreen extends StatefulWidget {
  const StoresScreen({super.key});

  @override
  State<StoresScreen> createState() => _StoresScreenState();
}

class _StoresScreenState extends State<StoresScreen> {
  /// This key is used to solve the following problem :
  /// "Don't use one refreshController to multiple SmartRefresher"
  final GlobalKey _pullToRefreshKey = GlobalKey();

  @override
  void initState() {
    BlocProvider.of<StoresBloc>(context).add(FetchStoresEvent());
    super.initState();
  }

  @override
  Widget build(final BuildContext context) {
    return AppScaffold(
      appBar: const GeneralAppBar(
        title: 'Stores',
      ),
      smallBody: BlocBuilder<StoresBloc, StoresState>(
        builder: (final BuildContext context, final StoresState state) {
          switch (state.storesStatus) {
            case StoreStatus.initial:
              return const AppLoading();
            case StoreStatus.failure:
              return AppErrorAgain(
                errorMessage: state.errorMessage,
                onReloadButtonTap: () {
                  context.read<StoresBloc>().add(FetchStoresEvent());
                },
              );
            case StoreStatus.success:
              return AppPullToRefresh(
                key: _pullToRefreshKey,
                refreshController: state.refreshController,
                onRefresh: () {
                  context.read<StoresBloc>().add(FetchStoresEvent());
                },
                child: AppListViewBuilder(
                  itemCount: state.storesEntity.length,
                  itemBuilder: (final BuildContext context, final int index) {
                    return ListTile(
                      title: Text(state.storesEntity[index].name ?? ''),
                    );
                  },
                  separatorBuilder:
                      (final BuildContext context, final int index) {
                    return const Divider();
                  },
                ).build(context),
              );
          }
        },
      ),
    );
  }
}
