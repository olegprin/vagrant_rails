LOUNCH RAILS APPLICATION VIA VAGRANT

1). config.yaml
  - set where apllication situated on the local machine (in folder working application which has name ansible_rails) should be ~/working/ansible_rails

2). config.yaml
  -set ip where application will be lounch on local machines

3). Vagrantfile
    -add the name of system_synced_folder from config.yaml, like this:
    app.vm.synced_folder configs['system_synced_folder']['local'], configs['system_synced_folder']['remote']
  

LOUNCH:
  - vagrant up
  - vagrant ssh

  -ls (should see name of you application)
  -cd ansible_rails (go inside application)
  -rails s -b 10.10.10.102 (you should have acsept via browser on ip 10.10.10.102)

COMMAND
  -delete VM
    vagrant destroy
  - power off (exit from vagrant with helps command "exit") and then:
    vagrant halt


Questions?

Have a look at our FAQs for users, for pod administrators or for developers.

Still haven't found an answer? Talk to us! Read how we communicate. We're here to answer all your questions.

Contribute

To keep game* growing and improving we need all help we can get. Whether you can contribute code, ideas,translations,bug reports or simply extend the community as a helpful user or pod administrator, your help is welcome!

Everyone interacting in game codebases, issue trackers, chat rooms, mailing lists, the wiki,game and the Loomio group is expected to follow the game* code of conduct.

Security

Found a security issue? Please disclose it responsibly. We have a team of developers listening to support@everprin.com. The PGP fingerprint is AB0D AB02 0FC5 D398 03AB 3CE1 6F70 243F 27AD 886A.


