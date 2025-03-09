window.onload = function () {
	var hotelDetails = JSON.parse(sessionStorage.getItem('selected_hotel'));
	var selectedHotelName = hotelDetails.hotel_name;
	var selectedHotelAddress = hotelDetails.address;
	var selectedHotelCost = hotelDetails.price_per_person;
	// var selectedHotelSpecials = JSON.parse(sessionStorage.getItem('selected_hotel_specials'));

	// Display the selected hotel name in the 'hotel-name' div
	var hotelNameElement = document.getElementById('hotel-name');
	var hotelAddressElement = document.getElementById('hotel-address');
	var hotelCostElement = document.getElementById('hotel-cost');
	if (selectedHotelName && selectedHotelAddress && selectedHotelCost) {
		hotelNameElement.innerText = selectedHotelName;
		hotelAddressElement.innerText = 'Location: ' + selectedHotelAddress;
		hotelCostElement.innerText = 'Rs. ' + selectedHotelCost + '/ Person';
		getHotelDetailsFromServer(hotelDetails.hotel_id);
		showPopUp(sessionStorage.getItem('item_removed'));
	} else {
	   hotelNameElement.innerText = 'No hotel selected';
	 }
}

function showPopUp(isRemoved) {
	if (isRemoved == null || undefined) {
		return;
	}
	var alertDiv = document.createElement('div');
	alertDiv.className = 'p-2';
	alertDiv.style.width = '86%';
	alertDiv.style.display = 'flex';
	alertDiv.style.position = 'absolute';
	alertDiv.style.zIndex = '9999';
	alertDiv.style.justifyContent = 'center';
	
	if (isRemoved == ('true' || true)) {
		alertDiv.innerHTML = `
			<div class="row" style="width: 30%;">
			  <div class="col-lg-12 m-auto">
				<div class="alert alert-success animated slideInDown show" role="alert">
				  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
					<span aria-hidden="True">&times;</span>
				  </button>
				  <h4 class="alert-heading">Item Removed!</h4>
				  <p>Your special item is removed.</p>
				</div>
			  </div>
			</div>
		  `;
	} else if (isRemoved == ('false' || false)) {
		alertDiv.innerHTML = `
			<div class="row" style="width: 30%;">
			  <div class="col-lg-12 m-auto">
				<div class="alert alert-success animated slideInDown show" role="alert">
				  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
					<span aria-hidden="True">&times;</span>
				  </button>
				  <h4 class="alert-heading">Menu updated!</h4>
				  <p>Your special items are added.</p>
				</div>
			  </div>
			</div>
		  `;
	}
	sessionStorage.setItem('item_removed', null);
	document.getElementById('food-menu').prepend(alertDiv);
}

function showSpecialsForm() {
	document.getElementById('form-body').classList.remove('d-none');
}

function selectSplCount() {
	document.getElementById('spl-forms').classList.remove('d-none');
	var count = parseInt(document.getElementById('select1').value);
	var htmlContent = '';
	for (let i = 1; i < count + 1; i++) {
		htmlContent +=
			'<div id="added-specials-' + i + '" class="mt-4" style="padding: 10px; border: 1px solid antiquewhite; border-radius: 10px;">' +
			'<p class="mb-0">Special Item ' + i + '</p>' +
			'<div class="col-md-12">' +
			'<input class="form-control" id="spl-name' + i + '" type="text" name="username" placeholder="Item Name" required>' +
			'<div class="invalid-feedback">Item name cannot be blank!</div>' +
			'</div>' +
			'<div class="col-md-12">' +
			'<input class="form-control" id="spl-price' + i + '" type="tel" maxlength="4" name="mobile" placeholder="Item Price"" pattern="[0-9]{1,4}" title="Item Price" required>' +
			'<div class="invalid-feedback">Enter a valid price within Rs.9999</div>' +
			'</div>' +
			'<div class="col-md-12">' +
			'<input class="form-control" id="spl-desc' + i + '" type="text" name="username" placeholder="Item Description" required>' +
			'<div class="invalid-feedback">Description cannot be blank!</div>' +
			'</div>' +
			'</div>';
	}
	document.getElementById('spl-forms').innerHTML = htmlContent;
	document.getElementById('add-spl').classList.remove('d-none');
}

document.addEventListener('DOMContentLoaded', function () {
	var forms = document.querySelectorAll('.requires-validation');
	forms.forEach(function (form) {
		form.addEventListener('submit', function (event) {
			if (!form.checkValidity()) {
				event.preventDefault();
				event.stopPropagation();
			}
			form.classList.add('was-validated');
		}, false);
	});
});

function goToSpecials () {
	window.location = '#food-menu';
}

