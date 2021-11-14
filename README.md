# Project-13-
## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

![TODO: Update the path with the name of your diagram](Images/diagram_filename.png)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the playbook.yml file may be used to install only certain pieces of it, such as Filebeat.

  - _TODO: Enter the playbook file.

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available, in addition to restricting access to the network.
- TODO: What aspect of security do load balancers protect? What is the advantage of a jump box?
The load balancer protects an organization against distributed denial-of-service (DDos) attacks. A jump box creates separation between a user's workstation and the privileged assets within the network.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the data and system logs.
- TODO: What does Filebeat watch for?
        Filebeat monitors the log files or locations that you specify, collect log events, and forwards them to Elasticsearch or Logstash for indexing.  

- TODO: What does Metricbeat record?
        Metricbeat records metrics and statistics from the services running on the server such as Apache.

The configuration details of each machine may be found below.
_Note: Use the [Markdown Table Generator](http://www.tablesgenerator.com/markdown_tables) to add/remove values from the table_.

| Name     | Function | IP Address | Operating System |
|----------|----------|------------|------------------|
| Jump Box |Gateway   |20.112.31.213| Linux (Ubuntu)  |
| Web 1    |Web Server|10.0.0.8    | Linux (Ubuntu)   |
| Web 2    |Web Server|10.0.0.6    | Linux (Ubuntu)   |
| Web 3    |Web Server|10.0.0.11   | Linux (Ubuntu)   |             
| ELK      |ElasticSearch Stack 13.88.102.62| Linux (Ubuntu)|
### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Jumpbox machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
- TODO: Add whitelisted IP addresses
         20.112.31.213

Machines within the network can only be accessed by Jumpbox machine.
- TODO: Which machine did you allow to access your ELK VM? What was its IP address?
         Jumpbox machine. 20.112.31.213

A summary of the access policies in place can be found in the table below.

| Name     | Publicly Accessible | Allowed IP Addresses |
|----------|---------------------|----------------------|
| Jumpbox  | Yes                 | 24.1.123.170         |
| Web_VM_1 | No                  | 20.112.31.213        |
| Web_VM_2 | No                  | 20.112.31.213        |
| Web_VM_3 | No                  | 20.112.31.213        |
| ElkVM    | Yes                 | 24.1.123.170         |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...
- _TODO: What is the main advantage of automating configuration with Ansible?
The ultimate advantage is that the same configuration can be automated and deployed to multiple machines, as opposed to tediously deploying the configuration to each machine in an isolated manner.          

The playbook implements the following tasks:
- _TODO: In 3-5 bullets, explain the steps of the ELK installation play. E.g., install Docker; download image; etc.
- 1. Installed Docker and Ansible on the Jumpbox machine, enabling playbook automation to push software services to other machines.
- 2. Added ELK VM to Hosts file under a separate Group header (ELK).
- 3. Run Playbook file via ansible-playbook command, therefore pushing tasks to all machines assigned/configured to receive.

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

![TODO: Update the path with the name of your screenshot of docker ps output](Images/docker_ps_output.png)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
TODO List the IP addresses of the machines you are monitoring
     10.0.0.8, 10.0.0.6, 10.0.0.11

We have installed the following Beats on these machines:
TODO Specify which Beats you successfully installed
Filebeat and Metricbeat have been installed to monitor the three Web_VM's.

These Beats allow us to collect the following information from each machine:
- TODO: In 1-2 sentences, explain what kind of data each beat collects, and provide 1 example of what you expect to see. E.g., `Winlogbeat` collects Windows logs, which we use to track user logon events, etc.
Filebeat allows the ELK Server to monitor files being accessed, whether by authorized or unauthorized users. It keeps track of access, so if there were changes made to sensitive files, the user can figure out when this event took place, which is incredibly important. If a user altered or accessed the shadow or passwd files, this allows us valuable intelligence into when and how this was done.
Metricbeat allows the ELK Server to monitor valuable usage metrics like CPU usage, memory usage, and monitors what is coming in and out of the server at specified moments in time. This allows for a user to further configure or change/add assets when there may be high traffic volume or usage volume.

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the playbook file to _____.
- Update the playbook file to include 
- Run the playbook, and navigate to virtual machine to check that the installation worked as expected.

_TODO: Answer the following questions to fill in the blanks:
- Which file is the playbook? .yml file
  Where do you copy it? It is usually copied into a container.
  Which file do you update to make Ansible run the playbook on a specific machine?
  hosts file 

How do I specify which machine to install the ELK server on versus which to install Filebeat on?
The hosts file allows for grouping of machines so that you can control where you want resources to be deployed.

- Which URL do you navigate to in order to check that the ELK server is running?
  [VM_Public_IP:5601/app/kibana]
_As a **Bonus**, provide the specific commands the user will need to run to download the playbook, update the files, etc._
