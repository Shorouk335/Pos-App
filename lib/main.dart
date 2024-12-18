import 'dart:developer';
import 'package:e_ticket_app/core/app_utils/injection.dart';
import 'package:e_ticket_app/core/app_utils/utils.dart';
import 'package:e_ticket_app/core/data_service/hive/hive.dart';
import 'package:e_ticket_app/core/router/router.dart';
import 'package:e_ticket_app/core/data_service/PrefService/prefService.dart';
import 'package:e_ticket_app/core/api_service/helper/bloc/bloc_observer.dart';
import 'package:e_ticket_app/core/theme/app_theme.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/manager/sales_cubit.dart';
import 'package:e_ticket_app/shared/widgets/responsive_framework.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await EasyLocalization.ensureInitialized();
  await PrefService.getInstance();
  await HiveService.hiveInit();
  log("////////////////////token/////////////////");
  log(HiveService.getUserToken() ?? "");
  log("////////////////////theme/////////////////");
  log(PrefService.appTheme);
  log("////////////////////itemStyle/////////////////");
  log(PrefService.itemStyle);
  await setupLocator();
  // to get local of system
  Locale locale;
  var windowLocale = WidgetsBinding.instance.platformDispatcher.locale;
  locale = Locale(windowLocale.languageCode, windowLocale.countryCode);

  runApp(
    EasyLocalization(
        supportedLocales: const [Locale('ar', 'EG'), Locale('en', 'US')],
        startLocale: locale,
        saveLocale: false,
        fallbackLocale: const Locale('ar', 'EG'),
        path: 'assets/translations',
        child: const ETicketApp()),
  );
}

class ETicketApp extends StatefulWidget {
  const ETicketApp({super.key});

  @override
  State<ETicketApp> createState() => _ETicketAppState();

  static _ETicketAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<_ETicketAppState>();
}

class _ETicketAppState extends State<ETicketApp> with WidgetsBindingObserver {
  late ThemeMode _themeMode;

  @override
  void initState() {
    super.initState();
    _themeMode = PrefService.appTheme == "dark" ? ThemeMode.dark : ThemeMode.light ; 
    WidgetsBinding.instance.addObserver(this);
  }

  // when change local language in system
  @override
  void didChangeLocales(List<Locale>? locales) {
    if (locales!.isNotEmpty) {
      EasyLocalization.of(context)!.setLocale(locales.first);
    }

    super.didChangeLocales(locales);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  void changeTheme(ThemeMode themeMode) {
    setState(() {
      _themeMode = themeMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    // to set state all child
    Utils.rebuildAllChildren(context);

    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (BuildContext context) => SalesCubit())
        ],
        child: MaterialApp.router(
          title: 'ETicketApp',
          debugShowCheckedModeBanner: false,
          routeInformationParser: AppRouter.goRoute.routeInformationParser,
          routeInformationProvider: AppRouter.goRoute.routeInformationProvider,
          routerDelegate: AppRouter.goRoute.routerDelegate,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          builder: (context, child) {
            final smartDialog = FlutterSmartDialog.init();
            child = smartDialog(context, child);
            return ResponsiveWrapper(child: child);
          },
          theme: ThemeManager.lightTheme(),
          darkTheme: ThemeManager.darkTheme(),
          themeMode: _themeMode,
        ));
  }
}
