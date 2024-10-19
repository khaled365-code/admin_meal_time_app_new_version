

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/space_widget.dart';
import '../cubits/main_dashboard_cubit/main_dashboard_cubit.dart';
import '../widgets/chef_data_container.dart';
import '../widgets/chef_request_widget.dart';
import '../widgets/chef_shimmer_container.dart';
import '../widgets/delete_chef_widget.dart';
import '../widgets/delete_meal_widget.dart';
import '../widgets/logout_design_widget.dart';
import '../widgets/meal_container_item.dart';
import '../widgets/banner_container_widget.dart';
import '../widgets/custom_dashboard_drawer.dart';
import '../widgets/dashboard_app_bar.dart';
import '../widgets/meal_request_widget.dart';
import '../widgets/meal_shimmer_container.dart';
import '../widgets/offers_and_categories_section.dart';

class MainDashboardScreen extends StatelessWidget {
  const MainDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cFCF6EE,
      body: SafeArea(
          child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child:  DashboardAppBar(),
          ),
          SliverFillRemaining(
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Expanded(
                        flex: 2,
                          child: CustomDashboardDrawer()),
                      Container(
                        color: AppColors.cFCF6EE,
                        width: 40.w,
                      ),
                      Expanded(
                        flex: 5,
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 45.h),
                                  child: const BannerContainerWidget(),
                                ),
                                BlocBuilder<MainDashboardCubit, MainDashboardState>(
                                  builder: (context, state)
                                {
                                  if(state is GetAllChefsLoadingState)
                                   {
                                     return Column(
                                         crossAxisAlignment: CrossAxisAlignment.start,
                                         children: [
                                           const SpaceWidget(height: 72,),
                                           Text('Please wait',
                                             style: AppTextStyles.bold23(context).copyWith(
                                                 color: AppColors.c07143B
                                             ),),
                                           const SpaceWidget(height: 64,),
                                           GridView.builder(
                                             shrinkWrap: true,
                                             physics: const NeverScrollableScrollPhysics(),
                                             itemCount: 10,
                                             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                               crossAxisCount: 2,
                                               crossAxisSpacing: 40,
                                               mainAxisSpacing: 40,
                                               mainAxisExtent: 290,
                                             ),
                                             itemBuilder: (context, index) =>
                                                 const ChefShimmerContainer(),),
                                           const SpaceWidget(height: 72,),
                                         ]);
                                   }
                                  if(MainDashboardCubit.get(context).allChefsData!=null)
                                    {

                                      return Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            const SpaceWidget(height: 72,),
                                            Text('All Chefs',
                                              style: AppTextStyles.bold23(context).copyWith(
                                                  color: AppColors.c07143B
                                              ),),
                                            const SpaceWidget(height: 64,),
                                            GridView.builder(
                                              shrinkWrap: true,
                                              physics: const NeverScrollableScrollPhysics(),
                                              itemCount: MainDashboardCubit.get(context).allChefsData!.chefs!.length,
                                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 2,
                                                crossAxisSpacing: 25,
                                                mainAxisSpacing: 40,
                                                mainAxisExtent: 300,
                                              ),
                                              itemBuilder: (context, index) =>
                                              GestureDetector(
                                                onTap: ()
                                                {
                                                  MainDashboardCubit.get(context).updateChefIndex(index: index);
                                                },
                                                child: ChefDataContainer(
                                                  containerIsSelected: MainDashboardCubit.get(context).currentChefIndex==index,
                                                  chefsData: MainDashboardCubit.get(context).allChefsData!.chefs![index],
                                                ),
                                              )),
                                            const SpaceWidget(height: 72,),



                                          ]);
                                    }
                                  if(state is GetAllMealsLoadingState)
                                    {
                                      return Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            const SpaceWidget(height: 72,),
                                            Text('Please wait',
                                              style: AppTextStyles.bold23(context).copyWith(
                                                  color: AppColors.c07143B
                                              ),),
                                            const SpaceWidget(height: 250,),
                                            GridView.builder(
                                              shrinkWrap: true,
                                              physics: const NeverScrollableScrollPhysics(),
                                              itemCount: 10,
                                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 2,
                                                crossAxisSpacing: 50,
                                                mainAxisSpacing: 110,
                                                mainAxisExtent: 300,
                                              ),
                                              itemBuilder: (context, index) =>
                                                  const MealShimmerContainer(),),
                                            const SpaceWidget(height: 72,),



                                          ]);
                                    }
                                  if(MainDashboardCubit.get(context).allSystemMealsModel!=null)
                                    {
                                      return Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            const SpaceWidget(height: 72,),
                                            Text('All Meals',
                                              style: AppTextStyles.bold23(context).copyWith(
                                                  color: AppColors.c07143B
                                              ),),
                                            const SpaceWidget(height: 250,),
                                            GridView.builder(
                                              padding: EdgeInsetsDirectional.zero,
                                              shrinkWrap: true,
                                              physics: const NeverScrollableScrollPhysics(),
                                              itemCount: MainDashboardCubit.get(context).allSystemMealsModel!.meals!.length,
                                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 2,
                                                crossAxisSpacing: 50,
                                                mainAxisSpacing: 110,
                                                mainAxisExtent: 300,
                                              ),
                                              itemBuilder: (context, index) =>
                                                  GestureDetector(
                                                    onTap: ()
                                                    {
                                                      MainDashboardCubit.get(context).updateSelectedMeal(index: index);
                                                    },
                                                    child: MealContainerItem(
                                                      mealImage: MainDashboardCubit.get(context).mealsImages[index],
                                                      containerISSelected: MainDashboardCubit.get(context).currentMealIndex==index,
                                                      systemMeals:MainDashboardCubit.get(context).allSystemMealsModel!.meals![index],
                                                    ),
                                                  ),),
                                            const SpaceWidget(height: 72,),



                                          ]);
                                    }
                                  if(state is PerformChefRequestDesignState ||
                                      state is DealWithChefRequestFailureState ||
                                      state is DealWithChefRequestSuccessState ||
                                      state is DealWithChefRequestLoadingState)
                                    {
                                      return const ChefRequestWidget();
                                    }
                                  if(state is PerformMealRequestDesignState ||
                                      state is DealWithMealRequestLoadingState ||
                                      state is DealWithMealRequestFailureState || state is DealWithMealRequestSuccessState)
                                  {
                                    return const MealRequestWidget();
                                  }
                                  if(state is GetDeleteMealDesignState ||
                                      state is DeleteMealLoadingState ||
                                      state is DeleteMealFailureState ||
                                      state is DeleteMealSuccessState)
                                    {
                                      return const DeleteMealWidget();
                                    }
                                  if(state is GetDeleteChefDesignState ||
                                      state is DeleteChefLoadingState ||
                                      state is DeleteChefFailureState ||
                                      state is DeleteChefSuccessState)
                                  {
                                    return const DeleteChefWidget();
                                  }
                                  if(state is GetLogoutDesignState ||
                                      state is AdminLogoutFailureState ||
                                      state is AdminLogoutSuccessState ||
                                      state is AdminLogoutLoadingState)
                                  {
                                    return const LogoutDesignWidget();
                                  }
                                  else
                                    {
                                      return SizedBox.shrink();
                                    }
                                },)

                              ],
                            ),
                          )),
                      Container(
                        width: 40.w,
                        color: AppColors.cFCF6EE,
                      ),
                      const Expanded(
                          flex: 3,
                          child:OffersAndCategoriesSection()),
                    ],
                  ),
                ),
              ],
            ),
          ),

        ],
      )),
    );
  }
}


