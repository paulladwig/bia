const closeWindow = (window) => {
  window.style.display="none";
}

const recommendation_modal = () => {
  const modal = document.getElementById('recommend-modal');
  const openBtn = document.getElementById('open-modal');
  if (openBtn && modal) {
    const closeBtn = document.querySelector('.modal-close');
    openBtn.addEventListener('click', (event) => {
      modal.style.display="block";
    });
    closeBtn.addEventListener('click', (event) => {
      closeWindow(modal);
    });
    window.addEventListener('click', (event) => {
      if (event.target == modal) {
      closeWindow(modal);
      }
    })
  }
};

export { recommendation_modal}

