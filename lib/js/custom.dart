import 'dart:js';

void callMethodDefinedInDart() {
  context['funnyWay'] = () {
    print('method defined in dart executed');
    return 100;
  };

  context.callMethod('callMethodDefinedInDart');
}

void callRenderObservable() {
  Future.delayed(const Duration(milliseconds: 200), () {
    context.callMethod('renderObservable');
  });
}