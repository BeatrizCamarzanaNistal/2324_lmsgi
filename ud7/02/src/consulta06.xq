(:consulta06:Mostrar el precio mínimo y el máximo de los libros :)
<libro>
{
  let $x := doc('libros')/bookstore/book
return (
  <precio_max>{max($x/price)}</precio_max>,
  <precio_min>{min($x/price)}</precio_min>
)
}</libro>
