(: Consulta05: ¿Qué cursos no han finalizados?:)
for $c in collection('academia')/curso[data(fin)>=data(format-date(current-date(),'[D]/[M]/[Y]'))]
return data($c/nombre)
    