This is an example repository for [Self-hosting my websites using bootable
containers](https://yorickpeterse.com/articles/self-hosting-my-websites-using-bootable-containers/).

## Requirements

- Podman
- make

## Building

To build an Anaconda installer that uses full disk encryption and automatic
unlocking using a TPM2 device:

```bash
sudo make installer
```

For more details refer to the mentioned article.

## Licence

The code in this repository is licensed under the
[Unlicense](https://unlicense.org/). A copy of this license can be found in the
file "LICENSE".
