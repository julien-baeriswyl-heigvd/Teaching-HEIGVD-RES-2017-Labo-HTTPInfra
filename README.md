# Teaching-HEIGVD-RES-2017-Labo-HTTPInfra


## Objectives

The first objective of this lab is to get familiar with software tools that will allow us to build a **complete web infrastructure**. By that, we mean that we will build an environment that will allow us to serve **static and dynamic content** to web browsers. To do that, we will see that the **apache httpd server** can act both as a **HTTP server** and as a **reverse proxy**. We will also see that **express.js** is a JavaScript framework that makes it very easy to write dynamic web apps.

The second objective is to implement a simple, yet complete, **dynamic web application**. We will create **HTML**, **CSS** and **JavaScript** assets that will be served to the browsers and presented to the users. The JavaScript code executed in the browser will issue asynchronous HTTP requests to our web infrastructure (**AJAX requests**) and fetch content generated dynamically.

The third objective is to practice our usage of **Docker**. All the components of the web infrastructure will be packaged in custom Docker images (we will create at least 3 different images).

## General instructions

* This is a **BIG** lab and you will need a lot of time to complete it. This is the last lab of the semester (but it will keep us busy for 6 weeks!). You will also have time during the Monday lectures to work on it.
* We have prepared webcasts for a big portion of the lab (what can get you the "base" grade).
* To get **additional points**, you will need to do research in the documentation by yourself (we are here to help, but we will not give you step-by-step instructions!). To get the extra points, you will also need to be creative (do not expect complete guidelines).
* You will get only one grade for the lab, but it will a 3x factor (so far, you have 4 lab grades).
* The lab can be done in **groups of 2 students**. You will learn very important skills and tools, which you will need to next year's courses. You cannot afford to skip this content if you want to survive next year.
* Read carefully all the **acceptance criteria**.
* Be careful with the deadlines.
* It is your responsibility to schedule the demo sessions (plan ahead and show your results ASAP).
* When you do your **demo**, be prepared to that you can go through the procedure quickly (there are a lot of solutions to evaluate!)


## Step 1: Static HTTP server with apache httpd

### Webcasts

