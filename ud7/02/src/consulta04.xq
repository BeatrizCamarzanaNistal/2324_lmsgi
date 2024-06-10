(:consulta04: Mostrar cuántos libros hay, y etiquetarlo con “total” :)
let $x := doc('libros')/bookstore/book
return <total>{count($x)}</total>
