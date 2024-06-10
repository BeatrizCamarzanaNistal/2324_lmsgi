(: Consulta10:)
<libros>
    {
      for $x in doc('books')//book
      let $y := count($x/author)
      return <libro autores="{$y}">{$x/title/text()}</libro>
    }
</libros>