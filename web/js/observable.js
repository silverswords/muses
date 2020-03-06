import { Runtime, Inspector } from 'https://cdn.jsdelivr.net/npm/@observablehq/runtime@4/dist/runtime.js';
import { findDartElementByID } from './find.js';

window.renderObservable = async function(path) {
  const mod = await import(`https://notebook-five.now.sh/${path}.js`);
  const notebook = mod.default;

  const target = findDartElementByID('observable-view');

  if (target) {
    new Runtime().module(notebook, Inspector.into(target));
  }
}
