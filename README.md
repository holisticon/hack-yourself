# hack-yourself
Sample project showing how to hack your own servers

> **Legal Disclaimer**:
> * Users are responsible for usage of the prepared setup
> * We does not encourage, condone, or orchestrate attempts to hack into other servers or any other illegal activities. The writings and instructions contained inside this website are entertainment / educational purposes only
> * We are not responsible if you break the law using techniques listed on this website. This setup is provided to users so that they may learn how to protect their own websites/web applications with similar vulnerabilities learned from the challenges

## Prerequisite

 * Docker for mac or download docker from [Docker](https://www.docker.com/)
 * Check if you have 10GB space available in your HD
 * Docker composer to make it easy to run at local.

## What's included

![](docs/images/docker-compose.png)

###  Official Kali Linux Docker
This Kali Linux Docker image provides a minimal base install of the latest version of the Kali Linux Rolling Distribution.
There are no tools added to this image, so you will need to install them yourself.
For details about Kali Linux metapackages, check the [homepage](https://www.kali.org/news/kali-linux-metapackages/)

#### Features in Kali Docker image
* Metasploit Framework (https://www.metasploit.com/)

### Local Wordpress for Evaluation

* Preconfigured WordPress 4.6
* MySQL Container

## Usage

# Setup Instructions
* Clone the repo from `https://github.com/holisticon/hack-yourself.git`.
* `./start.sh`
* Your environment is ready

# Setup your project locally for pentesting
(Its not good practice yo run the pentesting on the prod server or the unauthorized server, its not legal so I am suggesting this to run on local and these instruction will help you to setup the project at local server, try to make the same sever as your project has on public facing).

# Run the demo code
After running `./start.sh` your already inside the kali container and can run nikto etc. against the local wordpress:
```
nikto -C all -host blog_app
wpscan blog_app

```
Run attack against blog inside docker:
```
/usr/local/scripts/wp_2017-8295.sh <use-your-mail-domain-here> blog_app admin
```

Run attack against [SpringBoot App](https://github.com/holisticon/SpringBreakVulnerableApp) inside docker:
```
/usr/local/scripts/sb_2017-8046.sh sb_app:8080 calc.exe
```

https://github.com/holisticon/SpringBreakVulnerableApp
# Troubleshooting
-- To be added

# Want to contribute?
###  Development
* Please fork and raise a PR to review
### Issues
* Please create an issue under https://github.com/holisticon/hack-yourself/issues


## Contributors
* **Martin Reinhardt** *Technical Architect* - [HyperY2K](http://github.com/hypery2k/)
* **Ravindra Singh**  *Technical Architect* - [RavindraSingh22](http://github.com/ravindrasingh22/)


## Update dependency graph

```
docker run --rm -it --name dcv -v $(pwd):/input pmsipilot/docker-compose-viz render -m image docker-compose.yml &&\
  mv docker-compose.png docs/images/
```
