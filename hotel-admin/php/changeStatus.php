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
    if (isset($requestData['order_id'])) {
        // This block is for updating booking status
        $orderId = $requestData['order_id'];
        
        // Start a transaction
        $conn->begin_transaction();
        
        // Update booking status
        $stmt = $conn->prepare("UPDATE booking_details SET status='Accepted', booking_status = 1 WHERE booking_id = ?");

        // Check if the prepare statement was successful
        if ($stmt) {
            // Bind parameters
            $stmt->bind_param("s", $orderId);
            // Execute the statement
            if ($stmt->execute()) {
                // Update table count
                $updateTableCountStmt = $conn->prepare("UPDATE hotel_details SET table_count = table_count - 1 WHERE hotel_id = (SELECT hotel_id FROM booking_details WHERE booking_id = ?)");
                $updateTableCountStmt->bind_param("s", $orderId);
                if ($updateTableCountStmt->execute()) {
                    // Commit the transaction
                    $conn->commit();
                    $response = array('success' => true, 'message' => 'Booking Status updated successfully');
                    echo json_encode($response);
                } else {
                    // Rollback the transaction if updating table count fails
                    $conn->rollback();
                    $response = array('success' => false, 'message' => 'Error updating table count: ' . $updateTableCountStmt->error);
                    echo json_encode($response);
                }
                $updateTableCountStmt->close();
            } else {
                // Rollback the transaction if updating booking status fails
                $conn->rollback();
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
