import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/auth/presentation/cubits/login_cubit/login_cubit.dart';
import '../../features/auth/presentation/views/admin_login_screen.dart';
import '../../features/main_dashboard/presentation/cubits/categories_cubit/categories_cubit.dart';
import '../../features/main_dashboard/presentation/cubits/main_dashboard_cubit/main_dashboard_cubit.dart';
import '../../features/main_dashboard/presentation/views/main_dashboard_screen.dart';
import '../injection/injector.dart';
import 'admin_routes.dart';

class AdminRouter
{


  static Route? generateAppRoutes(RouteSettings routeSettings)
  {
    switch (routeSettings.name)
    {
      case AdminRoutes.adminLoginScreen:
        return MaterialPageRoute(builder: (context) =>
            BlocProvider(
              create: (context) => serviceLocator<LoginCubit>(),
              child: const AdminLoginScreen(),
            ),
            settings: routeSettings);
      case AdminRoutes.mainDashboardScreen:
        return MaterialPageRoute(builder: (context) =>
        MultiBlocProvider(
        providers:
        [
          BlocProvider(create: (context) => serviceLocator<MainDashboardCubit>(),),
          BlocProvider(create: (context) => serviceLocator<CategoriesCubit>(),),
        ],
        child: const MainDashboardScreen()),);

      default:
        return MaterialPageRoute(builder: (context) => Scaffold(body: SafeArea(child: Center(child: Text('No route defined')))));
    }
  }


}