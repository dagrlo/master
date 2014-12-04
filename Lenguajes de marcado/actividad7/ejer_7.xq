xquery version "1.0";

element html{
  element body {   
   element ul{
      for $a in doc("./libros.xml")/bib/libro
        return
          element li{$a/titulo/text()}
   }
  }
}