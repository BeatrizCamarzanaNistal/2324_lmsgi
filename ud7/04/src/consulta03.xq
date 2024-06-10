(: Consulta03: Nombre del curso, precio, tipo de cuota:)
for $c in collection('academia')/curso
return (data($c/nombre),data($c/precio),data($c/@cuota))
