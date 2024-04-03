window.onload = function () {
	loadUserData();
	fetchBookingHistory();
}

function loadUserData() {
	document.getElementById('profile-name').innerText = JSON.parse(sessionStorage.user_details).user_name;
	document.getElementById('profile-mobile').innerText = JSON.parse(sessionStorage.user_details).mobile;
	document.getElementById('profile-email').innerText = JSON.parse(sessionStorage.user_details).email;
}

function fetchBookingHistory() {
	var requestData = {
		user_id: JSON.parse(sessionStorage.user_details).user_id
	};

	fetch('../php/order-history.php', {
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
			return response.json(); // Make sure to parse the response as JSON
		})
		.then(data => {
			console.log('Booking History:', data);
			loadOrderHistory(data.data);
		})
		.catch(error => {
			console.error('Error:', error);
		});
}

function reorderFromHotel(obj) {
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

function cancelOrder(obj) {
	var orderId = obj.id;
	var requestData = {
		order_id: orderId
	};
	var result = confirm("Are you sure you want to cancel this order?");

	if (result) {
		fetch('../php/order-history.php', {
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
				return response.json(); // Make sure to parse the response as JSON
			})
			.then(data => {
				console.log('Booking Status Updated:', data);
				location.reload();
			})
			.catch(error => {
				console.error('Error:', error);
			});
	}
}

function loadOrderHistory(bookingData) {
	var historyContent = '';
	for (let i = 0; i < bookingData.length; i++) {
		let order = bookingData[i];
		let status = null;
		let statusColor = null;
		
		if (order.booking_status === "0") {
			status = 'Pending';
			statusColor = 'bg-warning';
		} else if (order.booking_status === "1") {
			status = 'Completed';
			statusColor = 'bg-success';
		}
		else if (order.booking_status === "2") {
			status = 'Rejected'
			statusColor = 'bg-danger';
		}
		historyContent += 
			'<div class="bg-white card mb-4 order-list shadow-sm">' +
			'<div class="gold-members p-4">' +
			'<div class="media">' +
			'<div class="media-body">' +
			'<h6 class="text-primary mb-2">' + order.hotel_name + '</h6>' +
			'<a class="' + statusColor + ' text-white d-flex" href="#" style="width: 150px;position: absolute;right: 5%;top: 12%;justify-content: center;border-radius: 3px;"><i class="icofont-refresh"></i>' + status + '</a>' +
			'<p class="text-gray mb-3"><i class="icofont-list"></i> ORDER ID: <b>#' + order.booking_id + ' </b><i class="icofont-clock-time ml-2"></i></p>' +
			'<p class="text-gray mb-1"><i class="icofont-location-arrow"></i>No of Persons Booked: <b>' + order.num_persons + '</b></p>' +
			'<p class="text-gray mb-1"><i class="icofont-location-arrow"></i>Booked by: <b>' + order.booked_by + ' - ' + order.mobile_number + '</b></p>' +
			'<p class="text-gray">Specials: <b>' + order.special_items + '</b></p>' +
			'<hr>' +
			'<div class="float-right d-inline-flex">' +
		'<a class="btn btn-sm btn-primary" href="#" id="' + order.hotel_id + '" onclick="reorderFromHotel(this)"><i class="icofont-refresh"></i> REORDER</a>';

		if (order.booking_status != "1"&&order.booking_status != "2") {
			historyContent += '<a class="btn btn-sm btn-outline-primary ms-3" onclick="cancelOrder(this)" id="' + order.booking_id + '" href="#"><i class="icofont-headphone-alt"></i>CANCEL</a>';
		}

		historyContent +=	
			'<h5 style="position: absolute; right: 6%; margin-top: 0.5rem;">Total Paid: Rs. ' + order.total_amount + '</h5>' +
			'</div>' +
			'</div>' +
			'</div>' +
			'</div>' +
			'</div>';
	}
	document.getElementById('order-history').innerHTML = historyContent;
}