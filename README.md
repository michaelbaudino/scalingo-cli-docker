# Scalingo CLI in a Docker image

Minimal image with Scalingo CLI installed

## Usage

```shell
docker run -v ~/.config/scalingo:/root/.config/scalingo michaelbaudino/scalingo-cli <command>
```

See [Scalingo documentation](https://doc.scalingo.com/platform/cli/features) to know what `<command>` can be.

> ℹ️ The `-v  ~/.config/scalingo:/root/.config/scalingo` part will ensure the Scalingo CLI inside the container uses the configuration stored on the host system  (including the authentication information).
