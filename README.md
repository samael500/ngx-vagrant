# ngnx-vagrant
Self-hosted Vagrant boxes with versions by nginx + lua

`GET http://10.1.1.111/hosted/example`

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
                    "url": "http://10.1.1.111/hosted/example/docker-1.0.box",
                    "checksum": "180fba376a2a6616bd20c7bb2e7e46d812cc2c03",
                    "name": "docker",
                    "checksum_type": "sha1"
                },
                {
                    "url": "http://10.1.1.111/hosted/example/virtualbox-1.0.box",
                    "checksum": "62990a09f9480d862d72567f5897c31db022ab2e",
                    "name": "virtualbox",
                    "checksum_type": "sha1"
                }
            ]
        },
        {
            "version": "1.3",
            "providers": [
                {
                    "url": "http://10.1.1.111/hosted/example/docker-1.3.box",
                    "checksum": "012e19688b235ebd06b8af060a0c30bbbe78b762",
                    "name": "docker",
                    "checksum_type": "sha1"
                }
            ]
        },
        {
            "version": "1.4",
            "providers": [
                {
                    "url": "http://10.1.1.111/hosted/example/virtualbox-1.4.box",
                    "checksum": "bcec2e031e9f3f95bbb68eab33d6b1d9f1032bb4",
                    "name": "virtualbox",
                    "checksum_type": "sha1"
                }
            ]
        },
        {
            "version": "1.7",
            "providers": [
                {
                    "url": "http://10.1.1.111/hosted/example/virtualbox-1.7.box",
                    "checksum": "3de1bde2a6d9d7c69230e6476002aa95e64a9c1f",
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

In vagrant file just write:

```Ruby
    config.vm.box = "example"
    config.vm.box_version = "1.7"
    config.vm.box_url = "http://10.1.1.111/hosted/example"
```
