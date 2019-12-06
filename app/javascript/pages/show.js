const turn_dropdown_icon = () => {
  const dropdown = document.querySelector('.svg-dropdown');
};


const noteClick = (element) => {
  const form = document.getElementById('share-submit');
  if (element) {
  element.addEventListener('click', (event) => {
    form.click();
  });
  }
};

const detectShareClick = () => {
  const copyElement = document.querySelector('.copy-button');
  const fbElement = document.querySelector('.fa-facebook-f');
  const twitterElement = document.querySelector('.twitter-share-button');
  noteClick(copyElement);
  noteClick(fbElement);
  noteClick(twitterElement);
}



export {turn_dropdown_icon, detectShareClick};
