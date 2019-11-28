
const copyToClipboard = () => {

  var copyTextareaBtn = document.querySelector('.copy-button');

  copyTextareaBtn.addEventListener('click', function(event) {
    var copyTextarea = document.querySelector('.copy-area');
    copyTextarea.select();

    try {
      var successful = document.execCommand('copy');
      var msg = successful ? 'successful' : 'unsuccessful';
      console.log('Copying text command was ' + msg);
    } catch (err) {
      console.log('Oops, unable to copy');
    }
  });

};

export {copyToClipboard};
