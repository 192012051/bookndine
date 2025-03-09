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

// Fetch all booking details from the database
$query = "SELECT * FROM BOOKING_DETAILS";
$result = $conn->query($query);

// Check if there are any rows returned
if ($result->num_rows > 0) {
    echo '<table border="1">
            <tr>
                <th>Booking ID</th>
                <th>User ID</th>
                <th>Booked By</th>
                <th>Hotel ID</th>
                <th>Booking Date</th>
                <th>Booking Time</th>
                <th>Num Persons</th>
                <th>Special Items</th>
                <th>Special Requests</th>
                <th>Mobile Number</th>
                <th>Total Amount</th>
                <th>Hotel Name</th>
                <th>Action</th>
                <th>Status</th>
            </tr>';

    // Output data of each row
    while ($row = $result->fetch_assoc()) {
        echo '<tr>
                <td>' . $row['booking_id'] . '</td>
                <td>' . $row['user_id'] . '</td>
                <td>' . $row['booked_by'] . '</td>
                <td>' . $row['hotel_id'] . '</td>
                <td>' . $row['booking_date'] . '</td>
                <td>' . $row['booking_time'] . '</td>
                <td>' . $row['num_persons'] . '</td>
                <td>' . $row['special_items'] . '</td>
                <td>' . $row['special_requests'] . '</td>
                <td>' . $row['mobile_number'] . '</td>
                <td>' . $row['total_amount'] . '</td>
                <td>' . $row['hotel_name'] . '</td>
                
                <td><a href="?action=accept&booking_id=' . $row['booking_id'] . '">Accept</a> | <a href="?action=reject&booking_id=' . $row['booking_id'] . '">Reject</a></td>
                <td>' . $row['status'] . '</td>
              </tr>';
    }
    echo '</table>';
} else {
    echo 'No bookings found.';
}

// Check if an action is requested
if (isset($_GET['action']) && isset($_GET['booking_id'])) {
    $action = $_GET['action'];
    $booking_id = $_GET['booking_id'];

    // Update booking status based on the action
    $status = ($action == 'accept') ? 'Accepted' : 'Rejected';

    $updateQuery = "UPDATE BOOKING_DETAILS SET status = '$status' WHERE booking_id = $booking_id";
    if ($conn->query($updateQuery) === TRUE) {
        echo "Status updated successfully.";
    } else {
        echo "Error updating status: " . $conn->error;
    }
}

// Close the database connection
$conn->close();
?>
<style>
    table {
        border-collapse: collapse;
        width: 100%;
        margin-top: 20px;
    }

    th,
    td {
        border: 1px solid #dddddd;
        text-align: left;
        padding: 8px;
    }

    th {
        background-color: #f2f2f2;
    }
</style>
