(:Consulta1: Listar los códigos y la media de las cantidades de los productos de color Rojo que han sido suministrados 
resultado:
p1 -- 333.33 
p4 --650.0 :)
for $x in doc('datos')/datos/productos/producto
let $color := $x/color
where $x/color='Rojo'
return $x[@numproducto]