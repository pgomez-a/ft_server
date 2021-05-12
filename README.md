# ft_server
<img width="1925" alt="ft_server" src="https://user-images.githubusercontent.com/74931024/117972486-81592200-b32b-11eb-9fa5-730b688b0c1f.png">

This project will put us fully into the world of web servers. Once we have seen <a href="https://github.com/pgomez-a/netwhat"> how the network works </a>, we take another step to learn how to set up our own server from any device thanks to Docker.

### How to run the server?
To create the image, within the main directory you must use:

    docker build -t ft_server .
    
Once the images are created, to create the web server:

    docker run -d -p 80:80 -p 443:443 ft_server

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
Famous open source web server software. In practical terms it is defined as a software that processes the requests of the users of the network and that guarantees that the exchange of information takes place. <br>
Its development has focused on creating a server that is characterized by a very high performance, that serves as many clients as possible at the same time and that also consumes the least amount of resources possible. <br>
Like Apache, Nginx is modular software. This means that the different features are presented in the form of modules and, as an administrator, they can be activated or deactivated. If activated, some of the features that the user enjoys are:
<ul>
  <li><b> Application Acceleration: </b> streamlines content delivery.</li>
  <li><b> Reverse Proxy Server: </b> a proxy is a server that allows request and response communication between client-server. The reverse case, where the request is made by the server, is a reverse proxy.</li>
  <li><b> TLS encryption: </b> for secure data transfer.</li>
  <li><b> Bandwidth management: </b> to improve performance.</li>
</ul>
<br>
While Apache opens a process or thread for each request from a client, Nginx works <b> focused on events. </b> Apache, by creating a process for each request, wastes resources making the server load increase and the user has to wait to be able to access the server. Meanwhile, Nginx is able to handle all requests in a few processes thanks to its event-oriented architecture, which saves resources. <br

##### Directives
All Nginx configuration files are located in the <b> /etc/nginx/ </b> directory, which is related with the FHS hierarchy that we saw in the <b> Debian section. </b> The main configuration file is <b> nginx.conf. </b> <br>
In Nginx, configuration options are called <b> directives. </b> These are organized in groups called blocks. In this file we find four fundamental configuration directives:
<ul>
  <li><b> user: </b> defines the user and group credentials used by worker processes.</b></li>
  <li><b> worker-processes: </b> defines the number of worker processes. The optimal value depends on the components of the computer. For this reason, it is advisable to use the value <b> auto </b> to find the optimal value for that value.</li>
  <li><b> error_log: </b> configures the log.</li>
  <li><b> pid: </b> defines a file that will store the ID of the main process.</li>
</ul>
You can create individual configuration files for each virtual server and save them in the <b> /etc/nginx/sites-available/ </b> folder, where you can modify them whenever you need. For Nginx to take these changes into account, the files must be in the <b> /etc/nginx/sites-enabled/ </b> folder. <br>
The main configuration file is named <b> default </b>, and uses the following directives:
<ul>
  <li><b> listen: </b> specifies the port through which <b> HTTP communication is made. </b></li>
  <li><b> root: </b> is the path of the directory with the web content.</li>
  <li><b> index: </b> default files that are served when the URL does not specify a specific file.</li>
  <li><b> server_name: </b> domain to which the server is associated.</li>
</ul>

##### HTTPS configuration with SSL certificate
The <b> SSL certificate </b> is a global security standard that enables the transfer of encrypted data between a browser and a web server. Basically, the <b> SSL </b> layer allows two parties to have a private conversation. In order to use the secure HTTPS protocol on a test server or on a local network, we can use <b> self-signed certificates. </b> <br>
A <b> self-signed certificate </b> is one that has not been validated by a <b> Certificate Authority (CA) </b>. The level of encryption can be the same as any other type of certificate, but as it is not validated by a CA, the browser will display a warning when the site is displayed. <br>

##### HTTP to HTTPS redirection
Normally, when an SSL certificate is installed, we will have 2 server blocks for the same domain. The first will be for the HTTP version on port 80 and the second for the HTTPS version on port 443. In this way, to achieve an HTTP redirection to HTTPS, we will make the requests made on port 80 be permanently redirected using special redirect directives.

##### Snakeoil
If you've done some research on self-signed certificates you may have come across the term <b> snakeoil. </b> This term refers to a cryptography concept used to refer to any cryptographic method or product considered false or fraudulent.

##### Autoindex
By default, Nginx tries to display a list of directories when a particular URL ends in <b> / </b>. For example, if you were to use a <b> /assets/css/ </b> path, Nginx would look in the <b> /css/ </b> directory to see if it can find an <b> index.html </b> > present, and if not, it will give us a 404 error. However, if it does have an index.html in the directory, Nginx will use it to display a directory list of the files within the directory.

### LEMP Stack
<b> LEMP </b> is a group of software that can be used to serve dynamic web pages and web applications. This is an acronym that describes: the OS <b> Linux </b> (in our case Debian), with a <b> Nginx </b> web server, a <b> MySQL </b> database ( in our case MariaDB) and dynamic processing is handled by <b> PHP </b>.

### MariaDB
A <b> database </b> is a set of data belonging to the same context and systematically stored for later use. In computing, it is an organized collection of structured information, or <b> data </b>, typically stored in a computer system. <br> The software used to manage a database is called <b> "Database Management System "(DBMS). </b> <br>
There are two types of databases:
<ul>
  <li><b> Relational databases: </b> MySQL.</li>
  <li><b> Non-relational databases. </b> MongoDB.</li>
