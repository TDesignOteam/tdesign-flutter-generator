import 'package:kernel/ast.dart';

class NodeUtils {
  static const String kAnnotationClass = 'Demo';
  static String kImportUri =
      'package:tdesign_flutter_example/annotation/demo.dart';

  /// @Demo 目标类
  static Expression? checkIfClassEnable(List<Expression> annotations) {
    if (annotations.isEmpty)  {
      return null;
    }

    for (var annotation in annotations) {
      //注解有ConstantExpression和ConstructorInvocation两种形式
      if (annotation is ConstantExpression) {
        final constantExpression = annotation;
        final constant = constantExpression.constant;
        if (constant is InstanceConstant) {
          final instanceConstant = constant;
          final Class instanceClass = instanceConstant.classNode;
          //@Demo注解
          if (instanceClass.name == kAnnotationClass && kImportUri == (instanceClass?.parent as Library)?.importUri.toString()) {
            return constantExpression;
          }
        }
      } else if (annotation is ConstructorInvocation) {
        // final constructorInvocation = annotation;
        // final TreeNode? cls = constructorInvocation.targetReference.node?.parent;
        // if (cls !is Class) {
        //   continue;
        // }
        // final Library? library = cls?.parent;
        // if (cls.name == kAnnotationClass &&
        //     kImportUri == library.importUri.toString()) {
        //   return annotation;
        // }

        final ConstructorInvocation constructorInvocation = annotation;
        final Class cls = constructorInvocation.target.parent as Class;
        final Library library = cls.parent as Library;
        if (cls.name == kAnnotationClass && kImportUri == library.importUri.toString()) {
          return annotation;
        }
      }
    }
    return null;
  }
}
