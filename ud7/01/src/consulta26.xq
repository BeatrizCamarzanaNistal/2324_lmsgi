(: Consulta25: Mostrar todos los años en los que se ha publicado un libro eliminando los repetidos. Etiquétalos con "año".:)
for $x in doc('../data/books.xml')/bookstore/book
return <anyo>{distinct-values($x/year)}</anyo>
