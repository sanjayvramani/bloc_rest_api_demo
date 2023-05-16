import 'package:bloc_rest_api_demo/bloc_observer/app_bloc_observer.dart';
import 'package:bloc_rest_api_demo/services/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'pages/myapp/myapp.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  setUp();
  Bloc.observer =  AppBlocObserver();

  runApp( MyApp());
}

