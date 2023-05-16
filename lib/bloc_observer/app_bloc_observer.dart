
import 'package:bloc_rest_api_demo/services/app_display_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../services/locator.dart';

class AppBlocObserver extends BlocObserver
{
  final AppDisplayService _appDisplayService = locator<AppDisplayService>();
  @override
  void onCreate(BlocBase bloc) {
    // TODO: implement onCreate
    super.onCreate(bloc);
    _appDisplayService.showMessage(data: 'onCreate bloc:$bloc');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    // TODO: implement onEvent
    super.onEvent(bloc, event);

    _appDisplayService.showMessage(data: 'bloc:$bloc \n event:$event');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    // TODO: implement onTransition
    super.onTransition(bloc, transition);

     _appDisplayService.showMessage(data: 'bloc:$bloc \n transition:$transition');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    // TODO: implement onChange
    super.onChange(bloc, change);
    _appDisplayService.showMessage(data: 'bloc:$bloc \n change:$change');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    // TODO: implement onError
    super.onError(bloc, error, stackTrace);
    _appDisplayService.showMessage(data: 'bloc:$bloc \n error:$error \n stackTrace: $stackTrace');
  }

  @override
  void onClose(BlocBase bloc) {
    // TODO: implement onClose
    super.onClose(bloc);
    _appDisplayService.showMessage(data: 'onClosed bloc:$bloc');
  }

}