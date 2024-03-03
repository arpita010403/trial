<?php


if(isset($_POST['order_status']) && isset($_POST['order_id'])) {
    $order_id = $_POST['order_id'];
    $order_status = $_POST['order_status'];
    
    // Update the order status in the database
    $update_query = "UPDATE `user_orders` SET `order_status`='$order_status' WHERE `order_id`='$order_id'";
    mysqli_query($con, $update_query);
}
?>
<h3 class="text-success text-center">All Orders</h3>
<table class="table table-bordered mt-5">
    <thead>
        <tr class='bg-secondary text-light text-center'>
            <th>Sr.no.</th>
            <th>Due Amount</th>
            <th>Token no.</th>
            <th>Quantity</th>
            <th>Item & Customization Details</th>
            <th>Order Date</th>
            <th>Status</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody class='text-center'>
        <?php 
        $get_orders = "SELECT * FROM `orders_pending`";
        $result = mysqli_query($con, $get_orders);
        $row_count = mysqli_num_rows($result);
        
        if($row_count == 0){
            echo "<h2 class='text-danger text-center mt-5'>No orders yet!</h2>";
        } else {
            $number = 0;
            while($row_data = mysqli_fetch_array($result)){
                $order_id = $row_data['order_id'];
                $amount_due = $row_data['amount_due'];
                $order_token = $row_data['order_token'];
                $quantity = $row_data['quantity'];
                $customization_description = $row_data['customization_description'];
                $order_date = $row_data['order_date'];
                $order_status = $row_data['order_status'];
                $number++;
        ?>
        <tr>
            <td><?php echo $number;?></td>
            <td><?php echo $amount_due;?></td>
            <td><?php echo $order_token;?></td>
            <td><?php echo $quantity;?></td>
            <td><?php echo $customization_description;?></td>
            <td><?php echo $order_date;?></td>
            <td>
                <form action="" method="post">
                    <input type="hidden" name="order_id" value="<?php echo $order_id; ?>">
                    <select name="order_status">
                        <option value="pending" <?php if($order_status == 'pending') echo 'selected'; ?>>Pending</option>
                        <option value="complete" <?php if($order_status == 'complete') echo 'selected'; ?>>Complete</option>
                    </select>
                    <button type="submit">Update</button>
                </form>
            </td>
            <td><a href="admin_panel.php?delete_order=<?php echo $order_id?>" type="button" class="text-dark" data-toggle="modal" data-target="#exampleModalLong"><i class="fa-solid fa-trash"></i></a></td> 
        </tr>
        <?php   
            }
        }
        ?>
    </tbody>
</table>
<!-- Modal/popup confirmation -->
<div class="modal fade" id="exampleModalLong" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      
      <div class="modal-body">
        <h4>Are you sure you want to delete this?</h4>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-light border border-primary" data-dismiss="modal"><a href="./orders.php?list_orders" class="text-decoration-none">No</a></button>
        <button type="button" class="btn btn-primary"><a href='orders.php?delete_order=<?php echo $order_id?>' class="text-light text-decoration-none">Yes</a></button>
      </div>
    </div>
  </div>
</div>