xquery version "1.0";

element menores50{
  
for $a in doc("./libros.xml")/bib/libro
where $a/precio<50.0
return
$a/titulo

}