</ul>
<br>
Relational databases are based on the organization of information in small parts that are integrated by means of identifiers; unlike non-relational databases, which, as the name suggests, do not have an identifier that can be used to relate two or more data sets.
<ul>
  <li>Each table consists of a set of rows and columns.</li>
  <li>Each row contains information about a single entity. This is known as a <b> record. </b></li>
  <li>Each column contains information about the entities. This is known as <b> attribute </b> or <b> field. </b></li>
</ul>
<br>
One way to manage the data in a database is <b> SQL. </b> Almost all DBMSs use SQL, like <b> MariaDB </b> or <b> MySQL. </b> <br>
<br>
Once the Nginx web server is installed, we need a database management system to store and manage the data for our site. In our case we use <b> MariaDB. </b> MariaDB will allow us to create our own databases and tables, as well as decide which users can access and modify them. In the same way, MariaDB has a simple syntax that will allow us to do all this. However, despite its simplicity, it can be much more useful to use a control panel to manage our database. We will obtain this control panel with the installation of <b> PhpMyAdmin. </b>

### PHP
A website is a site on the <b> World Wide Web </b> that contains hierarchically organized documents. Each document contains text and / or graphics that appear with digital information on the computer screen. One of the divisions that we could make between all the types of existing web pages are:
<ul>
  <li><b> Static Web Page: </b> that page mainly focused on displaying permanent information, where the navigator is limited to obtaining said information, without being able to interact with the web page.</li>
  <li><b> Dynamic Web Page: </b> one that contains applications within the web itself, providing greater interactivity with the navigator.</li>
</ul>
<br>
The most common extensions of web pages are:
<ul>
  <li><b> html, htm, asp, jsp, php </b> -> only the .html or .htm are static web pages and, therefore, the only ones that we can see directly in the browser. The rest, in order to be viewed, must be contained in a web server. <b> Nginx </b> uses <b> FPM (FastCGI Process Manager) </b> to process PHP scripts. <b> FPM </b> is a good alternative to FastCGI.</li>
</ul>

### PhpMyAdmin
Tool written in <b> PHP </b> with the intention of managing <b> MySQL </b> administration through web pages using a web browser. You can currently create and delete databases; create, delete and alter tables; delete, edit and add fields; etc.

### Wordpress
Wordpress is a content management system focused on the creation of any type of web page. There are many applications of this type, which are also known as <b> Content Management System (CMS) </b>. The reason why using this type of application is very simple: they allow you to create websites and their contents in a visual way, without having to program.

### Docker
The idea behind Docker is to create lightweight and portable containers for software applications that can run on any machine with Docker installed, regardless of the operating system that the system has underneath. When talking about Docker, we will handle different concepts:
<ul>
  <li><b> Container: </b> is something self-contained in itself, which can be carried from one place to another independently, it is <b> portable. </b> So that we can access an application as normal users, said software application needs to be running on a machine (container). This container needs to have a series of programs installed for the application to run correctly. Thus, Docker allows me to put in a container all those programs that my computer needs for the application to be executed. In this way, said application can be run on any machine that has Docker installed, without the need for any further requirements.</li>
  <li><b> Image: </b> an image is a static representation of the application or service and its configuration and dependencies. To run the application, an instance of the application images is created to create a container, which will run on the Docker host. </li>
  <li> <b> Dockerfile: </b> file that Docker uses to read a configuration. It contains all the commands that we want to execute on the command line to build an image.</li>
</ul>
<br>
Once you have read a little about Docker and how it works, you will see that there are a number of very useful commands that you will have to use frequently. My goal with this README is for you to be able to understand why you need to create a web server and why you use the programs you use, so that is why I will focus solely on explaining how each one works without giving examples (remember that you must read more than one source to carry out your projects):
<ul>
  <li><b> docker images: </b> provides a list of installed images. These images appear in a table where it is indicated: image name, version used, unique identifier of the image, publication date and weight.</li>
  <li><b> docker search: </b> to find the name of the image that we want to install from the command console.</li>
  <li><b> docker pull: </b> allows you to install an image</li>
  <li><b> docker run: </b> allows us to run an image.</li>
  <li><b> docker ps: </b> allows us to see the containers that are running.</li>
  <li><b> docker start: </b> reruns a container that has been stopped.</li>
  <li><b> docker stop: </b> ends a running container</li>
  <li><b> docker rm: </b> removes a container that has already been terminated.</li>
  <li><b> docker attach: </b> allows us to establish the connection of a container in the foreground.</li>
</ul>

### Vocabulary
<b> Crowler: </b> computer program that inspects pages of the World Wide Web in a methodical and automated way.<br>
<b> Service: </b> set of activities that seek to respond to the needs of a client.<br>
<b> Linux kernel: </b> Linux OS kernel. Its main function is to be in charge of controlling the computer hardware. Specifically, this kernel is responsible for managing the system memory and the time of the processes.<br>
<b> PID: </b> process identifier, integer number used by the kernel of some OS to uniquely identify a process. That is, each process is numbered to differentiate it from the rest.<br>
<b> Process: </b> running program.<br>

### To end
I have many more things noted in the notebook. If you want to discuss some of the topics covered here or if you have any questions, do not hesitate to contact me. I will be happy to talk about these technologies and help you with anything. 😉
