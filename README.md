# ft_server

This project will put us fully into the world of web servers. Once we have seen <a href="https://github.com/pgomez-a/netwhat"> how the network works </a>, we take another step to learn how to set up our own server from any device thanks to Docker.

### Main objectives
We will have to create a web server with <b> Nginx </b>, within a single <b> Docker container. </b> This container must work on the <b> Debian Buster operating system. </b> Also, our web server has to be able to work with three different services: <b> Wordpress, PhpMyAdmin and MySQL </b>; and make sure they all work together. When possible, our server should be able to use the <b> SSL protocol. </b> <br>
Lastly, we must be able to manage our server so that it works with an <b> automatic index </b> that can be disabled. <br>
<br>
Once the objectives are understood, it is time to read and learn in order to configure our <b> ft_server </b>. Here is some of the information that I read and studied in order to configure my server. However, I advise you to read as much as you can about the technologies that are defined in the objectives and on different pages so that you do not depend on a single source of information.

### What is a server?
A server is a set of computers capable of attending to the requests of a client and returning a response accordingly. The term server has two meanings in the field of computing: the first refers to the computer (hardware part) and the second refers to the program that runs on the computer (software part):
<ul>
  <li><b> Hardware server: </b> physical machine integrated into a computer network in which, in addition to the Operating System (OS), one or more software-based servers operate. An alternative name for a hardware-based server is <b> host. </b></li>
  <li><b> Server software: </b> program that offers a special service that other programs called <b> clients </b> can use locally or through a network. The type of service depends on the type of server software. The basis of communication is centered on the <b> client-server model. </b></li>
</ul>

### How does a server work?
The <b> client-server </b> model makes it possible to distribute tasks among different computers and make them accessible to more than one end user independently. Each service available through a network will be offered by a server that is permanently on standby. This is the only way to ensure that customers always have the ability to actively access the server and use the service according to their needs.

### How does a web server work?
The main task of a web server is to save and organize web pages and deliver them to clients such as web browsers or <b> crowlers. </b> Communication between server and client is based on <b> HTTP </b>, that is, in the hypertext transfer protocol; or in HTTPS, which is its encoded variant. As a rule, HTML documents and the elements embedded in it are transmitted. <br>
The most popular web servers are: <b> HTTP Apache, Internet Information Server (ISS) and Nginx. </b>

### What is Debian?
Debian is an all-volunteer organization dedicated to developing free software and promoting the ideals of the free software community. The Debian project arises with the intention of creating a new <b> distribution (OS) based on the Linux kernel. </b> <br>
<br>
<b> Linux </b> is an OS: a set of programs that allows the user to interact with the computer and run other programs. Therefore, we can say that an operating system consists of several fundamental programs that the computer needs to be able to communicate and receive instructions from users.
The most important part of an OS is the kernel, while the rest of the system consists of other programs, many of which were developed for the <b> GNU project. </b> Since the Linux kernel does not by itself make up an OS, what we commonly refer to as Linux is actually <b> GNU / Linux. </b>
<br>
Linux is modeled after a Unix-type OS. From the beginning, it was developed to be a multi-tasking and multi-user system:
<ul>
  <li><b> Multi-tasking: </b> allows several processes or tasks to run apparently at the same time.</li>
  <li><b> Multi-user: </b> allows to provide service and processing to several users simultaneously.</li>
</ul>

##### What is the GNU project?
The GNU project has developed a set of free software tools to be used by <b> UNIX </b> and other <b> Unix-type OS </b>, such as Linux. These tasks allow both creating and deleting files and compiling programs, among many other things.

##### Debian Directory Tree
The structure of Linux directories, as well as their content and functions, is defined in the <b> Filesystem Hierarchy Standard (FHS) </b>. The whole tree starts from a common root called <b> root (/) </b>. The <b> FHS </b> distinguishes between:
<ul>
  <li><b> Static Directories vs Dynamic Directories. </b></li>
  <li><b> Shareable Directories vs Non-Shareable Directories. </b></li>
</ul>

##### root (/)
From where all other directories are born, regardless of whether they are physically stored on disks or on separate drives.

##### bin, sbin (/bin/ /sbin/)
They are both static directories. In the directory <b> bin </b> all the necessary binaries are stored to guarantee the basic functions at the user level, including many of the commands used daily such as <b> cd, cat, cp, mv, etc. </b> <br>
The <b> sbin </b> directory does the same, but for binaries related to the tasks of the OS and that can only be managed by the root user, such as <b> restoring, booting, etc. </b>

##### boot (/boot/)
Static directory that includes all the executables and files necessary in the system boot process, and that must be used before the kernel begins to give the execution orders of the different system modules.

##### dev (/dev/)
It includes all storage devices, in the form of files, connected to the system. That is, any hard drive, USB memory, etc., that is connected to the system and that the system can understand as a logical storage volume. This directory contains the information for each of the volumes connected to the system.

##### etc (/etc/)
In charge of storing the configuration files both at the level of components of the operating system itself, as well as the programs and applications installed later.

##### home (/home/)
Standard user directory and therefore intended to store all user files such as photos, videos, documents, etc. Inside /home/ we find the home directories of all users, named according to the username used.

##### lib (/lib/)
It includes the essential libraries that are necessary so that all the binaries found in the <b> /bin/ </b> and <b> /sbin/ </b> directories can run correctly, as well as the modules of the same kernel. <br>
On 64-bit OS, in addition to / lib / there is another directory called <b> / lib64 / </b>, referring to libraries for 64-bit applications.

##### media (/media/)
Represents the mount point of all logical volumes that are temporarily mounted.

##### opt (/opt/)
It contains all those files that are read-only and that are part of self-contained programs and that, therefore, do not follow the standards of storing the different files within the different subdirectories.

##### proc (/proc/)
It contains information about the processes and applications that are running at any given time on the system, but it doesn't really save anything as such, since the files that are stored are virtual, so their content is null.

##### root (/root/)
It would be like the <b> /home/ </b> directory of the root user. It is separated from the rest of the users of the system.

##### srv (/srv/)
It is used to store files and directories related to servers installed within the system.

##### sys (/sys/)
Like <b> /proc/ </b> it contains virtual files that provide kernel information regarding OS events.

##### tmp (/tmp/)
It is used to store temporary files of all kinds. It is a directory designed to store short-lived files, and they are usually deleted automatically when the system is restarted. However, these files should not be deleted manually as they may affect the functionality of some programs. <br>
There is another tmp in <b> /var/tmp/ </b> arranged also for the storage of temporary files but whose content is not deleted when the system is restarted.

##### usr (/usr/)
It is used to store all files that are read-only and related to user utilities, including all software installed through package managers, such as <b> apt-get. </b>

##### var (/var/)
It contains several files with system information, such as log files, emails from system users, databases, etc.

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
