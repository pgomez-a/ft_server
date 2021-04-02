# ft_server

Este proyecto nos meterá de lleno en el mundo de los servidores web. Una vez que ya hemos visto <a href="https://github.com/pgomez-a/netwhat">cómo funciona la red</a>, damos un paso más para aprender a montar nuestro propio servidor desde cualquier dispositivo gracias al uso de Docker.

### Objetivos Principales
Tendremos que crear un servidor web con <b>Nginx</b>, dentro de un solo <b>contenedor Docker.</b> Este contenedor deberá funcionar sobre el sistema operativo <b>Debian Buster.</b> Además, nuestro servidor web tiene que ser capaz de funcionar con tres servicios diferentes: <b>Wordpress, PhpMyAdmin y MySQL</b>; y asegurarnos de que todos ellos funcionan conjuntamente. Cuando sea posible, nuestro servidor debe poder utilizar el <b>protocolo SSL.</b><br>
Por último, debemos ser capaces de gestionar nuestro servidor para que funcione con un <b>índice automático</b> que se pueda desactivar.<br>
<br>
Una vez entendido los objetivos, es hora de ponerse a leer y a aprender para poder montar nuestro <b>ft_server</b>. A continuación te dejo parte de la información que yo leí y estudié para poder montar mi servidor. No obstante, te aconsejo que leas todo lo que puedas sobre las tecnologías que se definen en los objetivo y en diferentes páginas para que no dependas así de una sola fuente de información.

### ¿Qué es un servidor?
Un servidor es un conjunto de computadoras capaz de atender a las peticiones de un cliente y devolver una respuesta en concordancia. El término servidor tiene dos significados en el ámbito de la informática: el primero hace referencia al ordenador (parte hardware) y el segundo hace referencia al programa que funciona en el ordenador (parte software):
<ul>
  <li><b>Servidor hardware:</b> máquina física integrada en una red informática en la que, además del Sistema Operativo (OS), funcionan uno o varios servidores basados en software. Una denominación alternativa para un servidor basado en hardaware es <b>host.</b></li>
  <li><b>Servidor software:</b> programa que ofrece un servicio especial que otros programas denominados <b>clientes</b> pueden usar a nivel local o a través de una red. El tipo de servicio depende del tipo de software del servidor. La base de la comunicación se centra en el modelo <b>cliente-servidor.</b></li>
</ul>

### ¿Cómo funciona un servidor?
El modelo <b>cliente-servidor</b> hace posible distribuir las tareas entre los diferentes ordenadores y hacerlas accesibles para más de un usuario final de manera independiente. Cada servicio disponible a través de una red será ofrecido por un servidor que está permanentemente en espera. Este es el único modo de asegurar que los clientes siempre tengan la posibilidad de acceder al servidor activamente y de usar el servicio en función de sus necesidades.

### ¿Cómo funciona un servidor web?
La tarea principal de un servidor web es la de guardar y organizar páginas web y entregarlas a clientes como navegadores web o <b>crowlers.</b> La comunicación entre servidor y cliente se basa en <b>HTTP</b>, es decir, en el protocolo de transferencia de hipertexto; o en HTTPS, que es su variante codificada. Por regla general, se transmiten documentos HTML y los elementos integrados en ella.<br>
Los servidores web más populares son: <b>HTTP Apache, Internet Information Server (ISS) y Nginx.</b>

### ¿Qué es Debian?
Debian es una organización formada totalmente por voluntarios dedicada a desarrollar software libre y promocinar los ideales de la comunidad del software libre. El proyecto Debian surge con la intención de crear una nueva <b>distribución (OS) basada en el núncle de Linux.</b><br>
<br>
<b>Linux</b> es un OS: un conjunto de programas que le permiten al usuario poder interactuar con el ordenador y ejecutar otros programas. Por tanto, podemos decir que un OS consiste en varios programas fundamentales que necesita el ordenador para poder comunicar y recibir instrucciones de los usuarios.<br>
La parte más importante de un OS es el núcleo. En el caso de Linux, este núcleo recibe el nombre de <b>kernel</b>, mientras que el resto del sistema consiste en otros programas, muchos de los cuales fueron desarrollados para el <b>proyecto GNU.</b> Dado que el núcleo de Linux no conforma por sí solo un OS, a lo que llamamos comunmente como Linux es en realidad <b>GNU/Linux.</b><br>
Linux está modelado como un OS de tipo Unix. Desde sus inicios se desarrolló para que fuera un sistema multitarea y multiusuarios:
<ul>
  <li><b>Multitarea:</b> permite que varios procesos o tareas se ejecuten aparentemente al mismo tiempo.</li>
  <li><b>Multiusuario:</b> permite proveer de servicio y procesamiento a varios usuarios simultáneamente.</li>
