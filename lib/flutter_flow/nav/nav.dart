import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/auth/base_auth_user_provider.dart';

import '/index.dart';
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
          appStateNotifier.loggedIn ? const TimyWidget() : const AuthentificationWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => appStateNotifier.loggedIn
              ? const TimyWidget()
              : const AuthentificationWidget(),
        ),
        FFRoute(
          name: 'Authentification',
          path: '/authentification',
          builder: (context, params) => const AuthentificationWidget(),
        ),
        FFRoute(
          name: 'CreateAccountTimy',
          path: '/createAccountTimy',
          builder: (context, params) => const CreateAccountTimyWidget(),
        ),
        FFRoute(
          name: 'LoginAccountCaretaker',
          path: '/loginAccountCaretaker',
          builder: (context, params) => const LoginAccountCaretakerWidget(),
        ),
        FFRoute(
          name: 'CreateAccountCaretaker',
          path: '/createAccountCaretaker',
          builder: (context, params) => const CreateAccountCaretakerWidget(),
        ),
        FFRoute(
          name: 'LoginAccountTimy',
          path: '/loginAccountTimy',
          builder: (context, params) => const LoginAccountTimyWidget(),
        ),
        FFRoute(
          name: 'Timy',
          path: '/timy',
          builder: (context, params) => const TimyWidget(),
        ),
        FFRoute(
          name: 'CareTaker',
          path: '/careTaker',
          builder: (context, params) => const CareTakerWidget(),
        ),
        FFRoute(
          name: 'Games',
          path: '/games',
          builder: (context, params) => const GamesWidget(),
        ),
        FFRoute(
          name: 'Communication',
          path: '/communication',
          builder: (context, params) => const CommunicationWidget(),
        ),
        FFRoute(
          name: 'Timemanagement',
          path: '/timemanagement',
          builder: (context, params) => const TimemanagementWidget(),
        ),
        FFRoute(
          name: 'Feelings',
          path: '/feelings',
          builder: (context, params) => const FeelingsWidget(),
        ),
        FFRoute(
          name: 'TimyAccount',
          path: '/timyAccount',
          builder: (context, params) => const TimyAccountWidget(),
        ),
        FFRoute(
          name: 'CareTakerAccount',
          path: '/careTakerAccount',
          builder: (context, params) => const CareTakerAccountWidget(),
        ),
        FFRoute(
          name: 'AddEvent',
          path: '/addEvent',
          builder: (context, params) => const AddEventWidget(),
        ),
        FFRoute(
          name: 'Statistics',
          path: '/statistics',
          builder: (context, params) => const StatisticsWidget(),
        ),
        FFRoute(
          name: 'Happy',
          path: '/happy',
          builder: (context, params) => const HappyWidget(),
        ),
        FFRoute(
          name: 'Angry',
          path: '/angry',
          builder: (context, params) => const AngryWidget(),
        ),
        FFRoute(
          name: 'Calm',
          path: '/calm',
          builder: (context, params) => const CalmWidget(),
        ),
        FFRoute(
          name: 'Balance',
          path: '/balance',
          builder: (context, params) => const BalanceWidget(),
        ),
        FFRoute(
          name: 'Playfull',
          path: '/playfull',
          builder: (context, params) => const PlayfullWidget(),
        ),
        FFRoute(
          name: 'Loved',
          path: '/loved',
          builder: (context, params) => const LovedWidget(),
        ),
        FFRoute(
          name: 'Blessed',
          path: '/blessed',
          builder: (context, params) => const BlessedWidget(),
        ),
        FFRoute(
          name: 'Donotknow',
          path: '/donotknow',
          builder: (context, params) => const DonotknowWidget(),
        ),
        FFRoute(
          name: 'Sad',
          path: '/sad',
          builder: (context, params) => const SadWidget(),
        ),
        FFRoute(
          name: 'Chess',
          path: '/chess',
          builder: (context, params) => const ChessWidget(),
        ),
        FFRoute(
          name: 'build',
          path: '/build',
          builder: (context, params) => const BuildWidget(),
        ),
        FFRoute(
          name: 'Cooking',
          path: '/cooking',
          builder: (context, params) => const CookingWidget(),
        ),
        FFRoute(
          name: 'Poppingbubbles',
          path: '/poppingbubbles',
          builder: (context, params) => const PoppingbubblesWidget(),
        ),
        FFRoute(
          name: 'Puzzle',
          path: '/puzzle',
          builder: (context, params) => const PuzzleWidget(),
        ),
        FFRoute(
          name: 'Drawing',
          path: '/drawing',
          builder: (context, params) => const DrawingWidget(),
        ),
        FFRoute(
          name: 'music',
          path: '/music',
          builder: (context, params) => const MusicWidget(),
        ),
        FFRoute(
          name: 'Youtube',
          path: '/youtube',
          builder: (context, params) => const YoutubeWidget(),
        ),
        FFRoute(
          name: 'Books',
          path: '/books',
          builder: (context, params) => const BooksWidget(),
        ),
        FFRoute(
          name: 'Communicationcare',
          path: '/communicationcare',
          builder: (context, params) => const CommunicationcareWidget(),
        ),
        FFRoute(
          name: 'Spotthedif',
          path: '/spotthedif',
          builder: (context, params) => const SpotthedifWidget(),
        ),
        FFRoute(
          name: 'Memorygame',
          path: '/memorygame',
          builder: (context, params) => const MemorygameWidget(),
        ),
        FFRoute(
          name: 'CallTimy',
          path: '/callTimy',
          builder: (context, params) => const CallTimyWidget(),
        ),
        FFRoute(
          name: 'AutismHowtoraiseahappyautisticchild',
          path: '/autismHowtoraiseahappyautisticchild',
          builder: (context, params) =>
              const AutismHowtoraiseahappyautisticchildWidget(),
        ),
        FFRoute(
          name: 'TenThingsEveryChildwithAutismWishesYouKnew',
          path: '/tenThingsEveryChildwithAutismWishesYouKnew',
          builder: (context, params) =>
              const TenThingsEveryChildwithAutismWishesYouKnewWidget(),
        ),
        FFRoute(
          name: 'Differentnotless',
          path: '/differentnotless',
          builder: (context, params) => const DifferentnotlessWidget(),
        ),
        FFRoute(
          name: 'Themagicofinclusion',
          path: '/themagicofinclusion',
          builder: (context, params) => const ThemagicofinclusionWidget(),
        ),
        FFRoute(
          name: 'AllBirdsHaveAnxiety',
          path: '/allBirdsHaveAnxiety',
          builder: (context, params) => const AllBirdsHaveAnxietyWidget(),
        ),
        FFRoute(
          name: 'LifeWithLaurenAnOdysseyintoAutism',
          path: '/lifeWithLaurenAnOdysseyintoAutism',
          builder: (context, params) =>
              const LifeWithLaurenAnOdysseyintoAutismWidget(),
        ),
        FFRoute(
          name: 'ThinkinginPicturesExpandedEditionMyLifewithAutism',
          path: '/thinkinginPicturesExpandedEditionMyLifewithAutism',
          builder: (context, params) =>
              const ThinkinginPicturesExpandedEditionMyLifewithAutismWidget(),
        ),
        FFRoute(
          name: 'AddTimy',
          path: '/addTimy',
          builder: (context, params) => const AddTimyWidget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
      observers: [routeObserver],
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
    ..addAll(queryParameters)
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
      (state.extraMap.length == 1 &&
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
    ParamType type, [
    bool isList = false,
    List<String>? collectionNamePath,
  ]) {
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
    return deserializeParam<T>(param, type, isList,
        collectionNamePath: collectionNamePath);
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
            appStateNotifier.setRedirectLocationIfUnset(state.location);
            return '/authentification';
          }
          return null;
        },
        pageBuilder: (context, state) {
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: Colors.transparent,
                  child: Image.asset(
                    'assets/images/Untitled_Artwork_(1).png',
                    fit: BoxFit.cover,
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder: PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).transitionsBuilder,
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
    final location = GoRouter.of(context).location;
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}
