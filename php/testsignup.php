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

if(isset($_POST['signup'])){ // Fetching variables of the form which travels in URL
$username = $_POST['username'];
$email = $_POST['email'];
$mobile = $_POST['mobile'];
$password = $_POST['password'];
// echo $username;
// if($name !=''||$email !=''){
//Insert Query of SQL
// $query = mysql_query("insert into students(student_name, student_email, student_contact, student_address) values ('$name', '$email', '$contact', '$address')");
echo "
        <script type=\"text/javascript\">
          sessionStorage.setItem('signup', true);
        </script>
      ";
echo "<script> location.href='../signup.html'; </script>";
// }
// else{
// echo "<p>Insertion Failed <br/> Some Fields are Blank....!!</p>";
// }
} else {
echo "<script> location.href='../login.html'; </script>";
}
mysqli_close($conn);
?>