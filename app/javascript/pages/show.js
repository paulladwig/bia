

const turn_dropdown_icon = () => {
  const dropdown = document.querySelector('.svg-dropdown');
  console.log(dropdown);
};


const noteClick = () => {

};

const detectShareClick = () => {
  const copyElement = document.querySelector('.copy-button');
  const fbElement = document.querySelector('.fa-facebook-f');
  const twitterElement = document.querySelector('.twitter-share-button');
  console.log(copyElement);
  console.log(fbElement);
  console.log(twitterElement);
  noteClick(copyElement);
  noteClick(fbElement);
  noteClick(twitterElement);
}



export {turn_dropdown_icon, detectShareClick};
