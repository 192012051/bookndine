<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "bookndine";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    echo "
            <script type=\"text/javascript\">
              sessionStorage.setItem('connection_error', $conn->connect_error);
            </script>
        ";
    die("Connection failed: " . $conn->connect_error);
}

if (isset($_POST['signup'])) {
    // Fetching variables from the form
    $username = $_POST['username'];
    $email = $_POST['email'];
    $mobile = $_POST['mobile'];
    $gender = $_POST['gender'];
    $password = $_POST['password'];

    // Hash the password (always hash passwords before storing in the database)
    $hashed_password = password_hash($password, PASSWORD_DEFAULT);

    // Insert query using prepared statement to prevent SQL injection
    $stmt = $conn->prepare("INSERT INTO USER_DETAILS (full_name, email, mobile, password_hash, role, gender, created_at) VALUES (?, ?, ?, ?, 0, ?, NOW())");
    $stmt->bind_param("ssssi", $username, $email, $mobile, $hashed_password, $gender);

    if ($stmt->execute()) {
        echo "
            <script type=\"text/javascript\">
              sessionStorage.setItem('signupsuccess', true);
            </script>
        ";
        echo "<script> location.href='../html/signup.html'; </script>";
    } else {
        echo "
            <script type=\"text/javascript\">
              sessionStorage.setItem('signupfail', true);
            </script>
        ";
        echo "<script> location.href='../html/signup.html'; </script>";
    }

    $stmt->close();
    $conn->close();
}
?>