</ul>

##### ¿Qué es el proyecto GNU?
El proyecto GNU ha desarrollado un conjunto de herramientas de software libre para ser utilizadas por <b>UNIX</b> y otros <b>OS de tipo Unix</b>, como Linux. Estas tareas permiten tanto crear y eliminar ficheros como compilar programas, entre otras muchas cosas.

##### Árbol de directivas de Debian
La estructura de los direcorios de Linux, así como su contenido y funciones, viene definida en el <b>Filesystem Hierarchy Standard (FHS)</b>. Todo el árbol parte de una raíz común denominada <b>root (/)</b>. La <b>FHS</b> distingue entre:
<ul>
  <li><b>Directorios estáticos vs Directorios dinámicos.</b></li>
  <li><b>Directorios compartibles vs Directorios no compartibles.</b></li>
</ul>

##### root (/)
Desde donde nacen todos los demás directorios, independientemente de que estén almacenados físicamente en discos o en unidades separadas.

##### bin, sbin (/bin/ /sbin/)
Ambos son directorios estáticos. En el direcotorio <b>bin</b> se almacenan todos los binarios necesarios para garantizar las funciones básicas a nivel de usuario, entre los que se incluyen muchos de los comando utilizados diariamente como <b>cd, cat, cp, mv, etc.</b><br>
El directorio <b>sbin</b> hace lo mismo pero para los binarios relativos a las tareas propias del OS y que solamente puede gestionar el usuario root, tales como <b>restauración, arranque, etc.</b>

##### boot (/boot/)
Directorio estático que incluye todos los ejecutables y archivos necesarios en el proceso de arranque del sistema, y que deberán ser utilizados antes de que el kernel empiece a dar las órdenes de ejecución de los diferentes módulos del sistema.

##### dev (/dev/)
Incluye todos los dispositivos de almacenamiento, en forma de archivos, conectados al sistema. Es decir, cualquier disco duro, memoria USB, etc., que esté conectado al sistema y que el sistema pueda entender como un volumen lógico de almacenamiento. Este directorio contiene la información de cada uno de los volúmenes conectados al sistema.

##### etc (/etc/)
Encargado de almacenar los archivos de configuración tanto a nivel de componentes del sistema operativo en sí, como de los programas y aplicaciones instalados a posteriori.

##### home (/home/)
Directorio de los usuarios estándar y, por lo tanto, destinado a almacenar todos los archivos del usuario, como fotos, videos, documentos, etc. Dentro de /home/ nos encontramos con los directorios personales de todos los usuarios, nombrados según el nombre de usuario utilizado.

##### lib (/lib/)
Incluye las bibliotecas esenciales que son necesarias para que se puedan ejecutar correctamente todos los binarios que se encuentran en los directorios <b>/bin/</b> y <b>/sbin/</b>, así como los módulos del propio kernel.<br>
En los OS de 64 bits, además de /lib/ existe otro directorio denominado <b>/lib64/</b>, referido a las bibliotecas para aplicaciones de 64 bits.

##### media (/media/)
Representa el punto de montaje de todos los volúmenes lógicos que se montan temporalmente.

##### opt (/opt/)
Contiene todos aquellos archivos que son de solo lectura y que son parte de programas auto-contenidos y que, por tanto, no siguen los estándares de almacenar los diferentes archivos dentro de los diferentes subdirectorios.

##### proc (/proc/)
Contiene información de los procesos y aplicaciones que se están ejecutando en un momento dado en el sistema, pero realmente no guarda nada como tal, ya que los archivos que se almacenan son virtuales, por lo que su contenido es nulo.

##### root (/root/)
Vendría a ser como el directorio <b>/home/</b> del usuario root. Se encuentra separado del resto de usuarios del sistema.

##### srv (/srv/)
Sirve para almacenar archivos y directorios relativos a servidores instalados dentro del sistema.

##### sys (/sys/)
Al igual que <b>/proc/</b> contiene archivos virtuales que proveen información del kernel relativa a eventos del OS.

##### tmp (/tmp/)
Sirve para almacenar archivos temporales de todo tipo. Es un directorio pensado para almacenar archivos de corta duración, y suelen borrarse de forma automática al reiniciar el sistema. No obstante, estos archivos no deben borrarse de forma manual ya que pueden afectar a la funcionalidad de algún programa.<br>
Existe otro tmp en <b>/var/tmp/</b> dispuesto también para el almacenamiento de archivos temporales pero cuyo contenido no se borra al reiniciar el sistema.

