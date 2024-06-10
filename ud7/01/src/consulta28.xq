(: Consulta28: 8. Mostrar los títulos en una tabla de HTML.:)

  <html>
    <head>
        <title>Consulta28-Beatriz-Camarzana</title>
     </head>
     <body>
         <table>
               {for $x in doc('../data/books.xml')/bookstore/book
                return <tr>
                      <td>{$x/title}</td>
                 </tr> }
         </table>
     </body>
  </html>
