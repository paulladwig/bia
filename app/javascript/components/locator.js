const locate_user = () => {
  const set_location = (data) => {
    const latitude_field = document.querySelector('#latitude-hidden');
    const longitude_field = document.querySelector('#longitude-hidden');
    if (latitude_field && longitude_field) {
      longitude_field.value = data.coords.longitude;
      latitude_field.value = data.coords.latitude;
      console.log("user long " + longitude_field.value);
      console.log("user lat " + latitude_field.value);
      const searchLocation = document.querySelector("#search_location");
      // if (searchLocation) {
      //   searchLocation.value =
      // }
    }
    //localhost:3000/geocoder
    // fetch(rails_api_url, {
    //   method: 'POST',
    //   body: JSON.stringify({lat: data.coords.longitude, long: data.coords.longitude})
    // })
    //   .then(response)
    //   .then( data => address.value = data.address)
  }

  navigator.geolocation.getCurrentPosition(set_location);

}



export {locate_user};
