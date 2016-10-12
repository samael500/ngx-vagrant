ngx-vagrant
===========

Self-hosted Vagrant boxes with versions by [nginx](https://nginx.org/) + [lua](http://www.lua.org/)

### Try it yourself
With vagrant and virtualbox

```
$ git clone git@github.com:Samael500/ngx-vagrant.git
$ cd ngx-vagrant
$ vagrant up
```

### Example result

`GET http://10.1.1.111/example`

Example result:
```json
{
    "description": "Boxes for example proj",
    "name": "example",
    "versions": [
        {
            "version": "1.0",
            "providers": [
                {
                    "url": "http://10.1.1.111/example/docker-1.0.box",
                    "checksum": "65cb550765d251604dcfeedc36ea61f66ce205c4",
                    "name": "docker",
                    "checksum_type": "sha1"
                },
                {
                    "url": "http://10.1.1.111/example/virtualbox-1.0.box",
                    "checksum": "c0a9d5c3d6679cfcc4b1374e3ad42465f3dd596e",
                    "name": "virtualbox",
                    "checksum_type": "sha1"
                }
            ]
        },
        {
            "version": "1.3",
            "providers": [
                {
                    "url": "http://10.1.1.111/example/docker-1.3.box",
                    "checksum": "def7148aa7ded879dbf5944af4785c2b09aba97a",
                    "name": "docker",
                    "checksum_type": "sha1"
                }
            ]
        },
        {
            "version": "1.4",
            "providers": [
                {
                    "url": "http://10.1.1.111/example/virtualbox-1.4.box",
                    "checksum": "63b06d8c065f5c2522c356d4d6ceb718ec3f8198",
                    "name": "virtualbox",
                    "checksum_type": "sha1"
                }
            ]
        },
        {
            "version": "1.7",
            "providers": [
                {
                    "url": "http://10.1.1.111/example/virtualbox-1.7.box",
                    "checksum": "3221c0fd58a4b2430efc5eeaf09cb8eaf877f3a9",
                    "name": "virtualbox",
                    "checksum_type": "sha1"
                }
            ]
        }
    ]
}
```

You vagrant boxes files shuld store in folder with same name as vagrantbox.

And should use name format `<provider>-<version>.box`

### Usage in Vagrantfile

In vagrant file just write:

```Ruby
    config.vm.box = "example"
    config.vm.box_version = "1.7"
    config.vm.box_url = "http://10.1.1.111/example"
```
