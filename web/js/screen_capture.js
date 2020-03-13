window.captureScreen = async function() {
  let stream = this.undefined;

  try {
    await navigator.mediaDevices.getDisplayMedia({
      video: {
        'cursor': 'always',
      },
      audio: false
    });
  } catch(err) {
    // ignore
  }

  return stream;
}
