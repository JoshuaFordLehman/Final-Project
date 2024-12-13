<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Reservations</title>
    <link rel="stylesheet" href="css/styles.css">
</head>
<body>
<header>
    <h1>All Reservations</h1>
</header>

<nav>
    <a href="index.php">Home</a>
    <a href="add_reservation.php">Add Reservation</a>
    <a href="view_reservations.php">View Reservations</a>
</nav>

<main>
    <h2>Current Reservations</h2>
    <table>
        <tr>
            <th>Reservation ID</th>
            <th>Customer Name</th>
            <th>Reservation Time</th>
            <th>Number of Guests</th>
            <th>Special Requests</th>
        </tr>
        <?php foreach ($reservations as $reservation): ?>
        <tr>
            <td><?= htmlspecialchars($reservation['reservationId']) ?></td>
            <td><?= htmlspecialchars($reservation['customerId']) ?></td>
            <td><?= htmlspecialchars($reservation['reservationTime']) ?></td>
            <td><?= htmlspecialchars($reservation['numberOfGuests']) ?></td>
            <td><?= htmlspecialchars($reservation['specialRequests']) ?></td>
        </tr>
        <?php endforeach; ?>
    </table>
</main>

<footer>
    <p>&copy; 2024 The Medieval Feast</p>
</footer>
</body>
</html>
