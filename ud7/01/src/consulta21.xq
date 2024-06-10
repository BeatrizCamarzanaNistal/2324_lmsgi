(: Consulta21: Mostrar en la misma etiqueta el título y entre paréntesis el número de autores que tiene ese título.:)
for $book in doc('books')/bookstore/book
let $title := $book/title
return
    <book>
        <title>{concat($title,"(",count($book/author),")")}</title>
    </book>
