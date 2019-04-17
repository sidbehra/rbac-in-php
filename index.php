

<?php

$servername = "localhost";
$username = "root";
$password = "";
$database = "rbacdb";


$conn = new mysqli($servername,$username,$password,$database) or die("unable to connect to database bro");
if($conn)
{
	echo"great! you are connected bro";

	echo "<br><br><br>";
}
?>

<?php
$count=0;
$actionArray = array();
$resourceArray = array();
$rolesArray = array();
	if(isset($_GET['submit']))
	{
		$username = $_GET['username'];
		$actionName = $_GET['actionName'];
		$resourceName = $_GET['resourceName'];

		$get_userid_query = "select userId from users where username ='$username';";
		$get_actionid_query = "select actionId from actions where actionName ='$actionName';";
		$get_resourceid_query = "select resourceId from resources where resourceName ='$resourceName';";

		$result1 = mysqli_query($conn, $get_userid_query);
		$result2 = mysqli_query($conn, $get_actionid_query);
		$result3 = mysqli_query($conn, $get_resourceid_query);

		if(mysqli_num_rows($result1) > 0 )
		{
		$row1 = mysqli_fetch_assoc($result1);
		$userId =  $row1['userId'];
		echo $userId;echo "<br><br><br>";
		}

		if(mysqli_num_rows($result2) > 0 )
		{
		$row2 = mysqli_fetch_assoc($result2);
		$actionId =  $row2['actionId'];
		echo $actionId;echo "<br><br><br>";
		}

		if(mysqli_num_rows($result3) > 0 )
		{
		$row3 = mysqli_fetch_assoc($result3);
		$resourceId =  $row3['resourceId'];
		echo $resourceId;echo "<br><br><br>";
		}

		$sql_query4 = "select roleId from userroles where userId ='$userId';";
		$rolesArray = array();
		$result4 = mysqli_query($conn, $sql_query4);
		while($row4 = mysqli_fetch_assoc($result4))
		{
  	
  		array_push($rolesArray,$row4['roleId']); 

		}

		print_r($rolesArray);
		echo "<br>";

		foreach ($rolesArray as $ra)
		{
			
		$sql_query5 = "select actionId from roleactions where roleId ='$ra';";
		$result5 = mysqli_query($conn, $sql_query5);
		while($row5 = mysqli_fetch_assoc($result5))
		{
  		array_push($actionArray,$row5['actionId']); 
		}
		}
		print_r($actionArray);
		echo "<br>";

		foreach ($rolesArray as $ra)
		{
			
		$sql_query6 = "select resourceId from roleresources where roleId ='$ra';";
		$result6 = mysqli_query($conn, $sql_query6);
		while($row6 = mysqli_fetch_assoc($result6))
		{
  		array_push($resourceArray,$row6['resourceId']); 
		}
		}
		print_r($resourceArray);

		if((in_array ( $actionId, $actionArray ))&&(in_array ( $resourceId, $resourceArray)))
		{
			echo "authorised";
		}
		else
		{
			echo "unauthoried";
		}	
}

?>

<!DOCTYPE html>
<html>
<head>
	<title>fist php</title>
	<style type="text/css">
		select
		{
			width: 300px;
			height: 20px;
			font-size: 18px;
		}
	</style>
</head>
<body>
<h1>Role Based Access Control</h1>

<div>
	
	<form method="get" action="index.php">
<select name="username">
	<?php 
		$sql_query7 = "select username from users;";
		$result7 = mysqli_query($conn, $sql_query7);

		while ($row7 = mysqli_fetch_array($result7)){; 
	 ?>

	 <option value="<?php echo $row7[0]; ?>"><?php echo $row7[0]; ?></option>
	<?php } ?>
</select>



<select name="actionName">
	<?php 
		$sql_query8 = "select actionname from actions;";
		$result8 = mysqli_query($conn, $sql_query8);

		while ($row8 = mysqli_fetch_array($result8)){; 
	 ?>

	 <option value="<?php echo $row8[0]; ?>"><?php echo $row8[0]; ?></option>
	<?php } ?>
</select>


<select name="resourceName">
	<?php 
		$sql_query9 = "select resourcename from resources;";
		$result9 = mysqli_query($conn, $sql_query9);

		while ($row9 = mysqli_fetch_array($result9)){; 
	 ?>

	 <option value="<?php echo $row9[0]; ?>"><?php echo $row9[0]; ?></option>
	<?php } ?>
</select>

<input type="submit" name="submit">
	</form>
</div>

</body>
</html>