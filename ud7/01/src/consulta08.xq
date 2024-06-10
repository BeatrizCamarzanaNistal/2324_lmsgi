(: Consulta8:)
<html>
  <head>
    <title></title>
  </head>
  <body>
    <header>
      <h1></h1>
    </header>
    <main>
      {
        for $tema in (1 to 8), $y in (1,2,3)
        return 
          <div> 
            <a href="{concat($tema,'/',$y,'.html')}">Tema: {$tema} Ejercicio {$y}</a>
          </div>
      }
    </main>
  </body>
</html>