# SwiftLogix

## Como Descargar el proyecto
Debemos tener instalado Docker, al descargar nuestro proyecto vamos a tener la siguiente estructura de carpetas:

```
-SwiftLogix
    -SwiftLogix
    -db/mysql_data/dump.sql
    -.gitignore
    -docker-compose.yml
    -README.md
```
ingresamos a la carpeta SwiftLogix y validamos que no tenemos ninguna intancia de mysql corriendo:

```
cd .\SwiftLogix\

docker-compose down
```
Luego levantamos la base de datos con el siguiente comando:

```
docker-compose up mysql -d

cp dump.sql ./db/mysql_data/

```


este levanta una instancia de docker con mysql, debemos entrar dentro del contenedor con el siguiente comando

```
docker exec -it mysqlContainer /bin/bash
```
esto nos hara estar dentro del contendor y podremos ejecutar el siguiente comando para que los datos de la base de datos se carguen

```
mysql -u root -p swiftlogix < /var/lib/mysql/dump.sql

password: andes2020

exit

cd .\swiftlogix\

mvn clean install

cd ..

docker-compose up swiftlogix keycloak -d
```

## Como Actualizar el dump.sql para que se actualice la base de datos
una ves modificada la base de datos debemos actualizar el dump.sql para que al momento de subir el proyecto a git
se actualice este archivo, para que todos tengamos la misma base de datos, para esto debemos ejecutar el siguiente comando:

```
docker exec -it mysqlContainer /bin/bash
```
debemos asegurarlos que no hay un archivo dump.sql en la ruta /var/lib/mysql/dump.sql, si existe debemos eliminarlo

```
rm /var/lib/mysql/dump.sql
```

una ves verificado esto, ejecutamos el siguiente comando:

```
mysqldump -u root -p swiftlogix > dump.sql
password: andes2020

mv dump.sql /var/lib/mysql/

exit

rm .\dump.sql

mv .\db\mysql_data\dump.sql ./

```

## Como correr e instlar el front es facilito

```
cd frontEnd
npm install
npm run dev
corta wacho
```
