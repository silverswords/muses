import 'package:flutter/material.dart';

import 'package:muses/widgets/bridge/observable.dart';
import 'package:muses/widgets/bridge/reveal.dart';

class WorkspaceView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: 40,
            color: Colors.purple,
            child: _statusBarBuilder()
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.transparent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: _mainViewBuilder(),
                  ),
                ],
              )
            ),
          ),
          Container(
            height: 40,
            color: Colors.blueAccent,
            child: _toolsBarBuilder(),
          ),
        ],
      ),
    );
  }

  Widget _statusBarBuilder() {
    return Center(
      child: Text('状态栏/通知栏')
    );
  }

  Widget _toolsBarBuilder() {
    return Center(
      child: Text('工具栏')
    );
  }

  Widget _mainViewBuilder() {
    const markdown = '''
      <section data-markdown>
        <script type="text/template">
          ## Markdown support

          Write content using inline or external Markdown.
          Instructions and more info available in the [readme](https://github.com/hakimel/reveal.js#markdown).

          ```
          <section data-markdown>
            ## Markdown support

            Write content using inline or external Markdown.
            Instructions and more info available in the [readme](https://github.com/hakimel/reveal.js#markdown).
          </section>
          ```
        </script>
      </section>
    ''';

    return Container(
      // child: ObservableNotebook(notebook: '@fengyfei/trigonometric-functions'),
      child: RevealPresentation(content: markdown),
    );
  }
}