##### usr (/usr/)
Sirve para almacenar todos los archivos de solo lectura y relativos a las utilidades de usuario, incluyendo todo el software instalado a través de los gestores de paquetes, como <b>apt-get.</b>

##### var (/var/)
Contiene varios archivos con información del sistema, como archivos de logs, emails de los usuarios del sistema, bases de datos, etc.

### Nginx
Famoso software de servidor web de código abierto. En términos prácticos se define como un software que procesa las solicitudes de los usuarios de la red y que garantiza que se lleve a cabo el intercambio de información.<br>
Su desarrollo se ha centrado en la creación de un servidor que se caracterice por un rendimiento muy alto, que sirva al mayor número de clientes posibles al mismo tiempo y que además consuma la menor cantidad de recursos posibles.<br>
Al igual que Apache, Nginx es un software modular. Esto significa que las diferentes características son presentadas en forma de módulos y, como administrador, pueden ser activadas o desactivadas. En caso de estar activadas, algunas de las características de las que goza el usuario son:
<ul>
  <li><b>Application Aceleration:</b> agiliza la entrega de contenidos.</li>
  <li><b>Servidor Proxy Inverso:</b> un proxy es un servidor que permite la comunicación de solicitud y respuesta entre cliente-servidor. El caso inverso, en que la solicitud la realiza el servidor, se trata de un proxy inverso.</li>
  <li><b>Cifrado TLS:</b> para una transferencia de datos segura.</li>
  <li><b>Gestión de ancho de banda:</b> para mejorar el rendimiento.</li>
</ul>
<br>
Mientras que Apache abre un proceso o hilo por cada solicitud de un cliente, Nginx trabaja <b>enfocado a eventos.</b> Apache, al crear un proceso por cada solicitud, malgasta recursos haciendo que la carga del servidor aumente y que el usuario tenga que esperar para poder acceder al servidor. Mientras tanto, Nginx es capaz de gestionar todas las solicitudes en pocos procesos gracias a su arquitectura orientada a eventos, lo que le permite ahorrar recursos.<br>

##### Directivas
Todos los archivos de configuración de Nginx se encuentran en el directorio <b>/etc/nginx/</b>, lo cual concuerda con la jerarquía FHS que veíamos en el apartado de <b>Debian.</b> El archivo principal de configuración es <b>nginx.conf.</b><br>
En Nginx las opciones de configuración reciben el nombre de <b>directivas.</b> Estas se organizan en grupos denominados bloques. En este archivo nos encontramos con cuatro directivas de configuración fundamentales:
<ul>
  <li><b>user:</b> define las credenciales de usuario y grupo utilizado por los procesos de trabajo.</b>
  <li><b>worker-processes:</b> define el número de procesos de trabajo. El valor óptimo depende de los componentes del computador. Por esto es aconsejable utilizar el valor <b>auto</b> para encontrar el valor óptimo para dicho valor.</li>
  <li><b>error_log:</b> configura el registro.</li>
  <li><b>pid:</b> define un archivo que almacenará el ID del proceso principal</li>
</ul>
Puedes crear archivos de configuración individuales para cada servidor virtual y guardarlos en la carpeta <b>/etc/nginx/sites-available/</b>, donde podrás modificarlos cada vez que necesites. Para que Nginx tome en cuenta estos cambios, los archivos deben estar en la carpeta <b>/etc/nginx/sites-enabled/</b>.<br>
El archivo de configuración principal recibe el nombre de <b>default</b>, y utiliza las siguientes directivas:
<ul>
  <li><b>listen:</b> especifica el puerto 80 como el estándar del servicio <b>HTTPS.</b></li>
  <li><b>root:</b> es la ruta del directorio con el contenido web.</li>
  <li><b>index:</b> archivos por defecto que se sirven cuando la URL no especifica un archivo en concreto.</li>
  <li><b>server_name:</b> dominio al que se asocia el servidor.</li>
</ul>

##### Configuración HTTPS con certificado SSL
El <b>certificado SSL</b> es un estándar de seguridad global que permite la transferencia de datos cifrados entre un navegador y un servidor web. Básicamente, la capa <b>SSL</b> permite que dos partes tengan una conversación privada. Para poder utilizar el protocolo seguro HTTPS en un servidor en pruebas o en red local, podremos utilizar <b>certificados autofirmados.</b><br>
Un <b>certificado autofirmado</b> es aquel que no ha sido validado por una <b>Autoridad Certificadora (CA)</b>. El nivel de cifrado puede ser igual al de cualquier otro tipo de certificado, pero al no estar validado por una CA, el navegador mostrará una advertencia cuando se muestre el sitio.<br>

