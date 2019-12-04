const mapActivationButton = () => {
  const mapButton = document.getElementById('map-btn');
  console.log(mapButton)
  const listButton = document.getElementById('list-btn');
  console.log(listButton)
  const mapShow = document.getElementById('map-container');
  console.log(mapShow)
  const listShow = document.getElementById('list-container');
  console.log(listShow)


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
