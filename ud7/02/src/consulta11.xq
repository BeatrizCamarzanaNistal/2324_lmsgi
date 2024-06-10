(:consulta11: Mostrar en la misma etiqueta el título y entre paréntesis el número de autores que tiene ese título:)
<book>{
     for $x in doc('books')/bookstore/book
    let $y := $x/title
    return <title>{concat($y,"(",count($x/author),")")}</title>
      }
</book>

