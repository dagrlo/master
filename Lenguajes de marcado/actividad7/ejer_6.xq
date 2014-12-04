xquery version "1.0";

declare function local:ordena( $seq ) {
   for $item in $seq
   order by $item
   return $item
 } ;

declare function local:compara($x,$y){
  let $i:=local:ordena($x)
  let $j:=local:ordena($y)
 
    
  return   deep-equal($i,$j)
};

element mismoAut{
  for $a in doc("./libros.xml")/bib/libro
   for $b in doc("./libros.xml")/bib/libro
     
    return
     if (local:compara($a,$b)) then
        element a{element c{local:compara($a/autor,$b/autor)}, element t{$a/titulo},element t2{$b/titulo}} else ()
     (: element kk{element a {$a/libro/titulo},element b {$b/libro/titulo}}:)
}