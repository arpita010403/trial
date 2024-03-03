<?php 
include('../includes/connect.php');
include('../functions/common_function.php');

// Generate a unique token
$order_token = uniqid();

if(isset($_GET['order_id'])){
    // order_id is set
    $order_id = $_GET['order_id'];
} else {
    // order_id is not set, handle the case accordingly
}
// Update user_orders table with the generated order token
$update_query = "UPDATE user_orders SET order_token = '$order_token' WHERE order_id = $order_id";
$result = mysqli_query($con, $update_query);

if (!$result) {
    // Handle the case where the update query fails
    echo "Failed to update order token.";
}

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Token Page</title>
    <!-- Add your CSS styles here -->
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 800px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            text-align: center;
            margin-bottom: 30px;
        }
        .token {
            font-size: 24px;
            text-align: center;
            padding: 20px;
            background-color: #f0f0f0;
            border-radius: 8px;
            margin-bottom: 20px;
        }
        .btn {
            display: block;
            width: 100%;
            max-width: 200px;
            margin: 0 auto;
            padding: 10px 20px;
            background-color: #4caf50;
            color: #fff;
            text-align: center;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }
        .btn:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Order Token</h1>
        <div class="token">
            Your Order Token: <?php echo $order_token; ?>
        </div>
        <a href="profile.php" class="btn">Back to Profile</a>
    </div>
</body>
</html>
