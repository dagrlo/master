xquery version "1.0";

for $b in doc("libros.xml")/bib/libro[titulo="Advan Programming for Unix environment"]

return
$b