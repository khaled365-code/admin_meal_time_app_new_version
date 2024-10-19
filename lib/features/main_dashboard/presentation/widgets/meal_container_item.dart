

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/space_widget.dart';
import '../../data/models/all_system_meals_model/meals.dart';

class MealContainerItem extends StatefulWidget {
  const MealContainerItem({super.key, required this.systemMeals, required this.containerISSelected, required this.mealImage,});

  final SystemMeals systemMeals;
  final bool containerISSelected;
  final String mealImage;

  @override
  State<MealContainerItem> createState() => _MealContainerItemState();
}

class _MealContainerItemState extends State<MealContainerItem> {

  bool chefDataIsSelected=false;

  @override
  Widget build(BuildContext context) {

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          decoration: BoxDecoration(
            color: widget.containerISSelected==true?AppColors.primaryColor:AppColors.white,
            borderRadius: BorderRadius.circular(24.r),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: chefDataIsSelected==false?
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children:
              [
                const SpaceWidget(height: 280,),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(widget.systemMeals.name!,style: AppTextStyles.semiBold16(context).copyWith(
                      color: widget.containerISSelected==true?AppColors.white:AppColors.c07143B
                  )),
                ),
                const SpaceWidget(height: 8,),
                Text(
                  maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    widget.systemMeals.description!,style: AppTextStyles.regular13(context).copyWith(
                    color: widget.containerISSelected==true?AppColors.white:AppColors.c959895
                )),
                const SpaceWidget(height: 24,),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text('Id : ${widget.systemMeals.id!}',style: AppTextStyles.regular13(context).copyWith(
                      color: widget.containerISSelected==true?AppColors.white:AppColors.cEA6A12
                  )),
                ),
                const SpaceWidget(height: 8,),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text('status : ${widget.systemMeals.status!} Meal',style: AppTextStyles.regular13(context).copyWith(
                      color:  widget.containerISSelected==true?AppColors.white:AppColors.primaryColor
                  )),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: ()
                  {
                    chefDataIsSelected=true;
                    setState(() {
                    });
                  },
                  child: Row(
                    children: [
                      Text('chef details',style: AppTextStyles.regular15(context).copyWith(
                          color:  widget.containerISSelected==true?AppColors.white:AppColors.primaryColor
                      )),
                      const Spacer(),
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color:  widget.containerISSelected==true?AppColors.white:AppColors.primaryColor,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(6),
                          child: SvgPicture.asset(ImageConstants.viewAllNextIcon,colorFilter: ColorFilter.mode(widget.containerISSelected==true?AppColors.primaryColor:AppColors.white, BlendMode.srcIn),),
                        ),
                      )
                    ],
                  ),
                ),
                const SpaceWidget(height: 96,),
              ],
            ):
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children:
              [
                const SpaceWidget(height: 280,),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(widget.systemMeals.chefId!.name!,style: AppTextStyles.semiBold16(context).copyWith(color: widget.containerISSelected==true?AppColors.white:AppColors.c07143B)),
                ),
                const SpaceWidget(height: 8,),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(widget.systemMeals.chefId!.email!,style: AppTextStyles.regular13(context).copyWith(
                      color: widget.containerISSelected==true?AppColors.white:AppColors.c959895
                  )),
                ),
                const SpaceWidget(height: 24,),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: AlignmentDirectional.centerStart,
                  child: Text('Phone : ${widget.systemMeals.chefId!.phone!}',style: AppTextStyles.regular13(context).copyWith(
                      color:  widget.containerISSelected==true?AppColors.white:AppColors.primaryColor
                  )),
                ),
                const SpaceWidget(height: 8,),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: AlignmentDirectional.centerStart,
                  child: Text('Chef id : ${widget.systemMeals.chefId!.id!}',style: AppTextStyles.regular13(context).copyWith(
                      color:  widget.containerISSelected==true?AppColors.white:AppColors.primaryColor
                  )),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: ()
                  {
                    setState(() {
                      chefDataIsSelected=false;
                    });
                  },
                    child: Text(
                          'Hide chef details',
                          style: AppTextStyles.regular15(context).copyWith(
                              color: widget.containerISSelected == true ? AppColors.white : AppColors.primaryColor),
                        ),
                      ),
                const SpaceWidget(height: 96,),
              ],
            ),
          ),
        ),
        PositionedDirectional(
          top: -70,
          start: 70,
          end: 70,
          child: Container(
              width: 140,
              height: 140,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(image: AssetImage(widget.mealImage),fit: BoxFit.cover,),
              ),
            ),
        )
      ],
    );

  }
}
