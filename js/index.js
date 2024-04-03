 
window.onload = function () {
  var userName = JSON.parse(sessionStorage.getItem('user_details')).user_name;
  document.getElementById('welcome-user').innerText = 'Welcome ' + userName;
   
  // Load hotels based on the selected location
  var selectedLocation = sessionStorage.getItem('location');
  if (selectedLocation) {
    loadHotelsForLocation(selectedLocation);
  }
}

function getRandomNumber(min, max, excludedNumbers) {
  let randomNum;
  do {
    randomNum = Math.floor(Math.random() * (max - min + 1)) + min;
  } while (excludedNumbers.includes(randomNum));
  return randomNum;
}

function selectLocation() {
  var location = document.getElementById('mySelect').value;
  sessionStorage.setItem('location', location);

  // Load hotels for the selected location
  loadHotelsForLocation(location);
  document.getElementById('location-hotels').style.display = 'block';
}

function loadHotelsForLocation(location) {
  var xhr = new XMLHttpRequest();
  xhr.onreadystatechange = function () {
    if (xhr.readyState === 4) {
      if (xhr.status === 200) {
        var hotelsForLocation = JSON.parse(xhr.responseText);
        var numOfHotels = hotelsForLocation.hotels.length;
        var selectedNumbers = [];

        for (let i = 0; i < numOfHotels; i++) {
          const randomNumber = getRandomNumber(1, 48, selectedNumbers);
          selectedNumbers.push(randomNumber);
        }

        var htmlContent = '';
        for (var i = 0; i < hotelsForLocation.hotels.length; i++) {
          var hotelDetail = hotelsForLocation.hotels[i];
          htmlContent +=
            '<div class="row p-2 bg-white border rounded my-3">' +
            '<div class="col-md-3 mt-1"><img class="img-fluid img-responsive rounded product-image" src="../img/hotelsImg/hotel' + selectedNumbers[i] + '.jpg"></div>' +
            '<div class="col-md-6 mt-4">' +
            '<h5>' + hotelDetail.hotel_name + '</h5>' +
            '<div class="d-flex flex-row">' +
            '<div class="ratings mr-2"> '+
            '</div><span></span>' +
            '</div>' +
            '<p class="text-justify text-truncate para mb-0">' + hotelDetail.address + '<br><br></p>' +
            '</div>' +
            '<div class="align-items-center align-content-center col-md-3 border-left mt-1">' +
            '<div class="d-flex flex-row align-items-center mt-3">' +
            '<h4 class="mr-1"> Rs. ' + hotelDetail.price_per_person + '</h4>' +
            '</div>' +
            '<div class="d-flex flex-row align-items-center mt-3">' +
            '<h4 class="mr-1"> Table Available: ' + hotelDetail.table_count + '</h4>' +
            '</div>' +
            '<div class="d-flex flex-column mt-2">' +
            '<button class="btn btn-outline-primary btn-sm" id="' + hotelDetail.hotel_id + '" type="button" onclick="getHotelDetailsFromServer(this)">Book Table</button>' +
          
            '</div>' +
            '</div>' +
            '</div>';
        }
        document.getElementById('popular-location-title').innerText = 'Restraunts in ' + location;
        document.getElementById('hotel-list').innerHTML = htmlContent;
        window.location = '#popular-location-title';

      } else {
        console.error('Error: ' + xhr.status);
      }
    }
  };

  xhr.open('GET', '../php/index.php?location=' + encodeURIComponent(location), true);
  xhr.send();
}

function getHotelDetailsFromServer(obj) {
  var hotelId = obj.id;
  var xhr = new XMLHttpRequest();

  xhr.onreadystatechange = function () {
    if (xhr.readyState === 4) {
      if (xhr.status === 200) {
        var selectedHotel = JSON.parse(xhr.responseText);
        sessionStorage.setItem('selected_hotel', JSON.stringify(selectedHotel.hotel_details));
        sessionStorage.setItem('selected_hotel_specials', JSON.stringify(selectedHotel.special_items));
        window.location.href = 'hoteldescription.html';
      } else {
        console.error('Error: ' + xhr.status);
      }
    }
  };

  // Include hotelId in the URL
  xhr.open('GET', '../php/index.php?hotelId=' + encodeURIComponent(hotelId), true);
  xhr.send();
}

