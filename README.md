# SwiftLogix

Debemos tener instalado Docker, al descargar nuestro proyecto vamos a tener la siguiente estructura de carpetas:

```
-SwiftLogix
    -SwiftLogix
    -.gitignore
    -docker-compose.yml
    -README.md
```
ingresamos a la carpeta SwiftLogix y ejecutamos el siguiente comando:

```
docker-compose up mysql
```
este levanta una instancia de docker con mysql y la base de datos que vamos a utilizar, creando una nueva carpeta 
llamada db/mysql_data donde se almacena la base de datos.

Esto facilita el desarrollo ya que no es necesario tener instalado mysql en nuestra maquina.

Una vez levantada la base de datos, ahora si podemos levantar nuestra aplicación, desde intellij o desde la terminal
