import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:freemium/App/AppLocalizations.dart';
import 'package:freemium/Core/Consts.dart';
import 'package:freemium/Model/Communities/Communities.dart';
import 'package:freemium/UI/Address.dart/Address.dart';
import 'package:freemium/UI/Home/Home.dart';
import 'package:freemium/UI/Profile/Profile.dart';
import 'package:freemium/UI/Registeration/bloc/signup_bloc.dart';
import 'package:freemium/UI/Sign_in/SignIn.dart';
import 'package:freemium/UI/VerificationCode/VerificationCode.dart';

class App extends StatefulWidget {
  App({Key key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  FlutterLocalNotificationsPlugin fltNotification =
      FlutterLocalNotificationsPlugin();
  String payload;
  String onmessageinfo;

  @override
  void initState() {
    initMessaging();
    register();
    notitficationPermission();

    getToken();
    notificationshandlers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(375, 812),
        builder: () => BlocProvider(
            create: (context) => SignupBloc(),
            child: MaterialApp(
              supportedLocales: [
                Locale('en', 'US'),
                Locale('ar', 'AR'),
              ],
              // These delegates make sure that the localization data for the proper language is loaded
              localizationsDelegates: [
                // THIS CLASS WILL BE ADDED LATER
                // A class which loads the translations from JSON files
                AppLocalizations.delegate,
                // Built-in localization of basic text for Material widgets
                GlobalMaterialLocalizations.delegate,
                // Built-in localization for text direction LTR/RTL
                GlobalWidgetsLocalizations.delegate,
              ],
              // Returns a locale which will be used by the app
              localeResolutionCallback: (locale, supportedLocales) {
                // Check if the current device locale is supported
                for (var supportedLocale in supportedLocales) {
                  if (supportedLocale.languageCode == locale.languageCode &&
                      supportedLocale.countryCode == locale.countryCode) {
                    return supportedLocale;
                  }
                }
                // If the locale of the device is not supported, use the first one
                // from the list (English, in this case).
                return supportedLocales.first;
              },

              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                textButtonTheme: new TextButtonThemeData(
                  style: TextButton.styleFrom(
                      primary: Colors.grey,
                      textStyle: TextStyle(fontSize: 16.sp)),
                ),
                timePickerTheme: TimePickerThemeData(
                  backgroundColor: AppColor.container,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  hourMinuteShape: CircleBorder(),
                ),
                textTheme: TextTheme(button: TextStyle(fontSize: 41.sp)),
              ),

              builder: (context, widget) {
                return MediaQuery(
                  //Setting font does not change with system font size
                  data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                  child: widget,
                );
              },

              home: Home(),
            )));
  }

  void register() {
    messaging.getToken().then((token) async {
      // String tokenn = (token);

      // PrefsHelper prefsHelper = PrefsHelper();
      // await prefsHelper.settoken(tokenn);
    });
  }

  void getToken() async {
    print(await messaging.getToken());
  }

  void showNotification(String title, String body) async {
    var androidDetails =
        AndroidNotificationDetails('1', 'channelName', 'channel Description');

    var iosDetails = IOSNotificationDetails();

    var generalNotificationDetails =
        NotificationDetails(android: androidDetails, iOS: iosDetails);

    await fltNotification.show(1, title, body, generalNotificationDetails,
        payload: payload);
  }

  void notitficationPermission() async {
    // ignore: unused_local_variable
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
  }

  Future<void> initMessaging() async {
    var androiInit = AndroidInitializationSettings('@mipmap/ic_launcher');

    var iosInit = IOSInitializationSettings();

    var initSetting = InitializationSettings(android: androiInit, iOS: iosInit);

    fltNotification = FlutterLocalNotificationsPlugin();
    FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    await fltNotification.initialize(initSetting,
        onSelectNotification: selectNotification);
  }

  void notificationshandlers() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("here from the messgae");
      print(message.data.values.toList());

      showNotification(message.notification.title, message.notification.body);
      print("here after the show function");
    });

    messaging.getInitialMessage().then((RemoteMessage message) async {
      if (message != null) {
        print(message);
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen(
      (RemoteMessage message) async {
        print('A new onMessageOpenedApp event was published!');
        print("here from o messgae");
        print(message.data.values.toList());

        // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
      },
    );
  }
}

Future selectNotification(String payload) async {
  print("here from select");
  print(payload);
}
