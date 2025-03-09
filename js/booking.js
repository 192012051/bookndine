window.onload = function () {
    var hotelDetails = JSON.parse(sessionStorage.getItem('selected_hotel'));

    var hotelName = hotelDetails ? hotelDetails.hotel_name : '';
    document.getElementById('hotel-name').innerText = 'Restaurant Name : ' + hotelName;

    // Adding persons to total amount
    let persons = parseInt(document.getElementById('select1').value);
    sessionStorage.setItem('persons_count', persons);
    // let personsCost = persons * parseFloat(JSON.parse(sessionStorage.selected_hotel).price_per_person);
    // let total = parseFloat(sessionStorage.getItem('total_amount')) + personsCost;
    // sessionStorage.setItem('total_amount', total);

    // Setting special items
    let specialItemDBData = '';
    let specialItemArray = JSON.parse(sessionStorage.selected_hotel_specials);
    for (let i = 0; i < specialItemArray.length; i++) {
        let spl = specialItemArray[i];
        if (spl.count && spl.count > 0) {
            specialItemDBData += spl.item_name + ' x ' + spl.count;
            if (i === specialItemArray.length - 1) {
                return;
            } else {
                specialItemDBData += ', '
            }
        }
    }
    sessionStorage.setItem('special_items', specialItemDBData);
}

function setPersons() {
    let persons = parseInt(document.getElementById('select1').value);
    sessionStorage.setItem('persons_count', persons);
}

function validateAndSubmit() {
    if (!validateInput('fullname', 'Name cannot be blank!')) return;
    if (!validateInput('number', 'Mobile number cannot be blank!')) return;
    if (!validateInput('datetime', 'Date cannot be blank!')) return;
    if (!validateSelect('select1', 'Please select the number of people!')) return;
    if (!validateRadio('booking_time', 'Please select a time!')) return;
    if (!validateInput('message', 'Special Request cannot be blank!')) return;

    captureFormData();
}

function validateInput(inputId, errorMessage) {
    var input = document.getElementById(inputId);
    if (input.value.trim() === '') {
        alert(errorMessage);
        return false;
    }
    return true;
}

function validateSelect(selectId, errorMessage) {
    var select = document.getElementById(selectId);
    if (select.value === '0') {
        alert(errorMessage);
        return false;
    }
    return true;
}

function validateRadio(radioName, errorMessage) {
    var radioInputs = document.querySelectorAll('input[name="' + radioName + '"]');
    var isRadioSelected = Array.from(radioInputs).some(input => input.checked);
    if (!isRadioSelected) {
        alert(errorMessage);
        return false;
    }
    return true;
}

function captureFormData() {
    var user_id = JSON.parse(sessionStorage.getItem('user_details')).user_id;
    var hotel_id = JSON.parse(sessionStorage.selected_hotel).hotel_id;
    var special_items = sessionStorage.getItem('special_items');
    var hotel_name = JSON.parse(sessionStorage.getItem('selected_hotel')).hotel_name;
    var total_amount = parseFloat(sessionStorage.getItem('total_amount')) + (parseInt(sessionStorage.getItem('persons_count')) * parseFloat(JSON.parse(sessionStorage.selected_hotel).price_per_person));
    var form = document.getElementById("bookingForm");
    var formData = new FormData(form);
    formData.append("user_id", user_id);
    formData.append("hotel_id", hotel_id);
    formData.append("special_items", special_items);
    formData.append("total_amount", total_amount);
    formData.append("hotel_name", hotel_name);

    var formDataObject = {
        user_id: document.getElementById('user_id').value,
        hotel_id: document.getElementById('hotel_id').value,
        special_items: document.getElementById('special_items').value,
        total_amount: document.getElementById('total_amount').value,
        hotel_name: JSON.parse(sessionStorage.getItem('selected_hotel')).hotel_name
    };
    formData.forEach(function (value, key) {
        formDataObject[key] = value;
    });
    var formDataJSON = JSON.stringify(formDataObject);

    // Store the JSON data in sessionStorage
    sessionStorage.setItem('booking_details', formDataJSON);
    window.location.href = '../html/orderDetails.html';
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