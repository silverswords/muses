window.blobArrayBuffer = async function(blob) {
  return await blob.arrayBuffer();
}

window.captureScreen = function() {
  return navigator.mediaDevices.getDisplayMedia({
    video: {
      'cursor': 'always',
    },
    audio: false
  });
}
