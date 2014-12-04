xquery version "1.0";

element libros{
 for $a in doc("./libros.xml")/bib/libro
 return
  if ($a/autor) then
     element libro{element titulo{$a/titulo/text()},element autores{$a/autor}}
     else
     element libro{element titulo{$a/titulo/text()}, element editorial{$a/editorial/text()}}
   
}