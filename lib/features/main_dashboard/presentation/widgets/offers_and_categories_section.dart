import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_admin_meal_time_app/features/main_dashboard/presentation/widgets/text_categories_container.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/space_widget.dart';
import 'offers_container.dart';

class OffersAndCategoriesSection extends StatelessWidget {
  const OffersAndCategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
          color: AppColors.cFCF6EE,
          child: SingleChildScrollView(
            clipBehavior: Clip.none,
            child: Column(
              children: [
                const SpaceWidget(height: 145,),
                Padding(
                  padding:  EdgeInsetsDirectional.only(end: 40.w),
                  child: const OffersContainer(),
                ),
                const SpaceWidget(height: 48,),
                Padding(
                  padding:  EdgeInsetsDirectional.only(end: 40.w),
                  child: const TextCategoriesContainer(),
                ),
                Align(
                  alignment: AlignmentDirectional.bottomEnd,
                  child: Image.asset(ImageConstants.rightBurgerImage),
                ),

              ],
            ),
          ),
        );
  }
}
