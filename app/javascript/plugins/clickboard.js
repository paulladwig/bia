
const copyToClipboard = () => {

  var copyTextareaBtn = document.querySelector('.copy-button');
  if (copyTextareaBtn) {
    copyTextareaBtn.addEventListener('click', function(event) {
      var copyTextarea = document.querySelector('.copy-area');
      copyTextarea.select();

      try {
        var successful = document.execCommand('copy');
        var msg = successful ? 'Copied! ' : 'Oops, unable to copy';
        console.log('Copying text command was ' + msg);
        const messageField = document.querySelector('.message-field');
        console.log(messageField);
        messageField.innerText = msg;
      } catch (err) {
        console.log('Oops, unable to copy');
      }
    });
  }
};

export {copyToClipboard};
