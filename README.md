Ansible: Onadata [![Build Status](https://travis-ci.org/onaio/ansible-onadata.svg?branch=master)](https://travis-ci.org/onaio/ansible-onadata)
================

This role installs and configures [Ona Data](https://github.com/onaio/onadata).

Check the [examples](./examples) directory for example deployments.

Requirements
------------

Ona Data requires the following services to be set up (not handled by this role):
  - PostgreSQL 9.6
  - RabbitMQ (if Celery broker set to RabbitMQ)
  - Redis (if Celery results backend or caching set to Redis)
  - Memcached (if Celery results backend or caching set to Memcached)
  - An MQTT Broker (if MQTT support is enabled). EMQTT recommended

Role Variables
--------------

Dependencies
------------

Role dependencies are:
  - [onaio.ssl-certificates](https://github.com/onaio/ansible-ssl-certificates)
  - [onaio.django](https://github.com/onaio/ansible-django)

Example Playbook
----------------

License
-------

Apache 2
