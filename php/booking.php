<?php
header('Content-Type: application/json');
file_put_contents('debug.log', date('Y-m-d H:i:s') . " - Script started\n", FILE_APPEND);

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "bookndine";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    $errorType = "Connection Error";
    $errorMessage = $conn->connect_error;
    logError($errorType, $errorMessage);
    die("Connection failed: " . $conn->connect_error);
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Get JSON data from the request
    $jsonData = file_get_contents('php://input');

    // Decode JSON data
    $formData = json_decode($jsonData, true);

    // Ensure that the JSON payload is valid
    if (!isset($formData['user_id']) || !isset($formData['hotel_id']) || !isset($formData['special_items']) || !isset($formData['total_amount']) || !isset($formData['fullname']) || !isset($formData['number']) || !isset($formData['datetime']) || !isset($formData['select1']) || !isset($formData['booking_time']) || !isset($formData['message']) || !isset($formData['hotel_name'])) {
        $errorType = "Invalid JSON Payload";
        $errorMessage = "One or more required fields are missing in the JSON payload.";
        logError($errorType, $errorMessage);
        echo json_encode(["success" => false, "error" => $errorMessage]); // Return error response
        exit;
    }

    // Extract values from formData
    $user_id = $formData['user_id'];
    $hotel_id = $formData['hotel_id'];
    $special_items = $formData['special_items'];
    $name = $formData['fullname'];
    $mobile_number = $formData['number'];
    $datetime = $formData['datetime'];
    $no_of_people = $formData['select1'];
    $booking_time = $formData['booking_time'];
    $special_request = $formData['message'];
    $hotel_name = $formData['hotel_name'];

    // Extract total amount from the formData
    $total_amount = $formData['total_amount'];

    // Ensure total amount is not zero
    if ($total_amount <= 0) {
        $errorType = "Invalid Total Amount";
        $errorMessage = "Total amount cannot be zero or negative.";
        logError($errorType, $errorMessage);
        echo json_encode(["success" => false, "error" => $errorMessage]); // Return error response
        exit;
    }

    // Prepare the statement to insert booking details
    $stmt = $conn->prepare("INSERT INTO BOOKING_DETAILS (user_id, booked_by, hotel_id, booking_date, booking_time, num_persons, special_items, special_requests, booking_status, mobile_number, total_amount, created_at, hotel_name) VALUES (?, ?, ?, ?, ?, ?, ?, ?, 0, ?, ?, NOW(), ?)");

    if ($stmt) {
        // Bind parameters
        $stmt->bind_param("isississsds", $user_id, $name, $hotel_id, $datetime, $booking_time, $no_of_people, $special_items, $special_request, $mobile_number, $total_amount, $hotel_name);

        // Execute the statement
        if ($stmt->execute()) {
            echo json_encode(["success" => true]); // Return success response
        } else {
            $errorType = "SQL Execution Error";
            $errorMessage = $stmt->error;
            logError($errorType, $errorMessage);
            echo json_encode(["success" => false, "error" => $errorMessage]); // Return error response
        }

        // Close the statement
        $stmt->close();
    } else {
        $errorType = "Prepare Statement Error";
        $errorMessage = $conn->error;
        logError($errorType, $errorMessage);
        echo json_encode(["success" => false, "error" => $errorMessage]); // Return error response
    }

    // Close the connection
    $conn->close();
}

function logError($errorType, $errorMessage)
{
    global $conn;
    $logErrorStmt = $conn->prepare("INSERT INTO error_log (error_type, error_message, created_at) VALUES (?, ?, NOW())");
    $logErrorStmt->bind_param("ss", $errorType, $errorMessage);
    $logErrorStmt->execute();
    $logErrorStmt->close();
}
?>
