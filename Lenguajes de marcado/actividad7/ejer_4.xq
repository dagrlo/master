xquery version "1.0";

element libros{
  
for $a in doc("./libros.xml")/bib/libro
for $b in doc("./comentarios.xml")/comentarios/entrada[titulo=$a/titulo/text()]
return
element libro {
   element titulo{$a/titulo/text()},
   element precio1{$a/precio/text()},
   element precio2{$b/precio/text()}
}

}