const autoSubmit = () => {
  const autoForm = document.querySelector('#autosubmit-form');
  if (autoForm) {
    // const searchQuery = document.querySelector("#search_query");
    // const searchLocation = document.querySelector("#search_location");
    // const searchRange = document.querySelector("#search_range");
    function loadForm() {
      event.preventDefault();
      const searchCuisine = document.querySelector("#loading-page-screen");
      searchCuisine.classList.remove("hidden");
      setTimeout(function () {
        searchCuisine.classList.add("hidden");
        }, 600);
      console.log({searchCuisine});
    }
    const searchCuisine = document.querySelector("#search_cuisine");
    const occasion1 = document.querySelector("#search_occasion_1");
    const occasion2 = document.querySelector("#search_occasion_2");
    const occasion3 = document.querySelector("#search_occasion_3");
    const occasion4 = document.querySelector("#search_occasion_4");
    const price1 = document.querySelector("#search_price_1");
    const price2 = document.querySelector("#search_price_2");
    const price3 = document.querySelector("#search_price_3");
    const price4 = document.querySelector("#search_price_4");
    const checkBox = [occasion1, occasion2, occasion3, occasion4, price1, price2, price3, price4, searchCuisine];
    // const textField = [searchQuery, searchLocation, searchRange];


    for(var i = 0; i < checkBox.length; i++) {
      checkBox[i].addEventListener("change", reSubmit(i));
    }

    // checkbox.forEach(checkbox => checkbox.addEventListener('change', reSubmit))
    // for(var i = 0; i < textField.length; i++) {
    //   textField[i].addEventListener("blur", reSubmit(i));
    // }

    function reSubmit(i) {
      return function() {
        const filterSubmit =document.querySelector('#filter-submit');
        loadForm();
        filterSubmit.click();
      };
    };
    const filterSubmitButton = document.querySelector('#filter-submit');
    autoForm.addEventListener("submit", loadForm);
  }
}

export {autoSubmit};