* [Labo HTTP (1): Serveur apache httpd "dockerisé" servant du contenu statique](https://www.youtube.com/watch?v=XFO4OmcfI3U)

### Acceptance criteria

* You have a GitHub repo with everything needed to build the Docker image.
* You do a demo, where you build the image, run a container and access content from a browser.
* You have used a nice looking web template, different from the one shown in the webcast.
* You are able to explain what you do in the Dockerfile.
* You are able to show where the apache config files are located (in a running container).
* You have documented your configuration in your report.

## Step 2: Dynamic HTTP server with express.js

### Webcasts

* [Labo HTTP (2a): Application node "dockerisée"](https://www.youtube.com/watch?v=fSIrZ0Mmpis)
* [Labo HTTP (2b): Application express "dockerisée"](https://www.youtube.com/watch?v=o4qHbf_vMu0)

### Acceptance criteria

* You have a GitHub repo with everything needed to build the Docker image.
* You do a demo, where you build the image, run a container and access content from a browser.
* You generate dynamic, random content and return a JSON payload to the client.
* You cannot return the same content as the webcast (you cannot return a list of people).
* You don't have to use express.js; if you want, you can use another JavaScript web framework or event another language.
* You have documented your configuration in your report.


## Step 3: Reverse proxy with apache (static configuration)

### Webcasts

* [Labo HTTP (3a): reverse proxy apache httpd dans Docker](https://www.youtube.com/watch?v=WHFlWdcvZtk)
* [Labo HTTP (3b): reverse proxy apache httpd dans Docker](https://www.youtube.com/watch?v=fkPwHyQUiVs)
* [Labo HTTP (3c): reverse proxy apache httpd dans Docker](https://www.youtube.com/watch?v=UmiYS_ObJxY)


### Acceptance criteria

* You have a GitHub repo with everything needed to build the Docker image for the container.
* You do a demo, where you start from an "empty" Docker environment (no container running) and where you start 3 containers: static server, dynamic server and reverse proxy; in the demo, you prove that the routing is done correctly by the reverse proxy.
* You can explain and prove that the static and dynamic servers cannot be reached directly (reverse proxy is a single entry point in the infra). 
* You are able to explain why the static configuration is fragile and needs to be improved.
* You have documented your configuration in your report.


## Step 4: AJAX requests with JQuery

### Webcasts

* [Labo HTTP (4): AJAX avec JQuery](https://www.youtube.com/watch?v=fgpNEbgdm5k)

### Acceptance criteria

* You have a GitHub repo with everything needed to build the various images.
* You do a complete, end-to-end demonstration: the web page is dynamically updated every few seconds (with the data coming from the dynamic backend).
* You are able to prove that AJAX requests are sent by the browser and you can show the content of th responses.
* You are able to explain why your demo would not work without a reverse proxy (because of a security restriction).
* You have documented your configuration in your report.

## Step 5: Dynamic reverse proxy configuration

### Webcasts

* [Labo HTTP (5a): configuration dynamique du reverse proxy](https://www.youtube.com/watch?v=iGl3Y27AewU)
* [Labo HTTP (5b): configuration dynamique du reverse proxy](https://www.youtube.com/watch?v=lVWLdB3y-4I)
* [Labo HTTP (5c): configuration dynamique du reverse proxy](https://www.youtube.com/watch?v=MQj-FzD-0mE)
* [Labo HTTP (5d): configuration dynamique du reverse proxy](https://www.youtube.com/watch?v=B_JpYtxoO_E)
* [Labo HTTP (5e): configuration dynamique du reverse proxy](https://www.youtube.com/watch?v=dz6GLoGou9k)

### Acceptance criteria

* You have a GitHub repo with everything needed to build the various images.
* You have found a way to replace the static configuration of the reverse proxy (hard-coded IP adresses) with a dynamic configuration.
* You may use the approach presented in the webcast (environment variables and PHP script executed when the reverse proxy container is started), or you may use another approach. The requirement is that you should not have to rebuild the reverse proxy Docker image when the IP addresses of the servers change.
* You are able to do an end-to-end demo with a well-prepared scenario. Make sure that you can demonstrate that everything works fine when the IP addresses change!
* You are able to explain how you have implemented the solution and walk us through the configuration and the code.
* You have documented your configuration in your report.

## Additional steps to get extra points on top of the "base" grade

### Load balancing: multiple server nodes (0.5pt)

* You extend the reverse proxy configuration to support **load balancing**. 
* You show that you can have **multiple static server nodes** and **multiple dynamic server nodes**. 
* You prove that the **load balancer** can distribute HTTP requests between these nodes.
* You have documented your configuration and your validation procedure in your report.

### Load balancing: round-robin vs sticky sessions (0.5 pt)

* You do a setup to demonstrate the notion of sticky session.
* You prove that your load balancer can distribute HTTP requests in a round-robin fashion to the dynamic server nodes (because there is no state).
* You prove that your load balancer can handle sticky sessions when forwarding HTTP requests to the static server nodes.
* You have documented your configuration and your validation procedure in your report.

### Dynamic cluster management (0.5 pt)

* You develop a solution, where the server nodes (static and dynamic) can appear or disappear at any time.
* You show that the load balancer is dynamically updated to reflect the state of the cluster.
* You describe your approach (are you implementing a discovery protocol based on UDP multicast? are you using a tool such as serf?)
* You have documented your configuration and your validation procedure in your report.

### Management UI (0.5 pt)

* You develop a web app (e.g. with express.js) that administrators can use to monitor and update your web infrastructure.
* You find a way to control your Docker environment (list containers, start/stop containers, etc.) from the web app. For instance, you use the Dockerode npm module (or another Docker client library, in any of the supported languages).
* You have documented your configuration and your validation procedure in your report.

## Report

### Preface
To avoid repeating manually commands to build, start and stop containers, a `Bash` script called `manager.sh` is used.  
Two basic options exist, `--start` and `--stop`.  

### Step 1
#### Docker configuration
Static app is available through _Docker_ container from image `res/apache_php`, built on folder `apache-php-image`,  
containing static pages.  
_Docker_ image is based on `php:5.6-apache` which provide both PHP interpreter and Apache 2 web server.  
Inside container, Apache 2 server is available on port 80.  
Container is exposed from port 9090 of docker virtual machine.  

#### Static app content
I choose to use [`New Age`](https://startbootstrap.com/template-overviews/new-age/) _Bootstrap_ template as main page.  
I linked two more templates named [`SB Admin 2`](https://startbootstrap.com/template-overviews/sb-admin-2/) and [`Creative`](https://startbootstrap.com/template-overviews/creative/) to main page, through navigation bar of [`New Age`](https://startbootstrap.com/template-overviews/new-age/) modified template.  

All content is stored in `site` folder which is copied at _Docker_ image build time.  
Folder `site` contains [`New Age`](https://startbootstrap.com/template-overviews/new-age/) template.  
Inside this template are added `creative` and `sbadmin2` containing other secondary templates.  

##### Modifications of [`New Age`](https://startbootstrap.com/template-overviews/new-age/) `index.html` file

 + Title of page
 + H1 content
 + navbar-header title
 + Two links in nav bar called `Dashboard` and `Creative`
 + Part concerning download has been deleted.

### Step 2
#### Docker configuration
Same as before, but with new container available.  
I created [`Express.js`](https://expressjs.com/) server running on port 3000, inside a _Docker_ container of image `res/express_api`, built on folder `express-image`.  
Server use `Node.js` to manage dependencies.  
_Docker_ image is based on `node:4.4`.  
Container is exposed from port 9091 of docker virtual machine.  

#### Server functionalities
Server provides list (size between 0 and 10) of `JSON` objects containing fake data about places.  
Some address is generated, along with sentence and some iPhone wallpaper URL (25 available, useful in [`New Age`](https://startbootstrap.com/template-overviews/new-age/) template).  

On the other hand, server also provide wallpaper sending.  
It allows to get image corresponding to generated URL.  

To summary, server possess two routes (notice both use `/api/` as a start):  

 + `/api/places`
 + `/api/img/:imgname`

Use packages are:  

 + Express
 + Chance (used to generate random data)

### Step 3
#### Docker configuration
This time, previous container are still available, but inaccessible through port mapping.  
Objective is centralize accesses to both static and dynamic server through reverse proxy.  
Reverse proxy will serve as unique entry point through whole application.  

In order to achieve this goal, I used new _Docker_ image named `res/apache_rp`, based on `php:5.6-apache`.  
Image is built on folder `reverse-proxy-image`.  
The resulting container will be exposed through port mapping on port 9090 (in replacement of all previous port mapping).  
Its role will be receive requests and transmit them to right servers, static or dynamic from step 1 and 2.  
Then, response is collected and sent by reverse proxy to requester.  

#### Apache configuration files in image `php:5.6-apache`
Configuration files are located in `/etc/apache2/` folder.  
This folder contains (not complete list):  

 + `apache2.conf`, main configuration file
 + `sites-available` folder, containg virtual hosts configuration files
 + `sites-enabled` folder, containing current active sites (or virtual hosts)
 + `mods-available` folder, containing configuration files for Apache 2 modules
 + `mods-enabled` folder

#### Apache configuration as reverse proxy
Apache 2 provide modules named `proxy` and `proxy_http`, which allow to use Apache web server as reverse proxy.  
Reverse proxy works on basis of routes and destination server.  
In configuration, these routes must appear from most specific to less specific, eventually with default route.  

In my case, only two servers are concerned, both static and dynamic from step 1 and 2.  
Dynamic server possess more specfific routes, each of them beginning with `/api/`.  
Static has less specific and heteroclitic routes, and can be referenced directly in default route `/`.  

Moreover, in order to be reactive to right accesses, domain name `demo.res.ch` is used as server name,  
implying URL host has to be this domain name.  

This domain name is fictive and does not exists outside local private network, meaning my computer is not able to resolve IP address from this domain name.  
In order to allow resolution, file `/etc/hosts` on UNIX-like operating systems, or `C:\WINDOWS\system32\drivers\etc\hosts` on Microsoft Windows series must be edited, to add IP address and domain name.  
In my case, it is `192.168.42.42 demo.res.ch`.  

About configuration files in folder `sites-available`, `000-default.conf` is reduced to empty virtual host, while `001-reverse-proxy.conf` contains all routes and destinations for reverse proxy.  

#### About IP address destination of routes
These IP address come from _Docker_ containers.
Each container has an IP address.  
By default, container address is inside subnet `172.17.0.0/16` called `bridge`.  
Address allocation works on first-come/first-served principle, meaning address of a container from specific image can be different, according to others existing containers.  

This must be a problem.
Because my proxy configuration is static, IP addresses have to remain same between each executions, to allow reverse proxy to keep working correctly.  

In order to avoid this problem, I prepared my own subnet in _Docker_, called `resnet13`.  
In this subnet, only mine containers are in execution, allowing me to use static IP address for my containers.  
I only have to be sure to kill all my containers in this subnet, before relaunching my app.  

### Step 4
This step consists of modifying static page content (from server of step 1), on the fly, directly in web browser.  
To achieve this, I used JavaScript in static page.  
Newly created script get data from dynamic server of step 2, and use received data to modify page.  
Modifications are periodic, meaning each defined time interval, script will acquire data and modify page again.  

#### Modifications of [`New Age`](https://startbootstrap.com/template-overviews/new-age/) template

 + Include new script called `res-api.js` through `script` markup, at end of `index.html` file
 + Create script called `res-api.js` in `js` folder of template
 + Script behavior:
    - use `setInterval`, with 4000 milisecond and function called `loadPlaces`.
    - `loadPlaces` fetch data, and choose first item of data (if available).
    - `loadPlaces` then change H1 of page, and image inside iPhone background.

### Step 5
In this step, objective is to get rid of static reverse proxy configuration, and replace it with configuration generated on the fly, at start of proxy container, implying both static and dynamic servers have to be launch before, in order to get their IP address.  

To allow providing these IP address to container, environment variables are passed to container through _Docker_ `run` with option `-e`.  
These environment variables can be accessed through many programming and scripting languages.  
In my case, I used PHP, which access these variable through function `getenv`.  
Once recuperated, these variable can be used to fill blanks in template reverse proxy configuration.  
Then, filled template can be copied in Apache 2 confuguration folder, at place reserved in step 3.  

However, this PHP script has to be executed before lauching Apache 2.  
To do this, a modified version of `Bash` script called `apache2-foreground` from image `php:5.6-apache` is used.  
This script is modified to launch PHP interpreter with newly created script `config-template.php`.  

Furthermore, in order to try different IP addresses on containers, I have modified my script `manager.sh`.  
Now, my script can launch container and get IP address on the fly, with help of generated id and `docker inspect --format=... <cid>` command.  
With this, I can retrieve IP address and pass it directly to reverse proxy container, at its creation.  

This implies I don't need anymore subnet created in step 3, nor static IP address.  

### Bonus: load-balancing
In order to use load balancers of Apache 2, some modules must added.  
I use two balancers, one per server type, static or dynamic.  
Now, reverse proxy reference balancers and not IP addresses.  

I extended my `manager.sh` script in order to pass IP addresses in same previous environment variables.  
Format is `ip1:port1,ip2:port2,...,ipN:portN`.  

At start of reverse proxy container, some new files called `balancer-static.conf` and `balancer-dynamic.conf` are copied.  
These files are included by `001-reverse-proxy.conf` and contains balancer information.  

These two files are modified on the fly by `apache2-foreground` script, with received environment variables.  

_Remarks_:
 + `config-template.php` has been abandoned, since `Bash` does all the work.  
 + default behavior of Apache 2 balancers is round-robin.  
 + `balancer-manager` and `server-status` handlers have been added to configuration of reverse proxy.  
   They can be accessed through URI `/res-balancer` and `/res-status`.  

### Bonus: load-balancing with sticky sessions, dynamic tests
In this step, I modified balancer of static servers to manage sticky sessions.  
Apache 2 possess some [configuration options](https://httpd.apache.org/docs/2.4/fr/mod/mod_proxy_balancer.html) for this feature.  
We define some route id for each member and server keep track of used route, according to requester.  

In my reverse proxy image, I changed my `apache2-foreground`, in order to generate route ids on the fly, when each member is added to balancer configuration.  

Of course base options like `Header` and `ProxySet` have been added directly in `balancer-static.conf`.  

On the other hand, a script called `apachetools.sh` has been added to reverse proxy image, in order to change apache configuration more easily.  

`manager.sh` script has been extended to test balancer, with help of batches of requests.
