<?php
// Include your database connection file
include 'db_connection.php';

// Check if the user ID is provided
if (isset($_GET['id'])) {
    // Sanitize the input to prevent SQL injection
    $userId = $_GET['id'];
    
    // Prepare and execute a query to fetch user profile data
    $sql = "SELECT * FROM users WHERE id = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $userId);
    $stmt->execute();
    $result = $stmt->get_result();
    
    // Check if any rows were returned
    if ($result->num_rows > 0) {
        // Fetch the user profile data
        $userDetails = $result->fetch_assoc();
        
        // Return the user profile data as JSON
        echo json_encode($userDetails);
    } else {
        // No user found with the provided ID
        echo json_encode(array("error" => "User not found"));
    }
} else {
    // No user ID provided
    echo json_encode(array("error" => "User ID not provided"));
}

// Close the database connection
$conn->close();
?>
