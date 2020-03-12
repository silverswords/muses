import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'package:muses/models/workspace.dart';
import 'package:muses/models/presentation.dart';

List<SingleChildWidget> providers() {
  return [
    ChangeNotifierProvider(
      create: (_) => WorkspaceStatus(),
    ),
    ChangeNotifierProvider(
      create: (_) => Presentation(),
    ),
  ];
}
