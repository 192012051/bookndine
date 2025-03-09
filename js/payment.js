window.onload = function () {
	if (sessionStorage.getItem('booking_details') === null || sessionStorage.getItem('payment_done') === ('true' || true)) {
		var alertDiv = document.createElement('div');
		alertDiv.className = 'p-2';
		alertDiv.style.width = '100%';
		alertDiv.style.display = 'flex';
		alertDiv.style.position = 'absolute';
		alertDiv.style.zIndex = '999';
		alertDiv.style.justifyContent = 'center';

		alertDiv.innerHTML = `
			<div class="row" style="width: 30%;">
			  <div class="col-lg-12 m-auto">
				<div class="alert alert-danger animated slideInDown show" role="alert">
				  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
					<span aria-hidden="True">&times;</span>
				  </button>
				  <h4 class="alert-heading">Payment done already.</h4>
				  <p>Place a new order.</p>
				</div>
			  </div>
			</div>
		  `;
		document.body.prepend(alertDiv);
		if (!document.getElementById('payment-box').classList.contains('d-none')) {
			document.getElementById('payment-box').classList.add('d-none');
		}
		if (document.getElementById('payment-goback').classList.contains('d-none')) {
			document.getElementById('payment-goback').classList.remove('d-none');
		}
	}
}

function selectPaymentMethod(obj, option) {
	var paymentOptions = obj.parentElement.parentElement.childNodes;
	paymentOptions.forEach(removeActive);
	obj.classList.add('active');
	document.getElementById('credit-card').classList.remove('show', 'active');
	document.getElementById('paypal').classList.remove('show', 'active');
	document.getElementById('net-banking').classList.remove('show', 'active');
	if (option === 1) {
		document.getElementById('credit-card').classList.add('show', 'active');
	} else if (option === 2) {
		document.getElementById('paypal').classList.add('show', 'active');
	} else if (option === 3) {
		document.getElementById('net-banking').classList.add('show', 'active');
	}
}

function confirmPayment(event) {
    event.preventDefault();
    var bookingDetails = JSON.parse(sessionStorage.getItem('booking_details'));
    var totalAmount = parseFloat(sessionStorage.getItem('totalAmount')); // Retrieve total amount from sessionStorage

    // Add total amount to the booking details
    bookingDetails.total_amount = totalAmount;

    fetch('../php/booking.php', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify(bookingDetails),
    })
    .then(response => {
        if (!response.ok) {
            throw new Error('Network response was not ok');
        }
        return response.json(); // Parse response as JSON
    })
    .then(data => {
        console.log(data); // Log response
        if (data.success) {
            alert('Payment success');
            window.location.href = 'index.html'; // Redirect to another page
        } else {
            alert('Payment failed: ' + data.error); // Alert for failure
        }
    })
    .catch(error => {
        console.error('Error:', error);
        // Handle error scenarios
    });
}



function removeActive(option) {
	if (option.classList && option.classList.contains('nav-item')) {
		var child = option.childNodes;
		for (let i = 0; i < child.length; i++) {
			if (child[i].classList && child[i].classList.contains('nav-link')) {
				child[i].classList.remove('active');
			}
		}
	}
}

function goHome() {
	sessionStorage.setItem('payment_done', false);
	var userDetail = sessionStorage.getItem('user_details');
	sessionStorage.clear();
	sessionStorage.setItem('user_details', userDetail);
	window.location.href = '../html/index.html';
}