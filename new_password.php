
  <!-- Change password form -->
	<form class="text-center border border-light p-5 mx-auto mt-3" style="width:30%" method="POST" action="change_password.php">

		<p class="h4 mb-4">Change the password</p>

		<!-- Old password -->
		<input type="password" name="pass1" class="form-control mb-4" placeholder="New password">

		<!-- New assword -->
		<input type="password" name="pass2" class="form-control mb-4" placeholder="Confirm password">
		<input type="hidden" id="email" name="email" value="<?php echo $_GET["email"];?>" class="form-control mb-4" placeholder="New password">
				
		<!-- Change password button -->
		<button class="btn btn-info btn-block my-4" type="submit">Change password</button>

				

	</form>
  <!-- Change password form -->




