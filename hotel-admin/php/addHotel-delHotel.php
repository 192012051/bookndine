<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "bookndine";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

if (isset($_POST['hotel_id'])) {
    $hotel_id = $_POST['hotel_id'];

    // Perform your delete operation using $hotel_id
    $stmt = $conn->prepare("DELETE FROM HOTEL_DETAILS WHERE hotel_id = ?");
    $stmt->bind_param("i", $hotel_id);

    if ($stmt->execute()) {
        echo json_encode(array("success" => true));
    } else {
        echo json_encode(array("error" => "Error executing delete query: " . $conn->error));
    }

    $stmt->close();
} else {
    echo json_encode(array("error" => "Hotel ID not provided"));
}

$conn->close();
?>