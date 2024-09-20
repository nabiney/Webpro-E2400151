<?php
require 'users/connect.php';
if (isset($_GET['job_title']) || isset($_GET['company_name']) || isset($_GET['company_location'])) {
    $job_title = $_GET['job_title'] ?? '';
    $company = $_GET['company_name'] ?? '';
    $location = $_GET['company_location'] ?? '';

    // Secure the query to prevent SQL injection
    // $job_title = mysqli_real_escape_string($conn, $job_title);
    // $company = mysqli_real_escape_string($conn, $company);
    // $location = mysqli_real_escape_string($conn, $location);

    // Build the SQL query based on input
    $qry = "SELECT * FROM job_postings WHERE 1=1"; // 1=1 ensures that additional conditions can be appended safely
    $qry1 = "SELECT * FROM employers WHERE 1=1";
    $qry2 = "SELECT * FROM employers WHERE 1=1";

    if ($job_title != '') {
        $qry .= " AND job_title LIKE '%$job_title%'";
    }
    if ($company != '') {
        $qry1 .= " AND company_name LIKE '%$company_name%'";
    }
    if ($location != '') {
        $qry2 .= " AND location LIKE '%$company_location%'";
    }

    $result = $conn->query($qry);

    // Display results
    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            echo "<h2>" . $row['job_title'] . "</h2>";
            echo "<p>Company: " . $row['company'] . "</p>";
            echo "<p>Location: " . $row['location'] . "</p>";
            echo "<a href='/job-details.php?id=" . $row['id'] . "'>View Details</a>";
        }
    } else {
        echo "No jobs found.";
    }
}
?>
