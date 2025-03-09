document.addEventListener("DOMContentLoaded", function () {
	var isLoginFailed = sessionStorage.getItem('login_failed');
	if (isLoginFailed === true || isLoginFailed === "true") {
		sessionStorage.setItem('login_failed', false);

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
              <h4 class="alert-heading" style="top: 0%; justify-content: flex-start;">Login Failed!</h4>
              <p>Incorrect Email or Password.</p>
            </div>
          </div>
        </div>
      `;
		document.getElementById('form-body').prepend(alertDiv);
	}
});

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