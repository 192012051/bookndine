<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "bookndine";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
error_reporting(E_ALL);
ini_set('display_errors', 1);

// Check connection
if ($conn->connect_error) {
    echo "
        <script type=\"text/javascript\">
          sessionStorage.setItem('connection_error', $conn->connect_error);
        </script>
    ";
    die("Connection failed: " . $conn->connect_error);
}

if (isset($_POST['login'])) {

    $userEmail = $_POST['email'];
    $password = $_POST['password'];

    $stmt = $conn->prepare("SELECT user_id, full_name, email, mobile, password_hash, role, gender, hotel_id FROM USER_DETAILS WHERE email = ?");
    $stmt->bind_param("s", $userEmail);

    // Execute the query
    $stmt->execute();

    // Bind the result variables
    $stmt->bind_result($resultUserId, $resultUserName, $resultEmail, $resultNumber, $resultPasswordHash, $resultRole, $resultGender, $resultHotelId);

    // Fetch the result
    $stmt->fetch();

    // Close the statement
    $stmt->close();

    // Verify the password (replace this with your actual login logic)
    $password_check = password_verify($password, $resultPasswordHash);

    if ($resultEmail && $password_check) {
        // Set user details in session storage
        echo "
            <script type=\"text/javascript\">
                sessionStorage.clear();
                var userDetails = {
                    user_id: '$resultUserId',
                    user_name: '$resultUserName',
                    email: '$resultEmail',
                    mobile: '$resultNumber',
                    user_role: '$resultRole',
                    gender: '$resultGender',
                    hotel_id: '$resultHotelId',
                };
                sessionStorage.setItem('user_details', JSON.stringify(userDetails));
            </script>
        ";

        // Redirect based on the common conditions
        if ($resultRole == 0) {
            echo "<script> location.href='../html/index.html'; </script>";
        } elseif ($resultRole == 2) {
            echo "<script> location.href='../admin/html/adminIndex.html'; </script>";
        } elseif ($resultRole == 1 && $resultHotelId != null) {
            echo "<script> location.href='../hotel-admin/html/hotel-admin.html'; </script>";
        } else {
            echo "<script> location.href='../html/login.html'; </script>";
        }
    } else {
        // Password verification failed, redirect to login.html
        echo "
            <script type=\"text/javascript\">
                sessionStorage.setItem('login_failed', true);
            </script>
        ";
        echo "<script> location.href='../html/login.html'; </script>";
    }

    // Close the connection
    $conn->close();
}
?>