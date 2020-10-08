# Scalingo CLI in a Docker image

Minimal image with Scalingo CLI installed

## Usage

```shell
docker run -v ~/.config/scalingo:/home/user/.config/scalingo michaelbaudino/scalingo-cli <command>
```

See [Scalingo documentation](https://doc.scalingo.com/platform/cli/features) to know what `<command>` can be.

### Sharing host Scalingo configuration

The `-v  ~/.config/scalingo:/home/user/.config/scalingo` part in the usage example above ensures that the Scalingo CLI inside the container uses the configuration stored on the host system  (including the authentication information).

If `/home/user/.config/scalingo` is provided like this (as a Docker volume), any command run in the container will be run as this directory owner (rather than as root) to prevent this directory to be created or assigned to `root` on the host system too (we use `su-exec` for that).
