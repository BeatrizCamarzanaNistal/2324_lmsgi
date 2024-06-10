(: Consulta02:Nombre de los cursos que se imparten en el “Aula 1”:)
for $c in collection('academia')/curso
for $a in collection('academia')/aula[nombre="Aula 1"]
where $c/aula=$a/@id
return data($c/nombre)
