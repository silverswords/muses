export function findDartElementByID(id) {
  const platformViews = document.querySelectorAll('flt-platform-view')

  for (let i = 0; i < platformViews.length; i++) {
    const pView = platformViews[i];
    const shadow = pView.shadowRoot;

    if (shadow == undefined) {
      continue
    }

    for(let i = 0; i < shadow.childNodes.length; i++) {
      console.log(i + '  ' + shadow.childNodes[i].id)
      if (shadow.childNodes[i].id == 'observable-view') {
        return shadow.childNodes[i];
      }
    }
  }

  return undefined
}