window.onload = function () {
	var connectionError = sessionStorage.getItem('connection_error');
	if (connectionError) {
		alert(connectionError);
		sessionStorage.setItem('connection_error', null);
	}
	var isSignedupSuccess = sessionStorage.getItem('signupsuccess');
	var isSignedupFail = sessionStorage.getItem('signupfail');
	if (isSignedupSuccess === true || isSignedupSuccess === "true") {
		sessionStorage.setItem('signupsuccess', false);

		var alertDiv = document.createElement('div');
		alertDiv.className = 'p-5';
		alertDiv.style.width = '100%';
		alertDiv.style.display = 'flex';
		alertDiv.style.position = 'absolute';
		alertDiv.style.zIndex = '999';
		alertDiv.style.justifyContent = 'center';

		// Create the inner structure of the alert
		alertDiv.innerHTML = `
        <div class="row" style="width: 30%;">
          <div class="col-lg-12 m-auto">
            <div class="alert alert-success animated slideInDown show" role="alert">
              <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="True">&times;</span>
              </button>
              <h4 class="alert-heading">Signup Success!</h4>
              <p>Your account has been created.</p>
            </div>
          </div>
        </div>
      `;
		document.getElementById('form-body').prepend(alertDiv);
	}
	else if (isSignedupFail === true || isSignedupFail === "true") {
		sessionStorage.setItem('signupfail', false);

		var alertDiv = document.createElement('div');
		alertDiv.className = 'p-5';
		alertDiv.style.width = '100%';
		alertDiv.style.display = 'flex';
		alertDiv.style.position = 'absolute';
		alertDiv.style.zIndex = '999';
		alertDiv.style.justifyContent = 'center';

		// Create the inner structure of the alert
		alertDiv.innerHTML = `
        <div class="row" style="width: 30%;">
          <div class="col-lg-12 m-auto">
            <div class="alert alert-danger animated slideInDown show" role="alert">
              <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="True">&times;</span>
              </button>
              <h4 class="alert-heading">Signup Failed!</h4>
              <p>Please check your details.</p>
            </div>
          </div>
        </div>
      `;
		document.getElementById('form-body').prepend(alertDiv);
	}
}

// function formValidation() {
// 	var userName = document.getElementById('username').value;
// 	var email = document.getElementById('email').value;
// 	var mobile = document.getElementById('mobile').value;
// 	var gender = document.getElementById('gender').value;
// 	var pass = document.getElementById('password').value;
// 	var confPass = document.getElementById('confirm_password').value;
// }

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

function goBack() {
	window.location.replace('login.html');
}