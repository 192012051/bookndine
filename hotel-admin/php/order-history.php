<?php

error_reporting(E_ALL);
ini_set('display_errors', 1);

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

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Get JSON data from the request
    $jsonData = file_get_contents('php://input');

    // Decode JSON data
    $requestData = json_decode($jsonData, true);
    if (isset($requestData['hotel_id'])) {
        // Extract values from requestData
        $hotelId = $requestData['hotel_id'];

        // Perform a simple query to retrieve booking data
        $sql = "SELECT * FROM booking_details WHERE hotel_id = $hotelId";

        $result = $conn->query($sql);

        if ($result) {
            $bookingHistory = $result->fetch_all(MYSQLI_ASSOC);
            header('Content-Type: application/json');
            echo json_encode(array('success' => true, 'data' => $bookingHistory));
        } else {
            $response = array('success' => false, 'message' => 'Error executing query: ' . $conn->error);
            header('Content-Type: application/json');
            echo json_encode($response);
        }
    } 

   
    if (isset($requestData['order_id'])) {
        // This block is for updating booking status
        $orderId = $requestData['order_id'];
        // Prepare the statement
        $stmt = $conn->prepare("UPDATE booking_details SET booking_status = 2 WHERE booking_id = ?");
        // Check if the prepare statement was successful
        if ($stmt) {
            // Bind parameters
            $stmt->bind_param("s", $orderId);
            // Execute the statement
            if ($stmt->execute()) {
                $response = array('success' => true, 'message' => 'Booking Status updated successfully');
                echo json_encode($response);
            } else {
                $response = array('success' => false, 'message' => 'Error updating booking status: ' . $stmt->error);
                echo json_encode($response);
            }
            // Close the statement
            $stmt->close();
        } else {
            $response = array('success' => false, 'message' => 'Error preparing SQL statement: ' . $conn->error);
            echo json_encode($response);
        }
    }

    // Close the connection
    $conn->close();
}

?>