import 'package:provider/single_child_widget.dart';

///
/// author: hefei
/// time  : 2020/12/29
/// desc  :
///
List<SingleChildWidget> providers = [
  ...independentServices,
  ...dependentServices,
  ...uiConsumableProviders
];

///
/// 独立的model
///
List<SingleChildWidget> independentServices = [];

///
///需要依赖的model
///
List<SingleChildWidget> dependentServices = [];

///
/// UI刷新的model
///
List<SingleChildWidget> uiConsumableProviders = [];
