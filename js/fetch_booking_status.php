<?php
// Include the database connection file if not already included
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

// Check if the booking_id is provided in the GET request
if (isset($_GET['booking_id'])) {
    $booking_id = $_GET['booking_id'];

    // Fetch the booking status from the database
    $query = "SELECT booking_status FROM BOOKING_DETAILS WHERE booking_id = $booking_id";
    $result = $conn->query($query);

    if ($result) {
        // Fetch the status
        $row = $result->fetch_assoc();
        $status = $row['booking_status'];

        // Return the status as JSON
        header('Content-Type: application/json');
        echo json_encode(array('status' => $status));
    } else {
        // Return an error message if query fails
        echo json_encode(array('error' => 'Failed to fetch status'));
    }
} else {
    // Return an error message if booking_id is not provided
    echo json_encode(array('error' => 'No booking ID provided'));
}

// Close the database connection
$conn->close();
?>
