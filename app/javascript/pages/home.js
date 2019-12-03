const deactivateItems = items => {
  items.forEach(item => {
    item.classList.remove('active');
  });
};


const addLinkInNavbarToggle = () => {
  const navBarItems = document.querySelectorAll('.navbar-link');
  deactivateItems(navBarItems);
  const webPath = window.location.href.replace(/^(?:\/\/|[^\/]+)*\//, "").replace(/\/\d+/, "");
  if (webPath === "restaurants")
    navBarItems[0].classList.add('active');
  else if (webPath === "users")
    navBarItems[1].classList.add('active');
};

export {addLinkInNavbarToggle};

