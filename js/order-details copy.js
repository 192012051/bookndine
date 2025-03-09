window.onload = function() {
	var bookingDetails = JSON.parse(sessionStorage.booking_details);
	var specialItems = JSON.parse(sessionStorage.selected_hotel_specials);
	var specialItemsAmount = 0;
	for (let i = 0; i < specialItems.length; i++) {
		let spl = specialItems[i];
		if (spl.count && spl.count > 0) {
			let splPrice = parseFloat(spl.item_price);
			specialItemsAmount += splPrice;
		}
	}

	// const orderDetails = {
	//   hotelName: JSON.parse(sessionStorage.selected_hotel).hotel_name,
	//   numPersons: sessionStorage.persons_count,
	//   amountPerPerson: JSON.parse(sessionStorage.selected_hotel).price_per_person,
	//   specialItemsAmount: specialItemsAmount
	// };

	// Calculate total amount
	// const totalAmount = bookingDetails.total_amount;

	// Display order details
	document.getElementById('hotel-name').innerText = JSON.parse(sessionStorage.selected_hotel).hotel_name;
	document.getElementById('num-persons').innerText = sessionStorage.persons_count;
	document.getElementById('amount-per-person').innerText = 'Rs. ' + JSON.parse(sessionStorage.selected_hotel).price_per_person;
	document.getElementById('special-items-amount').innerText = 'Rs. ' + specialItemsAmount;
	document.getElementById('total-amount').innerText = 'Rs. ' + bookingDetails.total_amount;
}

// Back button function
function goBack() {
	window.location.href = '../html/booking.html';
}

// Pay Now button function
function payNow() {
	window.location.href = '../html/payment.html';
}