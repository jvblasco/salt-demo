# Overview

This repository is the ubuntu server salt states implementation to run laravel, wordpress and magento applications.

It is designed to deploy 3 tier server architectures for magento, but the other apps can easily be implemented in that architecture too.

# How to read this code

You will see that that there is a directory for each service where you may need to implement the server architecture. In this case, taking magento as a reference, you can see the the php, mysql, php, nginx and haproxy services. There are also services that are common in some server architectures like an nfs service. And last you can see common things in every server in any environment like deploying users, base system configurations, the firewall, brute force prevention (fail2ban) or the openssh configuration.

There is another directory called applications where you can find the states that are required to deploy each application. You may see that there is a common directory here that contains the common things deployed in almost all applications. Inside each application there is a servers directory where you can see the definition of each server role for different architectures be it a single server or a 3 tier server architecture.

Then in the top.sls file you can check an example of how a 3 tier architecture is defined.

As a note you will find a map.jinja file in each service or application where you can see the variables that you can define to configure that service. Most or all of them have a default value. This variables usually come from what is called in Saltstack the pillar. As you will see in some points in the code, for example in the nginx configuration template, I also use the grains salt subsystem. There are also other subsystems in Saltstack, but are not relevant to understand this repository.

# Understanding the code in Ansible terms

To ease reading the code in the repository there are some concepts that are almost equivalent between salt and ansible.

The inventory in ansible would be the top.sls file here in salt. This should be your entrypoint to understand what would be deployed in a server.

A module or task, in this repository would be a state. And is the lowest unit of work. A state defines declaratively what we want to happen in the machine (for example for some user to exist or some service to be up and running).

The playbook would be a directory for a service in this repository. In this case the directories mysql or nginx would be a playbook for those services.

The collections would be the servers directory contained in each application. Salt is a really flexible when defining this kind of things. Salt doesn't really care about all this concepts it only cares about the yaml files that contain the states. How you organize them is apt to you.

Lastly the salt pillar would be equivalent to the variables file in ansible. According to ansible documentation they are usually placed in the inventory, the re-usable files or the roles. The Saltstack grains subsystem is equivalent to the facts in ansible, it's the object that contains the machine information.
