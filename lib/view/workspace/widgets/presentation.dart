import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:muses/models/presentation.dart';

import 'package:muses/widgets/bridge/observable.dart';
import 'package:muses/widgets/bridge/reveal.dart';

class PresentationView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Presentation>(
      builder: (context, presentations, _) {
        PresentationContent slide = presentations.current();
        Widget child = Container();

        if (slide.type == PresentationType.Observable) {
          child = ObservableNotebook(notebook: slide.content,);
        }

        if(slide.type == PresentationType.Reveal) {
          child = RevealPresentation(content: slide.content);
        }

        return Container(
          child: child,
        );
      }
    );
  }
}