import 'package:ahsan_dev/pages/contact_page.dart';
import 'package:ahsan_dev/pages/home_page.dart';
import 'package:ahsan_dev/pages/resume_page.dart';
import 'package:ahsan_dev/pages/work_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final GoRouter basicRoutes = GoRouter(
  routes: appRoutesList,
  initialLocation: "/",
  debugLogDiagnostics: true,
  navigatorKey: navigatorKey,
  errorBuilder: (context, state) => Center(
    child: Container(
      color: Colors.white,
      child: Text(state.error.toString()),
    ),
  ),
);
List<RouteBase> appRoutesList = [
  GoRoute(
    path: "/",
    name: "home page",
    builder: (context, state) => const PortfolioHome(),
  ),
  GoRoute(
    path: "/work",
    name: "work page",
    builder: (context, state) => const WorkPage(),
  ),
  GoRoute(
    path: "/contact",
    name: "contact page",
    builder: (context, state) => const ContactPage(),
  ),
  GoRoute(
    path: "/resume",
    name: "resume page",
    builder: (context, state) => const ResumePage(),
  ),
];
