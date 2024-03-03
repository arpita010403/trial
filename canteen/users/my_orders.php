<?php
include('../includes/connect.php');

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My orders</title>
    <style>
        th {
            background: #5F8670;
            color: white;
        }

        
    </style>
</head>
<body>
    <?php

    
    $username = $_SESSION['username'];
    $get_user = "SELECT * FROM `user_table` WHERE username='$username'";
    $result = mysqli_query($con, $get_user);
    $row_fetch = mysqli_fetch_array($result);
    $user_id = $row_fetch['user_id'];
    ?>
    <h3 class="text-success">My orders</h3>
    <table class="table table-bordered mt-5 p-0">
        <thead class="border border-dark rounded">
            <tr>
                <th>Sr.No.</th>
                <th>Order id</th>
                <th>Amount Due</th>
                <th>Total Items</th>
                <th>Date</th>
              
                
               
            </tr>
        </thead>
        <tbody>
            <?php 
            $get_order_details = "SELECT * FROM `user_orders` WHERE user_id=$user_id";
            $result_orders = mysqli_query($con, $get_order_details);
            $number = 1;
            while ($row_orders = mysqli_fetch_array($result_orders)) {
                $order_id = $row_orders['order_id'];
                $amount_due = $row_orders['amount_due']; // Fetch amount_due
                $total_products = $row_orders['total_products'];
                $order_date = $row_orders['order_date'];
                // Fetch the latest status from the database
                $get_latest_status_query = "SELECT order_status FROM `user_orders` WHERE order_id = $order_id ORDER BY order_date DESC LIMIT 1";
                $latest_status_result = mysqli_query($con, $get_latest_status_query);
                $latest_status_row = mysqli_fetch_assoc($latest_status_result);
               
                echo "<tr>
                <td>$number</td>
                <td>$order_id</td>
                <td>₹$amount_due/-</td> <!-- Display amount due here -->
                <td>$total_products</td>
                <td>$order_date</td>";
                
                
                $number++;
            }
            ?>
        </tbody>
    </table>
</body>
</html>
