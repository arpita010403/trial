<?php
include('../includes/connect.php');
include('../functions/common_function.php');

if(isset($_GET['user_id'])){
    $user_id=$_GET['user_id'];
}

// Getting total items and total price of all items
$get_ip_address = getIPAddress();
$total_price = 0;
$cart_query_price = "SELECT * FROM cart_details WHERE ip_address='$get_ip_address'";
$result_cart_price = mysqli_query($con, $cart_query_price);
$status = 'pending';
$count_products = mysqli_num_rows($result_cart_price);

while($row_price = mysqli_fetch_array($result_cart_price)){
    $product_id = $row_price['product_id'];
    $product_quantity = $row_price['quantity']; // Fetch quantity from cart_details
    $select_product = "SELECT * FROM products WHERE product_id=$product_id";
    $run_price = mysqli_query($con, $select_product);
    
    while($row_product_price = mysqli_fetch_array($run_price)){
        $product_price = $row_product_price['product_price'];
        $total_price += $product_price * $product_quantity; // Multiply price by quantity
    }
}

// Getting quantity from cart
$get_cart = "SELECT SUM(quantity) AS quantity FROM cart_details WHERE ip_address='$get_ip_address'";
$run_cart = mysqli_query($con, $get_cart);
$get_item_quantity = mysqli_fetch_array($run_cart);
$quantity = $get_item_quantity['quantity'];

if($quantity == 0){
    $quantity = 1;
}

$subtotal = $total_price * $quantity;



// Insert into user_orders
$insert_orders = "INSERT INTO `user_orders` (user_id, amount_due, total_products, customization_description, order_date, order_status, quantity, product_titles) 
                  VALUES ($user_id, $subtotal, $count_products, '$customization_description', NOW(), '$status', $quantity, '$product_titles')";
$result_query = mysqli_query($con, $insert_orders);

if ($result_query) {
    echo "<script>alert('Orders are submitted successfully')</script>";
    echo "<script>window.open('profile.php','_self')</script>";
}
// Generate a unique token ID
$order_token = uniqid();
// Pending orders
$insert_pending_orders = "INSERT INTO `orders_pending` (user_id, invoice_number, product_id, quantity, customization_description, order_status,order_token) 
                          VALUES ($user_id, $invoice_number, $product_id, $quantity,'$customization_description', '$status',$order_token)";
$result_pending_orders = mysqli_query($con, $insert_pending_orders);

// Delete items from cart
$empty_cart = "DELETE FROM `cart_details` WHERE ip_address='$get_ip_address'";
$result_delete = mysqli_query($con, $empty_cart);
?>
