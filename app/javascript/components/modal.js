const closeWindow = (window) => {
  window.style.display="none";
}

const recommendation_modal = () => {
  const modal = document.getElementById('recommend-modal');
  const openBtn = document.getElementById('open-modal');
  const openAut = document.getElementById('new-true');
  if (openBtn && modal || openAut && modal) {
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
  if (openAut) {
    modal.style.display="block"
  }
};

const share_modal = () => {
  const modal = document.getElementById('share-modal');
  const openBtn = document.getElementById('open-share-modal');
  if (openBtn && modal) {
    const closeBtn = document.querySelector('.share-modal-close');
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

export { recommendation_modal, share_modal}




