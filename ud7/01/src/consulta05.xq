(: Consulta5 Pagina web:)
<html>
  <head>
    <tile>U7-1 Beatriz Camarzana</tile>
    <link href="css/estilos.css" type="text/css" rel="stylesheet"/>
  </head>
  <body>
    <header>
      <h1>Bookstore</h1>
    </header>
    <main>
      <article>
         <table>
           <thead>
             <tr>
               <th>Título</th>
               <th>Categoría</th>
             </tr>
           </thead>
           <tbody>
             {
               for $x in doc('books')/bookstore/book
               return <tr>
                         <td>{
                           data($x/title)
                         }</td>
                         <td>{
                           data($x/@category)
                         }</td>
                      </tr>
             }
           </tbody>
         </table> 
       </article>
       <article>
         <ul>
           {
             for $x in doc('books')/bookstore/book
             return 
               <li class="{data($x/@category)}">{data($x/title)}</li>
            }
         </ul>
       </article>
     </main>
  </body>
</html>