##### Redireccionamiento HTTP a HTTPS
Normalmente, cuando un certificado SSL está instalado, tendremos 2 server blocks para el mismo dominio. El primero será para la versión HTTP en el puerto 80 y el segundo para la versión HTTPS en el puerto 443. De este modo, para conseguir una redirección HTTP a HTTPS, haremos que las peticiones relizadas en el puerto 80 sean redireccionadas de manera permanente mediante el uso de directivas especiales de redirección.

##### Snakeoil
Si has investigado un poco sobre certificados autofirmados puede que te hayas encontrado con el término <b>snakeoil.</b> Este término hace referencia a un concepto de criptografía utilizado para hacer referencia a cualquier método o producto criptográfico considerado falso o fraudulento.

##### Autoindex
De forma predeterminada, Nginx intenta mostrar una lista de directorios cuando una URL en particular termine en <b>/</b>. Por ejemplo, si usara una ruta <b>/assets/css/</b>, Nginx buscaría en el directorio <b>/css/</b> para ver si puede encontrar un <b>index.html</b> presente, y si no es así nos dará un error 404. Sin embargo, en el caso de que sí tenga un index.html en el directorio, Nginx lo usará para mostrar una lista de directorios de los archivos que hay dentro del directorio.

### LEMP Stack
<b>LEMP</b> es un grupo software que se puede utilizar para servir páginas web dinámicas y aplicaciones web. Este es un acrónimo que describe: el OS <b>Linux</b> (en nuestro caso Debian), con un servidor web <b>Nginx</b>, una base de datos <b>MySQL</b> (en nuestro caso MariaDB) y el procesamiento dinámico es manejado por <b>PHP</b>.

### MariaDB
Una <b>base de datos</b> es un conjunto de datos pertenecientes a un mismo contexto y almacenados sistemáticamente para su posterior uso. En informática, es una colección organizada de información estructurada, o <b>datos</b>, típicamente almacenados en un sistema de computadoras.<br> El software utilizado para gestionar una base de datos recibe el nombre de <b>"Database Management System" (DBMS).</b><br>
Existen dos tipos de bases de datos
<ul>
  <li><b>Bases de datos relacionales:</b> MySQL.</li>
  <li><b>Bases de datos no relacionales.</b> MongoDB.</li>
</ul>
<br>
Las bases de datos relacionales se basan en la organización de la información en partes pequeñas que se integran mediante indentificadores; a diferencia de las bases de datos no relacionales que, como su nombre indica, no tienen un identificador que sirva para relacionar dos o más conjuntos de datos.
<ul>
  <li>Cada tabla consiste en un conjunto de filas y de columnas.</li>
  <li>Cada fila contiene información sobre una sola entidad. Esto se conoce como <b>record.</b></li>
  <li>Cada columna contiene información sobre las entidades. Esto se conoce como <b>atributo</b> o <b>campo.</b></li>
</ul>
<br>
Una manera de gestionar los datos de una base de datos es <b>SQL.</b> Casi todos los DBMS's utilizan SQL, como <b>MariaDB</b> o <b>MySQL.</b><br>
<br>
Una vez instalado el servidor web Nginx, necesitamos un sistema de gestión de bases de datos para almecenar y gestionar los datos de nuestro sitio. En nuestro caso utilizamos <b>MariaDB.</b> MariaDB nos va a permitir crear nuestras propias bases de datos y tablas, así como decidir qué usuarios pueden acceder a ellos y modificarlos. Del mismo modo, MariaDB tiene una sintaxis sencilla que nos va a permitir hacer todo esto. Sin embargo, pese a su sencillez, nos puede resultar mucho más útil utilizar un panel de control para administrar nuestra base de datos. Este panel de control lo obtendremos con la instalación de <b>PhpMyAdmin.</b>

### PHP
Un sitio web es un sitio en la <b>World Wide Web</b> que contiene documentos organizados jerárquicamente. Cada documento contiene texto y/o gráficas que aparecen con información digital en la pantalla del ordenador. Una de las divisiones que podríamos hacer entre todos los tipos de páginas web existentes son:
<ul>
  <li><b>Página Web Estática:</b> aquella página enfocada principalmente a mostrar información permanente, donde el navegante se limita a obtener dicha información, sin poder interactuar con la página web.</li>
  <li><b>Página Web Dinámica:</b> aquella que contiene applicaciones dentro de la propia web, otorgando mayor interactividad con el navegante.</li>
