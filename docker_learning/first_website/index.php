<html>
 <head>
  <title>WEB-K8S</title>
 </head>
 <body>
 <?php
$ip_server = $_SERVER['SERVER_ADDR'];

echo "<h1>Hello from K8S</h1><br>";
echo "Server IP Address is: $ip_server","<br><p>";

phpinfo();
?>
 </body>
</html>
