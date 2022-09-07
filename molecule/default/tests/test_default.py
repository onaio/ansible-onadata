import os

import testinfra.utils.ansible_runner

testinfra_hosts = testinfra.utils.ansible_runner.AnsibleRunner(
    os.environ['MOLECULE_INVENTORY_FILE']
).get_hosts('all')


def test_hosts_file(host):
    f = host.file('/etc/hosts')

    assert f.exists
    assert f.user == 'root'
    assert f.group == 'root'


def test_django_service(host):
    onadata = host.service("onadata")
    assert onadata.is_running
    assert onadata.is_enabled

    celeryd_onadata = host.service("celeryd-onadata")
    assert celeryd_onadata.is_running
    assert celeryd_onadata.is_enabled

    celerybeat_onadata = host.service("celerybeat-onadata")
    assert celerybeat_onadata.is_running
    assert celerybeat_onadata.is_enabled

