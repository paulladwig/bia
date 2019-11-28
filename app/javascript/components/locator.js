const locate_user = () => {
  const set_location = (data) => {
    const latitude_field = document.querySelector('#latitude-hidden');
    const longitude_field = document.querySelector('#longitude-hidden');
    if (latitude_field && longitude_field) {
      longitude_field.value = data.coords.longitude;
      latitude_field.value = data.coords.latitude;
    }
    console.log("user long " + longitude_field.value);
    console.log("user lat " + latitude_field.value);
    // console.log(data.coords.longitude);
    // console.log(data.coords.latitude);

    // console.log(longitude_field.value);
    // console.log(latitude_field.value);
    // console.log(longitude_field);
    // console.log(latitude_field);
  }

  navigator.geolocation.getCurrentPosition(set_location);
}



export {locate_user};
