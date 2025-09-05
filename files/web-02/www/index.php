<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Terraform S3 Website</title>
    <link rel="stylesheet" href="./style.css">
    <link rel="icon" href="./favicon.ico" type="image/x-icon">
  </head>
  <body>
    <main>
        <h3>web-02: Welcome to the Ansible Terraform Nginx Website</h3>
        <?php
        $username = getenv('PHP_USERNAME');
        $password = getenv('PHP_PASSWORD');
        $database = getenv('DATABASE_NAME');
        $table = "dry_weights";
        $columns = "ounce, tbsp, cup, gram";

        try {
          $db = new PDO("mysql:host=localhost;dbname=$database", $username, $password);
          echo "<h3>Dry Weights</h3>"; 
          echo "<table>"; 
          echo "<tr>"; 
          echo "<th>Ounce</th>"; 
          echo "<th>Tbsp</th>"; 
          echo "<th>Cup</th>"; 
          echo "<th>Gram</th>"; 
          echo "</tr>"; 
          foreach($db->query("SELECT * FROM $table") as $row) {
            echo "</tr>";
            echo "<td>" . $row['ounce']. "</td>";
            echo "<td>" . $row['tbsp']. "</td>";
            echo "<td>" . $row['cup']. "</td>";
            echo "<td>" . $row['gram']. "</td>";
            echo "</tr>";
          }
          echo "</table>";
        } catch (PDOException $e) {
            print "Error!: " . $e->getMessage() . "<br/>";
            die();
        }
        ?>
    </main>
  </body>
</html>


