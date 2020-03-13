window.captureScreen = function() {
  return navigator.mediaDevices.getDisplayMedia({
    video: {
      'cursor': 'always',
    },
    audio: false
  });
}
