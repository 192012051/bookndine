<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "bookndine";

echo "Before connection";
// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
echo "After connection"; // Add this line

error_reporting(E_ALL);
ini_set('display_errors', 1);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
if ($_SERVER["REQUEST_METHOD"] == "POST") {

     
// Restaurant Details
$hotelName = $_POST['restaurantName'];
$restaurantAddress = $_POST['restaurantAddress'];
$selectedLocation = $_POST['selectLocation']; 
$pricePerPerson = $_POST['price'];// Added line

 
// Insert restaurant details into the database
$stmtRestaurant = $conn->prepare("INSERT INTO hotel_details (location_id, hotel_name, price_per_person, address) VALUES (?, ?, ?, ?)");
$stmtRestaurant->bind_param("isis", $selectedLocation, $hotelName,$pricePerPerson, $restaurantAddress);
$stmtRestaurant->execute();

// Get the last inserted restaurant ID
$restaurantID = $stmtRestaurant->insert_id;

// Handle special items
$foodName1 = $_POST['foodName1'];
$foodDescription1 = $_POST['foodDescription1'];
$foodPrice1 = $_POST['foodPrice1'];

$foodName2 = $_POST['foodName2'];
$foodDescription2 = $_POST['foodDescription2'];
$foodPrice2 = $_POST['foodPrice2'];

// Insert special items into the database
$stmtFood1 = $conn->prepare("INSERT INTO special_items (hotel_id, item_name, item_price, item_description) VALUES (?, ?, ?, ?)");
$stmtFood1->bind_param("isds", $restaurantID, $foodName1, $foodPrice1, $foodDescription1);
$stmtFood1->execute();

$stmtFood2 = $conn->prepare("INSERT INTO special_items (hotel_id, item_name, item_price, item_description) VALUES (?, ?, ?, ?)");
$stmtFood2->bind_param("isds", $restaurantID, $foodName2, $foodPrice2, $foodDescription2);
$stmtFood2->execute();
echo "Successfully inserted";
// Close connections
$stmtRestaurant->close();
$stmtFood1->close();
$stmtFood2->close();
$conn->close();
}
?>