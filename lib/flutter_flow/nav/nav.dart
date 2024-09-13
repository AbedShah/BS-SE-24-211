import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';

import '/auth/base_auth_user_provider.dart';

import '/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? const LoginPageWidget() : const EntryPageWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? const LoginPageWidget() : const EntryPageWidget(),
        ),
        FFRoute(
          name: 'LoginPage',
          path: '/loginPage',
          builder: (context, params) => const LoginPageWidget(),
        ),
        FFRoute(
          name: 'profilePageOwner',
          path: '/profilePageOwner',
          requireAuth: true,
          builder: (context, params) => const ProfilePageOwnerWidget(),
        ),
        FFRoute(
          name: 'RegisterPage',
          path: '/registerPage',
          builder: (context, params) => const RegisterPageWidget(),
        ),
        FFRoute(
          name: 'ReportAndContactPage',
          path: '/reportAndContactPage',
          requireAuth: true,
          builder: (context, params) => const ReportAndContactPageWidget(),
        ),
        FFRoute(
          name: 'ForgetPasswordPage',
          path: '/forgetPasswordPage',
          builder: (context, params) => const ForgetPasswordPageWidget(),
        ),
        FFRoute(
          name: 'EntryPage',
          path: '/entryPage',
          builder: (context, params) => const EntryPageWidget(),
        ),
        FFRoute(
          name: 'profilePageRenter',
          path: '/profilePageRenter',
          requireAuth: true,
          asyncParams: {
            'carr': getDoc(['CarsForRent'], CarsForRentRecord.fromSnapshot),
          },
          builder: (context, params) => ProfilePageRenterWidget(
            carr: params.getParam(
              'carr',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'profilePageAdmin',
          path: '/profilePageAdmin',
          requireAuth: true,
          builder: (context, params) => const ProfilePageAdminWidget(),
        ),
        FFRoute(
          name: 'HomePage',
          path: '/homePage',
          requireAuth: true,
          builder: (context, params) => const HomePageWidget(),
        ),
        FFRoute(
          name: 'RentDeatils1',
          path: '/rentDeatils1',
          requireAuth: true,
          asyncParams: {
            'carr': getDoc(['CarsForRent'], CarsForRentRecord.fromSnapshot),
          },
          builder: (context, params) => RentDeatils1Widget(
            carr: params.getParam(
              'carr',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'UsersList',
          path: '/usersList',
          requireAuth: true,
          builder: (context, params) => const UsersListWidget(),
        ),
        FFRoute(
          name: 'EditProfileForAdmin',
          path: '/editProfileForAdmin',
          requireAuth: true,
          asyncParams: {
            'user': getDoc(['Users1'], Users1Record.fromSnapshot),
          },
          builder: (context, params) => EditProfileForAdminWidget(
            user: params.getParam(
              'user',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'AddCarFinal',
          path: '/addCarFinal',
          requireAuth: true,
          builder: (context, params) => const AddCarFinalWidget(),
        ),
        FFRoute(
          name: 'ManageMyCars',
          path: '/manageMyCars',
          requireAuth: true,
          builder: (context, params) => const ManageMyCarsWidget(),
        ),
        FFRoute(
          name: 'SuccessOrder',
          path: '/successOrder',
          requireAuth: true,
          builder: (context, params) => SuccessOrderWidget(
            funds: params.getParam(
              'funds',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: 'ManageCarsAdmin',
          path: '/manageCarsAdmin',
          requireAuth: true,
          builder: (context, params) => const ManageCarsAdminWidget(),
        ),
        FFRoute(
          name: 'MyOrdersRenter',
          path: '/myOrdersRenter',
          requireAuth: true,
          builder: (context, params) => const MyOrdersRenterWidget(),
        ),
        FFRoute(
          name: 'MyOrdersOwner',
          path: '/myOrdersOwner',
          requireAuth: true,
          builder: (context, params) => const MyOrdersOwnerWidget(),
        ),
        FFRoute(
          name: 'MyOrdersAdmin',
          path: '/myOrdersAdmin',
          requireAuth: true,
          builder: (context, params) => const MyOrdersAdminWidget(),
        ),
        FFRoute(
          name: 'Rules',
          path: '/rules',
          requireAuth: true,
          builder: (context, params) => const RulesWidget(),
        ),
        FFRoute(
          name: 'LuxuryCars',
          path: '/luxuryCars',
          requireAuth: true,
          builder: (context, params) => const LuxuryCarsWidget(),
        ),
        FFRoute(
          name: 'PrivateCars',
          path: '/privateCars',
          requireAuth: true,
          builder: (context, params) => const PrivateCarsWidget(),
        ),
        FFRoute(
          name: 'WeddingCars',
          path: '/weddingCars',
          requireAuth: true,
          builder: (context, params) => const WeddingCarsWidget(),
        ),
        FFRoute(
          name: 'Agreement',
          path: '/agreement',
          requireAuth: true,
          asyncParams: {
            'car2': getDoc(['CarsForRent'], CarsForRentRecord.fromSnapshot),
          },
          builder: (context, params) => AgreementWidget(
            car2: params.getParam(
              'car2',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'OrderDetailsOwner',
          path: '/orderDetailsOwner',
          requireAuth: true,
          asyncParams: {
            'order': getDoc(['MyOrders'], MyOrdersRecord.fromSnapshot),
          },
          builder: (context, params) => OrderDetailsOwnerWidget(
            order: params.getParam(
              'order',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'FamilyCars',
          path: '/familyCars',
          requireAuth: true,
          builder: (context, params) => const FamilyCarsWidget(),
        ),
        FFRoute(
          name: 'OrderDetailsAdmin',
          path: '/orderDetailsAdmin',
          requireAuth: true,
          asyncParams: {
            'order': getDoc(['MyOrders'], MyOrdersRecord.fromSnapshot),
          },
          builder: (context, params) => OrderDetailsAdminWidget(
            order: params.getParam(
              'order',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'Reports',
          path: '/reports',
          requireAuth: true,
          builder: (context, params) => const ReportsWidget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/entryPage';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => const TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
