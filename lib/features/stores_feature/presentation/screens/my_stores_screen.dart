import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/core/widgets/app_error_again.dart';
import 'package:flutter_boilerplate/core/widgets/app_loading.dart';
import 'package:flutter_boilerplate/core/widgets/app_scaffold.dart';
import 'package:flutter_boilerplate/core/widgets/general_appbar.dart';
import 'package:flutter_boilerplate/core/widgets/lists/app_list_view_builder.dart';
import 'package:flutter_boilerplate/features/stores_feature/presentation/bloc/stores_bloc.dart';

class MyStoresScreen extends StatefulWidget {
  const MyStoresScreen({super.key});

  @override
  State<MyStoresScreen> createState() => _MyStoresScreenState();
}

class _MyStoresScreenState extends State<MyStoresScreen> {
  @override
  void initState() {
    context.read<StoresBloc>().add(FetchMyStoresEvent());
    super.initState();
  }

  @override
  Widget build(final BuildContext context) {
    return AppScaffold(
      appBar: const GeneralAppBar(
        title: 'My Stores',
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
              return AppListViewBuilder(
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
              ).build(context);
          }
        },
      ),
    );
  }
}
