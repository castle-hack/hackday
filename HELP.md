# Read Me First
The following was discovered as part of building this project:

* The original package name 'com.morganstanley.wukir-hackday-2023' is invalid and this project uses 'com.morganstanley.wukirhackday2023' instead.

# Getting Started

### Reference Documentation
For further reference, please consider the following sections:

* [Official Apache Maven documentation](https://maven.apache.org/guides/index.html)
* [Spring Boot Maven Plugin Reference Guide](https://docs.spring.io/spring-boot/docs/3.0.1/maven-plugin/reference/html/)
* [Create an OCI image](https://docs.spring.io/spring-boot/docs/3.0.1/maven-plugin/reference/html/#build-image)
* [Spring Web](https://docs.spring.io/spring-boot/docs/3.0.1/reference/htmlsingle/#web)

### Guides
The following guides illustrate how to use some features concretely:

* [Building a RESTful Web Service](https://spring.io/guides/gs/rest-service/)
* [Serving Web Content with Spring MVC](https://spring.io/guides/gs/serving-web-content/)
* [Building REST services with Spring](https://spring.io/guides/tutorials/rest/)


### Notes from Kira
1. to access azure portal: innovation lab jumphost
2. to access development tools: 
      - 1. you can choose to create ubuntu instance, I only have server access
      - 2. github ssh key setup:
                a. generate new public private key
                ```
                    ssh-keygen -t ed25519 -C "your github mail"
                    eval "$(ssh-agent -s)" # start up the ssh agent 
                    ssh-add ~/.ssh/<your private key>
                    cat ~/.ssh/<your public key >
                ```
                b. add the key to ssh agent so you dont have to login 
                c. add the public key to github so it can verify you 
                settings:
                    -> ssh seßttings
                    -> copy the ssh public key 
      - 3. fork the github project: click in github to fork 
      - 3. git clone <your fork's url>
3. Changing basic variables to fit your usage
    Terraform folder:
        - variables.tf : defines the variables file 
        - *.tfvars: define the value of the variables
        - *.tf: define the recipe of the infrastructure 
        
    - change the userid in hackday2023.tfvars

4. Github Action:
the github action is set to run on pull request to the main branch, so when you checking a change to your fork, unless it is trying to pull request to my repo it wont trigger github action. you should only run github action in my repo because I have the azure credentials

    - .github/workflow/terraform.yml
    - setup up jobs, get the action repository (automatic)
    - azcli login , the AZURE_CREDENTIALS is generated for our SPN (Trent got Contributor access, PCTS will likely autowired it in github action later)
    - an az account show to show which SPN we are using 
    - checkout the git repository 
    - Setup Terraform (automatic) in this github agent
    - Terraform Format: check the format of my terraform tf file 
    - Terraform Init: check state file 
