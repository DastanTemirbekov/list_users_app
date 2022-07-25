import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:list_users_app/components/all_shimmers/user_detail_shimmer.dart';
import 'package:list_users_app/components/custom_cached_network_image.dart';
import 'package:list_users_app/components/custom_flushBar.dart';
import 'package:list_users_app/components/error_screen.dart';
import 'package:list_users_app/constants/color_helper.dart';
import 'package:list_users_app/generated/l10n.dart';
import 'package:list_users_app/screens/user_detail_screen/bloc/user_detail_bloc.dart';

class UserDetailScreen extends StatefulWidget {
  final String username;

  const UserDetailScreen({Key? key, required this.username}) : super(key: key);

  @override
  State<UserDetailScreen> createState() => _UserDetailScreenState();
}

class _UserDetailScreenState extends State<UserDetailScreen> {
  late UserDetailBloc bloc;

  @override
  void initState() {
    bloc = UserDetailBloc();
    bloc.add(GetUserDetailEvent(username: widget.username));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        title: Text(S.of(context).detailInfo),
        backgroundColor: ThemeHelper.appBarColor,
      ),
      body: BlocConsumer<UserDetailBloc, UserDetailState>(
        bloc: bloc,
        listener: (context, state) {
          if (state is GetUserDetailErrorState) {
            Exceptions.showFlushbar(
              state.error.message.toString(),
              context: context,
            );
          }
        },
        builder: (context, state) {
          if (state is GetUserDetailLoadingState) {
            return const UserDetailShimmer();
          } else if (state is GetUserDetailErrorState) {
            return ErrorScreen(
              onTap: () {
                bloc.add(GetUserDetailEvent(username: widget.username));
              },
            );
          } else if (state is GetUserDetailLoadedState) {
            return SizedBox(
              height: 1.sh,
              width: 1.sw,
              child: Column(
                children: [
                  SizedBox(height: 60.h),
                  CustomCachedNetworkImage(
                    imageUrl: state.model.avatarUrl ?? '',
                    height: 100,
                  ),
                  SizedBox(height: 20.h),
                  Text(state.model.name!),
                  Container(
                    color: Colors.brown[100],
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 50.h),
                        Container(
                          width: 0.9.sw,
                          decoration: BoxDecoration(
                            color: Colors.yellow[100],
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          child: DataTable(
                            columns: [
                              DataColumn(
                                label: Text(S.of(context).name),
                              ),
                              DataColumn(
                                label: Text(S.of(context).value),
                              )
                            ],
                            rows: [
                              DataRow(
                                cells: [
                                  DataCell(
                                    Text(S.of(context).type),
                                  ),
                                  DataCell(
                                    Text(state.model.type!),
                                  ),
                                ],
                              ),
                              DataRow(
                                cells: [
                                  DataCell(
                                    Text(S.of(context).location),
                                  ),
                                  DataCell(
                                    Text(state.model.location!),
                                  ),
                                ],
                              ),
                              DataRow(
                                cells: [
                                  DataCell(
                                    Text(S.of(context).company),
                                  ),
                                  DataCell(
                                    Text(state.model.company!),
                                  ),
                                ],
                              ),
                              DataRow(
                                cells: [
                                  DataCell(
                                    Text(S.of(context).followers),
                                  ),
                                  DataCell(
                                    Text(
                                      state.model.followers.toString(),
                                    ),
                                  ),
                                ],
                              ),
                              DataRow(
                                cells: [
                                  DataCell(
                                    Text(S.of(context).twitter),
                                  ),
                                  DataCell(
                                    Text(
                                      state.model.twitterUsername!,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
          return const UserDetailShimmer();
        },
      ),
    );
  }
}
