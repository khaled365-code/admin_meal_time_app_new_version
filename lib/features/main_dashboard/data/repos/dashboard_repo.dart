

import 'package:dartz/dartz.dart';
import '../../../../core/database/errors/error_model.dart';
import '../models/all_system_meals_model/all_system_meals_model.dart';
import '../models/chefs_data/all_chefs_data_model.dart';

abstract class DashBoardRepo
{
  Future<Either<ErrorModel,AllSystemMealsModel>>getAllSystemMeals();
  Future<Either<ErrorModel,AllChefsDataModel>>getAllSystemChefs();
  Future<Either<ErrorModel,String>>dealWithChefRequest({required String chefId,required String status});
  Future<Either<ErrorModel,String>>dealWithMealRequest({required String mealId,required String status});
  Future<Either<ErrorModel,String>>deleteMeal({required String mealId});
  Future<Either<ErrorModel,String>>deleteChef({required String chefId});
  Future<Either<ErrorModel,String>>adminLogout();



}