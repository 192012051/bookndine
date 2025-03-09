window.onload = function () {
  var userDetailsString = sessionStorage.getItem('user_details');
  var userDetails = JSON.parse(userDetailsString);

  if (userDetails) {
    populateUserProfile(userDetails);
  }
}

function populateUserProfile(userDetails) {
  var userName1 = document.getElementById('user-name1');
  var userName2 = document.getElementById('user-name2');
  var userEmail = document.getElementById('user-email');
  var userMobile = document.getElementById('user-mobile');
  var userGender = document.getElementById('user-gender');
  var userNameInput = document.getElementById('user-name-input');
  var userEmailInput = document.getElementById('user-email-input');
  var userMobileInput = document.getElementById('user-mobile-input');
  var userGenderInput = document.getElementById('user-gender-input');

  // Check if the elements exist before populating
  if (userName1 && userName2 && userEmail && userMobile && userGender && userNameInput && userEmailInput && userMobileInput && userGenderInput) {
    // Populate values in the profile page
    userName1.textContent = userDetails.user_name;
    userName2.textContent = userDetails.user_name;
    userEmail.textContent = userDetails.email;
    userMobile.textContent = userDetails.mobile;
    userGender.textContent = userDetails.gender == 0 || '0' ? 'Male' : 'Female';
    userNameInput.value = userDetails.user_name;
    userEmailInput.value = userDetails.email;
    userMobileInput.value = userDetails.mobile;
    userGenderInput.value = userDetails.gender;
  }
}

function showEditPage() {
  document.getElementById('profile-page').classList.add('d-none');
  document.getElementById('edit-page').classList.remove('d-none');
}

function showProfilePage() {
  document.getElementById('edit-page').classList.add('d-none');
  document.getElementById('profile-page').classList.remove('d-none');
}

function updateProfile() {
  var userName = document.getElementById('user-name-input').value;
  // var userEmail = document.getElementById('user-email-input').value;
  var userMobile = document.getElementById('user-mobile-input').value;
  var userGender = document.getElementById('user-gender-input').value;

  var updatedProfile = {
    userId: JSON.parse(sessionStorage.getItem('user_details')).user_id,
    userName: userName,
    // userEmail: userEmail,
    userMobile: userMobile,
    userGender: userGender
  };

  fetch('../php/updateprofile.php', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
    },
    body: JSON.stringify(updatedProfile),
  })
    .then(response => response.json())
    .then(data => {
      if (data.success) {
        console.log('Profile updated successfully:', data.message);
        var userDetailsString = sessionStorage.getItem('user_details');
        var userDetails = JSON.parse(userDetailsString);
        userDetails.user_name = userName;
        userDetails.mobile = userMobile;
        userDetails.gender = userGender;
        sessionStorage.setItem('user_details', JSON.stringify(userDetails));
        populateUserProfile(userDetails);
        showProfilePage();
        showPopup(true);
      } else {
        console.error('Error updating profile:', data.message);
        showPopup(false);
      }
    })
    .catch(error => {
      console.error('Fetch error:', error);
    });
}

function showPopup(isSuccess) {
  var alertDiv = document.createElement('div');
  alertDiv.className = 'p-5';
  alertDiv.style.width = '100%';
  alertDiv.style.display = 'flex';
  alertDiv.style.position = 'absolute';
  alertDiv.style.zIndex = '999';
  alertDiv.style.justifyContent = 'center';
  alertDiv.style.top = '0';
  if (isSuccess) {
    alertDiv.innerHTML = `
        <div class="row" style="width: 30%;">
          <div class="col-lg-12 m-auto">
            <div class="alert alert-success animated slideInDown show" role="alert">
              <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="True">&times;</span>
              </button>
              <h4 class="alert-heading">Profile Updated!</h4>
              <p>Profile updated successfully.</p>
            </div>
          </div>
        </div>
      `;
  } else {
    alertDiv.innerHTML = `
        <div class="row" style="width: 30%;">
          <div class="col-lg-12 m-auto">
            <div class="alert alert-danger animated slideInDown show" role="alert">
              <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="True">&times;</span>
              </button>
              <h4 class="alert-heading">Update failed!</h4>
              <p>Check your input.</p>
            </div>
          </div>
        </div>
      `;
  }
  document.body.prepend(alertDiv);
}

function backToProfileSection() {
  showProfilePage();
}