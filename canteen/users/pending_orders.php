<?php
// Include your database connection and any necessary functions here

if(isset($_POST['order_status']) && isset($_POST['order_id'])) {
    $order_id = $_POST['order_id'];
    $order_status = $_POST['order_status'];
    
    // Update the order status in the database
    $update_query = "UPDATE `orders_pending` SET `order_status`='$order_status' WHERE `order_id`='$order_id'";
    mysqli_query($con, $update_query);

    // Check if the order status is 'complete' and delete the order if true
    if ($order_status == 'complete') {
        $delete_query = "DELETE FROM `orders_pending` WHERE `order_id`='$order_id'";
        mysqli_query($con, $delete_query);
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Panel</title>
    <style>
        th {
            background: #5F8670;
            color: white;
        }
    </style>
</head>
<body>
    <h3 class="text-success">Pending Orders</h3>
    <table class="table table-bordered mt-5 p-0">
        <thead class="border border-dark rounded">
            <tr>
                <th>Sr.No.</th>
                <th>User</th>
                <th>Amount Due</th>
                <th>Total Items</th>
                <th>Date</th>
                <th>Status</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <?php 
            $get_order_details = "SELECT * FROM `orders_pending`";
            $result_orders = mysqli_query($con, $get_order_details);
            $number = 1;
            while ($row_orders = mysqli_fetch_array($result_orders)) {
                $order_id = $row_orders['order_id'];
                $amount_due = $row_orders['amount_due'];
                $quantity = $row_orders['quantity'];
                $order_date = $row_orders['order_date'];
                $user_id = $row_orders['user_id'];
                $order_status = $row_orders['order_status'];
                
                echo "<tr>
                <td>$number</td>
                <td>$user_id</td>
                <td>₹$amount_due/-</td>
                <td>$quantity</td>
                <td>$order_date</td>
                <td>$order_status</td>
                <td>
                    <form action='' method='post'>
                        <input type='hidden' name='order_id' value='$order_id'>
                        <select name='order_status'>
                            <option value='pending' ". ($order_status == 'pending' ? 'selected' : '') .">Pending</option>
                            <option value='complete' ". ($order_status == 'complete' ? 'selected' : '') .">Complete</option>
                        </select>
                        
// Check if the form to update order status is submitted
if(isset($_POST['order_status']) && isset($_POST['order_id'])) {
    $order_id = $_POST['order_id'];
    $order_status = $_POST['order_status'];
    
    // Update the order status in the database
    $update_query = "UPDATE `orders_pending` SET `order_status`='$order_status' WHERE `order_id`='$order_id'";
    mysqli_query($con, $update_query);

    // If the order status is complete, delete the order
    if ($order_status == 'complete') {
        $delete_query = "DELETE FROM `orders_pending` WHERE `order_id`='$order_id'";
        mysqli_query($con, $delete_query);
    }
}


                        <button type='submit'>Update</button>
                    </form>
                </td>
                </tr>";
                
                $number++;
            }
            ?>
        </tbody>
    </table>
</body>
</html>
