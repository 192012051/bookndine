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

    if (isset($requestData['insert'])) {
        // This block is for inserting special items
        $hotelId = $requestData['hotel_id'];
        $specialItems = $requestData['special_items'];

        $success = true;
        $message = '';

        foreach ($specialItems as $specialItem) {
            $itemName = $specialItem['item_name'];
            $itemPrice = $specialItem['item_price'];
            $itemDescription = $specialItem['item_description'];

            $stmt = $conn->prepare("INSERT INTO special_items (hotel_id, item_name, item_price, item_description) VALUES (?, ?, ?, ?)");
            $stmt->bind_param("isds", $hotelId, $itemName, $itemPrice, $itemDescription);

            if ($stmt->execute()) {
                $message = 'Special items added successfully';
            } else {
                $success = false;
                $message = 'Error adding special items: ' . $stmt->error;
                break;
            }
        }

        $response = array('success' => $success, 'message' => $message);
        echo json_encode($response);
    } elseif (isset($requestData['delete'])) {
        // This block is for deleting special items
        $specialItemId = $requestData['special_item_id'];

        $stmt = $conn->prepare("DELETE FROM special_items WHERE special_item_id = ?");
        $stmt->bind_param("i", $specialItemId);

        if ($stmt->execute()) {
            $response = array('success' => true, 'message' => 'Special item deleted successfully');
        } else {
            $response = array('success' => false, 'message' => 'Error deleting special item: ' . $stmt->error);
        }

        echo json_encode($response);
    }

    // Close the connection
    $conn->close();
}

?>
