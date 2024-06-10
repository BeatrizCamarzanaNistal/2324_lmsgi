(:consulta08: Mostrar la suma total de los precios con la etiqueta total:)
let $x := doc('libros')/bookstore/book
return <total>{sum($x/price)}</total> 

