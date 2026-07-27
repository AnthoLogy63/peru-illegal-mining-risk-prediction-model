#import "@preview/charged-ieee:0.1.4": ieee

#show: ieee.with(
  title: [Artículo de Prueba IEEE],
  abstract: [
    Este es un documento de prueba utilizando la plantilla IEEE en Typst. 
    Aquí verificamos el uso de múltiples autores y la integración de la bibliografía desde un archivo `.bib` externo.
  ],
  authors: (
    (
      name: "Autor Uno",
      department: [Departamento de Ingeniería],
      organization: [Universidad de Prueba],
      location: [Lima, Perú],
      email: "autor1@prueba.edu"
    ),
    (
      name: "Autor Dos",
      department: [Departamento de Ciencias],
      organization: [Universidad de Prueba],
      location: [Lima, Perú],
      email: "autor2@prueba.edu"
    ),
    (
      name: "Autor Tres",
      department: [Facultad de Sistemas],
      organization: [Instituto Tecnológico],
      location: [Arequipa, Perú],
      email: "autor3@instituto.edu"
    ),
    (
      name: "Autor Cuatro",
      department: [Centro de Investigación],
      organization: [Universidad del Norte],
      location: [Trujillo, Perú],
      email: "autor4@norte.edu"
    ),
  ),
  index-terms: ("Typst", "IEEE", "Prueba", "Bibliografía"),
  bibliography: bibliography("sources/references.bib"),
)

= Introducción
Este es un documento de prueba que emplea el paquete `charged-ieee` de Typst.
A continuación, citaremos un artículo de nuestra bibliografía para verificar que funcione correctamente @ma2021image.

= Metodología
La plantilla permite escribir texto en dos columnas con un formato ajustado al estándar de los proceedings de IEEE.

= Conclusión
Hemos configurado los 4 autores requeridos y enlazado exitosamente el archivo `.bib`.
