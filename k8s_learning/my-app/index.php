<html>
 <head>
  <title>Testing PHP</title>
 </head>
 <body>
 <?php

 echo "<table style='border: solid 1px black;'>";
 echo "<tr><th>item_id</th><th>content</th><th>data</th></tr>";

 class TableRows extends RecursiveIteratorIterator {
     function __construct($it) {
         parent::__construct($it, self::LEAVES_ONLY);
     }

     function current() {
         return "<td style='width:150px;border:1px solid black;'>" . parent::current(). "</td>";
     }

     function beginChildren() {
         echo "<tr>";
     }

     function endChildren() {
         echo "</tr>" . "\n";
     }
 }



 $username = "test_user";
 $password = "1234567";
 $dbname = "test_db";
 $table = "todo_list2";
 $servername = "mysql";

 try {
   $conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
   $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
   $stmt = $conn->prepare("SELECT item_id, content, data FROM $table");
   $stmt->execute();

   // set the resulting array to associative
   $result = $stmt->setFetchMode(PDO::FETCH_ASSOC);
   foreach(new TableRows(new RecursiveArrayIterator($stmt->fetchAll())) as $k=>$v) {
     echo $v;
   }
 } catch(PDOException $e) {
   echo "Error: " . $e->getMessage();
 }
 $conn = null;

echo "</table>";
phpinfo();
?>
 </body>
</html>
