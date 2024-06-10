(: Consulta18: Mostrar la suma total de los precios con la etiqueta total:)
let $x := doc('books')/bookstore/book
return (<total>{sum($x/price)}</total>)
  