// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;
import 'package:flutter_starter/common/presentation/screens/home_screen.dart'
    as _i2;
import 'package:flutter_starter/common/presentation/screens/splash_screen.dart'
    as _i3;
import 'package:flutter_starter/features/contact_card/presentation/screens/contact_card_screen.dart'
    as _i1;

abstract class $AppRouter extends _i4.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    ContactCardRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<ContactCardRouteArgs>(
          orElse: () => ContactCardRouteArgs(
                  id: pathParams.getInt(
                'id',
                0,
              )));
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.ContactCardScreen(
          key: args.key,
          id: args.id,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.HomeScreen(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.SplashScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.ContactCardScreen]
class ContactCardRoute extends _i4.PageRouteInfo<ContactCardRouteArgs> {
  ContactCardRoute({
    _i5.Key? key,
    int id = 0,
    List<_i4.PageRouteInfo>? children,
  }) : super(
          ContactCardRoute.name,
          args: ContactCardRouteArgs(
            key: key,
            id: id,
          ),
          rawPathParams: {'id': id},
          initialChildren: children,
        );

  static const String name = 'ContactCardRoute';

  static const _i4.PageInfo<ContactCardRouteArgs> page =
      _i4.PageInfo<ContactCardRouteArgs>(name);
}

class ContactCardRouteArgs {
  const ContactCardRouteArgs({
    this.key,
    this.id = 0,
  });

  final _i5.Key? key;

  final int id;

  @override
  String toString() {
    return 'ContactCardRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i2.HomeScreen]
class HomeRoute extends _i4.PageRouteInfo<void> {
  const HomeRoute({List<_i4.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

/// generated route for
/// [_i3.SplashScreen]
class SplashRoute extends _i4.PageRouteInfo<void> {
  const SplashRoute({List<_i4.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}
