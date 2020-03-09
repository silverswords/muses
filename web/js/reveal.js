import { findDartElementByID } from './find.js';

import { loadRevealResetCSS } from './reveal-reset.js';
import { loadRevealCSS } from './reveal-reveal.js';
import { loadRevealThemeCSS } from './reveal-theme.js';
import { loadRevealHightlightingCSS } from './reveal-highlighting.js';

window.renderRevealPresentation = function(content) {
  const target = findDartElementByID('reveal-presentation-view');
  if (!target) {
      console.log('reveal presentation view not found');
      return;
  }

  target.innerHTML = `
    <div class="reveal">
        <!-- Any section element inside of this container is displayed as a slide -->
        <div class="slides">
        </div>
    </div>
  `;

  loadRevealResetCSS(target);
  loadRevealCSS(target);
  loadRevealThemeCSS(target);
  loadRevealHightlightingCSS(target);

  const container = target.querySelector('.reveal');
  const slides = container.querySelector('.slides');
  slides.innerHTML = content;

  Reveal.initialize({
    container: container,
    controls: true,
    progress: true,
    center: true,
    hash: true,
    transition: 'slide', // none/fade/slide/convex/concave/zoom
    // More info https://github.com/hakimel/reveal.js#dependencies
    dependencies: [
      // { src: '/reveal/plugin/markdown/marked.js', condition: function() { return !!target.querySelector( '[data-markdown]' ); } },
      // { src: '/reveal/plugin/markdown/markdown.js', condition: function() { return !!target.querySelector( '[data-markdown]' ); } },
      { src: '/reveal/plugin/highlight/highlight.js', type: 'module' },
      { src: '/reveal/plugin/zoom-js/zoom.js', async: true },
      { src: '/reveal/plugin/notes/notes.js', async: true }
    ]
  });
}