</ul>
<br>
Las extensiones más habituales de las páginas web son:
<ul>
  <li><b>html, html, asp, jsp, php</b> --> únicamente los .html o .html son páginas web estáticas y ,por tanto, las únicas que podremos ver directamente en el navegador. El resto, para poder visualizarse, deberán estar contenidos en un servidor web. <b>Nginx</b> utiliza <b>FPM (FastCGI Process Manager)</b> para procesar los scripts de PHP. <b>FPM</b> es una buena alternativa a FastCGI.</li>
</ul>

### PhpMyAdmin
Herramienta escrita en <b>PHP</b> con la intención de manejar la administración de <b>MySQL</b> a través de páginas web utilizando un navegador web. Actualmente puede crear y eliminar bases de datos; crear, eliminar y alterar tablas; borrar, editar y añadir campos; etc.

### Wordpress
Wordpress es un sistema de gestión de contenidos enfocado a la creación de cualquier tipo de página web. Hay muchas aplicaciones de este tipo, las cuales se conocen también como <b>Content Management System (CMS)</b>. La razón por la cual usar este tipo de aplicaciones es muy simple: permiten crear webs y sus cnotenidos de una forma visual, sin tener que programar.

### Docker
La idea detrás de Docker es crear contenedores ligeros y portables para las aplicaciones software que puedan ejecutarse en cualquier máquina con Docker instalado, independientemente del OS que el sistema tenga por debajo. A la hora de hablar de Docker, manejaremos diferentes conceptos:
<ul>
  <li><b>Contenedor:</b> es algo autocontenido en sí, que se puede llevar de un lado a otro de forma independiente, es <b>portable.</b> Para que podamos acceder como usuarios normales a una aplicación, dicha aplicación software necesita estar ejecutándose en una máquina (contenedor). Dicho contenedor necesita tener instalados una serie de programas para que la aplicación se ejecute correctamente. Así pues, Docker me permite meter en un contenedor todos aquellos programas que mi ordenador necesita para que la aplicación sea ejecutada. De este modo, dicha aplicación podrá ser ejecutada en cualquier máquina que tenga Docker instalado, sin necesitar de ningún requisito más.</li>
  <li><b>Imagen:</b> una imagen es una representación estática de la aplicación o el servicio y de su configuración y dependencias. Para ejecutar la aplicación, se crea una instancia de la images de la aplicación para crear un contenedor, que se ejecutará en el host de Docker.</li>
  <li><b>Dockerfile:</b> archivo que utiliza Docker para leer una configuración. Contiene todos los comandos que queramos ejecutar en la línea de comandos para armar una imágen.</li>
</ul>
<br>
Una vez hayas leído un poco sobre Docker y cómo funciona, verás que hay una serie de comandos muy útiles que tendrás que utilizar con frecuencia. Mi objetivo con este README es que seas capaz de entender el por qué necesitas crear un servidor web y por qué utilizas los programas que utilizas, así que por eso me centraré únicamente en explicar el funcionamiento de cada uno sin poner ejemplos (recuerda que debes leer más de una fuente para realizar tus proyectos):
<ul>
  <li><b>docker images:</b> proporciona una lista de las imágenes instaladas. Estas imágenes aparecen en una tabla donde se indica: nombre de la imagen, versión utilizada, identificador único de la imagen, fecha de publicación y peso.</li>
  <li><b>docker search:</b> para buscar el nombre de la imagen que queremos instalar desde la consola de comandos.</li>
  <li><b>docker pull:</b> permite instalar una imagen.</li>
  <li><b>docker run:</b> nos permite ejecutar una imagen.</li>
  <li><b>docker ps:</b> nos permite ver los contenedores que se encuentran en ejecución.</li>
  <li><b>docker start:</b> vuelve a ejecutar un contenedor que ha sido parado.</li>
  <li><b>docker stop:</b> finaliza un contenedor que se encuentra en ejecución.</li>
  <li><b>docker rm:</b> elimina un contenedor que ya ha sido finalizado.</li>
  <li><b>docker attach:</b> nos permite establecer la conexión de un contenedor es primer plano.</li>
</ul>

### Vocabulario
<b>Crowler:</b> programa informático que inspecciona páginas de la World Wide Web de forma metódica y automatizada.
<b>Servicio:</b> conjunto de actividades que buscan responder a las necesidades de un cliente.
<b>Kernel Linux:</b> núcleo del OS Linux. Su principal función es encargarse de controlar el hardware del ordenador. Concretamente, este núcleo es el responsable de gestionar la memoria del sistema y el tiempo de los procesos.
<b>PID:</b> identificador de procesos, número entero usando por el kernel de algunos OS para identificar un proceso de forma unívoca. Es decir, cada proceso se numera para diferenciarlo del reso.
<b>Proceso:</b> programa en ejecución.
