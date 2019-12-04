const mapActivationButton = () => {
  const mapButton = document.getElementById('map-btn');
  const listButton = document.getElementById('list-btn');
  const mapShow = document.getElementById('map-container');
  const listShow = document.getElementById('list-container');


  if (mapButton) {
    mapButton.addEventListener('click', (event) => {
      mapShow.classList.toggle("hidden");
      listShow.classList.toggle("hidden");
      mapButton.classList.toggle("hidden");
      listButton.classList.toggle("hidden");
    });

    listButton.addEventListener('click', (event) => {
      mapShow.classList.toggle("hidden");
      listShow.classList.toggle("hidden");
      mapButton.classList.toggle("hidden");
      listButton.classList.toggle("hidden");
    });
  }
}
export {mapActivationButton};
