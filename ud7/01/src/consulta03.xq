(: Consulta3 Pagina web:)
<html>
  <head>
    <title>Consulta 3.Lista de alumnos</title>
  </head>
  <body>
  <h1>Listado de libros</h1>
    <ul>
      {
        for $x in doc('books')/bookstore/book
        order by $x/title
        where $x/price>30
        return <li>{$x/title/text()}</li>
      }
    </ul>
  </body>
</html>
