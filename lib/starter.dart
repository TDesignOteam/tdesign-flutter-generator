import 'package:vm/aop.dart';

import 'hook/demo_transformer.dart';

/// 请在start函数中注册Transformer
///
/// compileTarget
/// * frontend_server: Android/iOS、web-dev-run
/// * dart2js: web profile/release
///
/// isInteractiveRecompilation:
/// * true: web-dev-run，hot-restart...
void start(List<String> args, String compileTarget, bool isInteractiveRecompilation){
  AOPMarket.registerTransformers(DemoTransformer());
}