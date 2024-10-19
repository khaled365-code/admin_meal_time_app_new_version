
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widgets/line_widget.dart';
import '../../../../core/widgets/space_widget.dart';
import '../cubits/main_dashboard_cubit/main_dashboard_cubit.dart';
import 'drawer_list_tile.dart';
import '../../../../core/utils/app_colors.dart';

class CustomDashboardDrawer extends StatelessWidget {
  const CustomDashboardDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainDashboardCubit,MainDashboardState>(
      builder: (context, state)
      {
        return Container(
            color: AppColors.white,
            child: CustomScrollView(
              slivers:
              [
                SliverFillRemaining(
                    hasScrollBody: false,
                    child: Column(
                      children: [
                        const LineWidget(
                          height: 4,
                        ),
                        const SpaceWidget(height: 24,),
                        ...MainDashboardCubit.get(context).firstDrawerDataList.asMap().entries.map((e)
                        {
                          int index=e.key;
                          return  DrawerListTile(
                              onListTileTap: ()
                              {
                                MainDashboardCubit.get(context).updateFirstDrawerListShape(currentIndex: index);
                                switch(index)
                                {
                                  case 0:
                                    MainDashboardCubit.get(context).allSystemMealsModel=null;
                                    MainDashboardCubit.get(context).allChefsData=null;
                                    break;
                                  case 1:
                                    MainDashboardCubit.get(context).allChefsData=null;
                                    MainDashboardCubit.get(context).getSystemMealsFun();
                                    break;
                                  case 2:
                                    MainDashboardCubit.get(context).allSystemMealsModel=null;
                                    MainDashboardCubit.get(context).getSystemChefsFun();
                                    break;
                                  case 3:
                                    MainDashboardCubit.get(context).allSystemMealsModel=null;
                                    MainDashboardCubit.get(context).allChefsData=null;
                                    MainDashboardCubit.get(context).getChefRequestDesign();
                                    break;
                                  case 4:
                                    MainDashboardCubit.get(context).allSystemMealsModel=null;
                                    MainDashboardCubit.get(context).allChefsData=null;
                                    MainDashboardCubit.get(context).getMealRequestDesign();
                                    break;

                                }
                              },
                              drawerDataModel: MainDashboardCubit.get(context).firstDrawerDataList[index]);
                        },),
                        const Spacer(),
                        ...List.generate(
                          MainDashboardCubit.get(context).secondDrawerDataList.length,
                              (index) => DrawerListTile(
                                drawerDataModel: MainDashboardCubit.get(context).secondDrawerDataList[index],
                                onListTileTap: ()
                                {
                                  MainDashboardCubit.get(context).updateSecondDrawerListShape(currentIndex: index);
                                  switch(index)
                                  {
                                    case 0:
                                      MainDashboardCubit.get(context).allSystemMealsModel=null;
                                      MainDashboardCubit.get(context).allChefsData=null;
                                      MainDashboardCubit.get(context).getDeleteMealDesign();
                                      break;
                                    case 1:
                                      MainDashboardCubit.get(context).allSystemMealsModel=null;
                                      MainDashboardCubit.get(context).allChefsData=null;
                                      MainDashboardCubit.get(context).getDeleteChefDesign();
                                      break;
                                    case 2:
                                      MainDashboardCubit.get(context).allSystemMealsModel=null;
                                      MainDashboardCubit.get(context).allChefsData=null;
                                      MainDashboardCubit.get(context).getLogoutDesign();
                                      MainDashboardCubit.get(context).logoutAdminFun();
                                      break;
                                  }
                                },
                              ),),
                        const SpaceWidget(height: 24,),
                      ],
                    )
                )


              ],
            )

        );
      },
    );
  }
}
