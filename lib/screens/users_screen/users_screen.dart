import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:list_users_app/components/all_shimmers/user_card_shimmer.dart';
import 'package:list_users_app/components/custom_flushBar.dart';
import 'package:list_users_app/components/custom_spinner.dart';
import 'package:list_users_app/components/error_screen.dart';
import 'package:list_users_app/components/user_card.dart';
import 'package:list_users_app/generated/l10n.dart';
import 'package:list_users_app/helpers/auto_route.gr.dart';
import 'package:list_users_app/models/users_model.dart';
import 'package:list_users_app/screens/user_detail_screen/user_detail_screen.dart';
import 'package:list_users_app/screens/users_screen/bloc/users_bloc.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({Key? key}) : super(key: key);

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  late UsersBloc bloc;
  late ScrollController _scrollController;
  int counter = 0;
  bool isLoading = false;
  late List<UsersModel> usersList = [];

  @override
  void initState() {
    bloc = UsersBloc();
    bloc.add(GetUsersEvent(from: counter));
    _scrollController = ScrollController(initialScrollOffset: 5.0)
      ..addListener(_scrollListener);

    super.initState();
  }

  @override
  void dispose() {
    bloc.close();
    _scrollController.dispose();

    super.dispose();
  }

  _scrollListener() {
    if (usersList.isNotEmpty) {
      if (_scrollController.offset >=
              _scrollController.position.maxScrollExtent &&
          !_scrollController.position.outOfRange) {
        isLoading = true;

        if (isLoading) {
          counter = counter + 10;

          bloc.add(GetUsersEvent(from: counter, isFirstCall: false));
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.blue[700],
        title: Text(S.of(context).appBarTitle),
      ),
      body: BlocConsumer<UsersBloc, UsersState>(
        bloc: bloc,
        listener: (context, state) {
          if (state is GetUsersErrorState) {
            Exceptions.showFlushbar(
              state.error.message.toString(),
              context: context,
            );
          } else if (state is GetUsersLoadedState) {
            usersList.addAll(state.model);

            isLoading = false;
          }
        },
        builder: (context, state) {
          if (state is GetUsersLoadingState) {
            return const UserCardShimmer();
          } else if (state is GetUsersErrorState) {
            return ErrorScreen(
              onTap: () {
                bloc.add(GetUsersEvent(from: counter, isFirstCall: true));
              },
            );
          } else if (state is GetUsersLoadedState) {
            return ListView.separated(
              controller: _scrollController,
              padding: EdgeInsets.symmetric(
                horizontal: 15.w,
                vertical: 20.h,
              ),
              itemCount: usersList.length,
              separatorBuilder: (context, index) {
                return SizedBox(height: 20.h);
              },
              itemBuilder: (context, index) {
                if (index >= usersList.length - 1) {
                  return const CustomSpinner();
                }

                return UserCard(
                  imageUrl: usersList[index].avatarUrl ?? '',
                  login: usersList[index].login ?? '',
                  onTap: () => AutoRouter.of(context).push(
                    UserDetailScreenRoute(
                      username: usersList[index].login ?? '',
                    ),
                  ),
                );
              },
            );
          }
          return const UserCardShimmer();
        },
      ),
    );
  }
}
