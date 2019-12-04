const deactivateItems = items => {
  items.forEach(item => {
    item.classList.remove('active');
  });
};


const addLinkInNavbarToggle = () => {
  const navBarItems = document.querySelectorAll('.navbar-link');
  deactivateItems(navBarItems);
  const userPage = document.getElementById('profile-user');
  const webPath = window.location.href.replace(/^(?:\/\/|[^\/]+)*\//, "");
  console.log(webPath);
  if (webPath === "restaurants") {
    navBarItems[0].classList.add('active');
  }
  else if (userPage.dataset.user === "true"){
    console.log('hello');
    navBarItems[1].classList.add('active');
  }
};

export {addLinkInNavbarToggle};

