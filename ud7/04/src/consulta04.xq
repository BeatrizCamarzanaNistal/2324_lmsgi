(: Consulta04: Nombre de los cursos impartidos por el profesor/a con el dni 33856315:)
for $c in collection('academia')/curso
for $x in collection('academia')/profesor
where $x/dni="33856315" and $x/nombre=$c/profesor
return data($c/nombre)
