<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Reservation</title>
    <link rel="stylesheet" href="css/styles.css">
</head>
<body>
<header>
    <h1>Add Reservation</h1>
</header>

<nav>
    <a href="index.php">Home</a>
    <a href="add_reservation.php">Add Reservation</a>
    <a href="view_reservations.php">View Reservations</a>
</nav>

<main>
    <h2>Make a Reservation</h2>
    <form method="POST" action="index.php?action=addReservation">
        <label for="customer_id">Customer ID:</label>
        <input type="text" id="customer_id" name="customer_id" required><br><br>

        <label for="reservation_time">Reservation Time:</label>
        <input type="datetime-local" id="reservation_time" name="reservation_time" required><br><br>

        <label for="number_of_guests">Number of Guests:</label>
        <input type="number" id="number_of_guests" name="number_of_guests" required><br><br>

        <label for="special_requests">Special Requests:</label>
        <textarea id="special_requests" name="special_requests"></textarea><br><br>

        <button type="submit">Submit</button>
    </form>
</main>

<footer>
    <p>&copy; 2024 The Medieval Feast</p>
</footer>
</body>
</html>
