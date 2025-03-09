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

  const orderDetails = {
    hotelName: JSON.parse(sessionStorage.selected_hotel).hotel_name,
    numPersons: sessionStorage.persons_count,
    amountPerPerson: parseFloat(JSON.parse(sessionStorage.selected_hotel).price_per_person),
    specialItemsAmount: specialItemsAmount
  };

  // Calculate total amount
  const totalAmount = (orderDetails.amountPerPerson * orderDetails.numPersons) + specialItemsAmount;

  // Store the total amount in session storage
  sessionStorage.setItem('totalAmount', totalAmount);

  // Display order details
  document.getElementById('hotel-name').innerText = orderDetails.hotelName;
  document.getElementById('num-persons').innerText = orderDetails.numPersons;
  document.getElementById('amount-per-person').innerText = 'Rs. ' + orderDetails.amountPerPerson.toFixed(2);
  document.getElementById('special-items-amount').innerText = 'Rs. ' + specialItemsAmount.toFixed(2);
  document.getElementById('total-amount').innerText = 'Rs. ' + totalAmount.toFixed(2);
}

// Back button function
function goBack() {
  window.location.href = '../html/booking.html';
}

// Pay Now button function
function payNow() {
  // Redirect to payment page
  window.location.href = '../html/payment.html';
}
