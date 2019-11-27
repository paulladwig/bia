const recommendation_modal = () => {
  const modal = document.getElementById('recommend-modal');
  const openBtn = document.getElementById('open-modal');
  const closeBtn = document.querySelector('.modal-close');
  openBtn.addEventListener('click', (event) => {
    modal.style.display="block";
  });
};

export { recommendation_modal}

