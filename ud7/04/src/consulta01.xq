(: Consulta01:Código del aula del “Aula 1”:)
for $x in collection('academia')/aula
where $x/nombre="Aula 1"
return data($x/@id)
(:for $x in collection('academia')/aula[$x/nombre="Aula 1"]
return data($x/@id):)