function loadMenu(specialDishes) {
	// var specialDishes = JSON.parse(sessionStorage.getItem('selected_hotel_specials'));
	var specialMenuContent = '';
	if (specialDishes.length > 0) {
        specialMenuContent += '<h5 class="section-title text-center py-4 mb-4" style="font-size: xx-large; color: black; font-weight: 700;">Restaurant Specials</h5>' +
            '<div class="row g-4">';
        for (let i = 0; i < specialDishes.length; i++) {
            let food = specialDishes[i];
            specialMenuContent +=
				'<div class="col-lg-6 mt-3">' +
				'<div class="d-flex align-items-center">' +
				'<img class="flex-shrink-0 img-fluid rounded" src="../img/menu-1.jpg" alt="" style="width: 80px;">' +
				'<div class="w-100 d-flex flex-column text-start ps-4">' +
				'<h5 class="d-flex justify-content-start border-bottom pb-2" style="font-size: larger;">' +
				'<span>' + food.item_name + ' - Rs. ' + food.item_price + '</span>' +
                '<div class="number d-flex justify-content-end">' +
                '<button class="btn btn-danger btn-sm" id="' + food.special_item_id + '" onclick="removeItem(this)">Remove</button>' +
                '</div>' +
                '</h5>' +
				'<small class="fst-italic">' + food.item_description + '</small>' +
                '</div>' +
                '</div>' +
                '</div>';
        }
        specialMenuContent += '</div>';
    }
	document.getElementById('spcl-items-tab').innerHTML = specialMenuContent;
}

function getHotelDetailsFromServer(hotelId) {
	var xhr = new XMLHttpRequest();
	xhr.onreadystatechange = function () {
		if (xhr.readyState === 4) {
			if (xhr.status === 200) {
				var selectedHotel = JSON.parse(xhr.responseText);
				sessionStorage.setItem('selected_hotel', JSON.stringify(selectedHotel.hotel_details));
				sessionStorage.setItem('selected_hotel_specials', JSON.stringify(selectedHotel.special_items));
				loadMenu(selectedHotel.special_items);
			} else {
				console.error('Error: ' + xhr.status);
			}
		}
	};

	// Include hotelId in the URL
	xhr.open('GET', '../php/index.php?hotelId=' + encodeURIComponent(hotelId), true);
	xhr.send();
}

function getSpecialItemsArray() {
	var count = parseInt(document.getElementById('select1').value);
	var specialItemsArray = [];

	for (let i = 1; i < count + 1; i++) {
		var itemName = document.getElementById('spl-name' + i).value;
		var itemPrice = document.getElementById('spl-price' + i).value;
		var itemDesc = document.getElementById('spl-desc' + i).value;

		// Validate if all fields are filled
		if (itemName && itemPrice && itemDesc) {
			var specialItem = {
				item_name: itemName,
				item_price: parseFloat(itemPrice), // Assuming item_price is a decimal in your database
				item_description: itemDesc
			};

			specialItemsArray.push(specialItem);
		} else {
			console.error('Error: All fields are required for special item ' + i);
		}
	}

	return specialItemsArray;
}

function addSpecialItems() {
	event.preventDefault();
	var hotelId = JSON.parse(sessionStorage.getItem('selected_hotel')).hotel_id;
	var specialItems = getSpecialItemsArray();
	var requestData = {
		insert: true,
		hotel_id: hotelId,
		special_items: specialItems
	};

	fetch('../php/edit-menu.php', {
		method: 'POST',
		headers: {
			'Content-Type': 'application/json',
		},
		body: JSON.stringify(requestData),
	})
		.then(response => {
			if (!response.ok) {
				throw new Error('Network response was not ok');
			}
			return response.json();
		})
		.then(data => {
			console.log('Special Items Added:', data);
			sessionStorage.setItem('item_removed', false);
			location.reload(true);
		})
		.catch(error => {
			console.error('Error:', error);
		});
}

function removeItem(button) {
	var specials = JSON.parse(sessionStorage.getItem('selected_hotel_specials'));
	if (specials.length <= 2) {
		alert('Hotel must have minimum 2 special items.');
		return;
	}
	var result = confirm("Are you sure you want to remove this item?");
	if (result) {
		var requestData = {
			delete: true,
			special_item_id: button.id
		};
	
		fetch('../php/edit-menu.php', {
			method: 'POST',
			headers: {
				'Content-Type': 'application/json',
			},
			body: JSON.stringify(requestData),
		})
			.then(response => {
				if (!response.ok) {
					throw new Error('Network response was not ok');
				}
				return response.json();
			})
			.then(data => {
				console.log('Special Item Removed:', data);
				sessionStorage.setItem('item_removed', true);
				location.reload(true);
			})
			.catch(error => {
				console.error('Error:', error);
			});
	}
}