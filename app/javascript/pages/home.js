const deactivateItems = items => {
  items.forEach(item => {
    item.classList.remove('active');
  });
};


const addLinkInNavbarToggle = () => {
  const navBarItems = document.querySelectorAll('.navbar-link');
  deactivateItems(navBarItems);
  const webPath = window.location.href.replace(/^(?:\/\/|[^\/]+)*\//, "");
  console.log(webPath);
  console.log(navBarItems);
  if (webPath === "discover")
    navBarItems[0].classList.add('active');
  else if (webPath === "restaurants")
    navBarItems[1].classList.add('active');
};

export {addLinkInNavbarToggle};

