xquery version "1.0";
element libros{
  
for $a in doc("./libros.xml")/bib/libro
  where $a/editorial="Addison-Wesley"
return
  if ($a/@anyo>1991) then 
      element libro {attribute anyo {string($a/@anyo)}, element titulo {$a/titulo/text()}}
        else()        
}