(: Consulta16:Mostrar el precio mínimo y el máximo de los libros:)
<precios>{
    let $x := doc('books')/bookstore/book
    return (
        <minimo>{min($x/price)}</minimo>,
        <maximo>{max($x/price)}</maximo>
      )
  }
</precios>

