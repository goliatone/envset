# envset

`envset` runs another program with a custom environment according to values defined in a **.envset** config file, which follows the [ini][ini] file format.

Inspired by [daemontools][dtools]' tool [envdir][envdir].

---

## Environment level configuration
Application configuration usually is environment specific and changes between build distributions.

If you follow the 12 factor app guidelines, then you know you should store your configuration in the environment.

By application configuration we mean small and oftentimes sensitive data such as API keys, database credentials. Not all environment configuration is sensitive and are instead build distribution specific values such as the application's TCP port, base URL to build OAuth callbacks, or logging verbosity.

`envset` helps you manage and set environment variables for multiple build distributions.

Is as simple as calling:

```
envset development -- node server.js
```

## Getting Started

Install the module globally with:

```
npm install envset -g
```
This will provide a CLI interface, which can be accessed via terminal:

```
$ envset
```

## Documentation

### Commands
If you type `envset` without arguments it will display help and a list of supported environment names.

### .envset file


### Configuration

Follows `rc` [standards][rcstand].


### Post and pre installation hooks
The `package.json` file includes two installation live cycle scripts:


`postinstall`:

Executed after installation of the module. It creates a default `.envsetrc` config file in the user's home directory.

`postuninstall`:

Executed after uninstalling the module. It removes the `.envsetrc` file created during installation.

## Examples

An **.envset** file could look like this:

```ini
[production]
NODE_AWS_SECRET_ACCESS_KEY=FS40N0QY22p2bpciAh7wuAeHjJURgXIBQ2cGodpJD3FRjw2EyYGjyXpi73Ld8zWO
NODE_AWS_ACCESS_KEY_ID=LSLhv74Q1vH8auQKUt5pFwnix0FUl0Ml
NODE_HONEYBADGER_KEY=LCgZgqsxKfhO
NODE_POSTGRES_ENDPOINT=50.23.54.25
NODE_POSTGRES_DATABASE=myproject
NODE_POSTGRES_PSWD=Pa$sW03d
NODE_POSTGRES_USER=myproject

[development]
NODE_AWS_SECRET_ACCESS_KEY=HN5ITok3lDaA1ASHxtEpy1U9XCjZwThmfgoIYZk8bkOqc5yk6sT7AWd3ooNeRFV9
NODE_AWS_ACCESS_KEY_ID=m35W4PGGVZfj1gOxYvztFxBD5F2605B3
NODE_HONEYBADGER_KEY=f3MNPUhZoki6
NODE_POSTGRES_ENDPOINT=localhost
NODE_POSTGRES_DATABASE=postgres
NODE_POSTGRES_PSWD=postgres
NODE_POSTGRES_USER=postgres
```


To use it, simply prefix the call to your program with `envset` and the name of the environment:

```
$ envset development node app.js
```

You can:

```ini
[local]
MSG=Hello World
```

```
envset local -- env | grep MSG | say
```

## Contributing
In lieu of a formal styleguide, take care to maintain the existing coding style. Add unit tests for any new or changed functionality. Lint and test your code using [Grunt](http://gruntjs.com/).

## Release History
* 2015-11-02: v0.2.0: Initial **npm** release.
* 2015-11-21: v0.3.0: Added '--' to separate command.
* 2015-11-23: v0.4.0: Print `env` if no command provided.

## TODO

* Tests
* Programmatic interface
* Output to stdout so that we can pipe commands

We could change the semantics, from:
```
$ envset development node app.js
```

to:
```
$ envset development -- node app.js
```

## License
Copyright (c) 2015 goliatone  
Licensed under the MIT license.


<!--
const whichPromise = require('which-promise');

//https://github.com/ioquatix/shell-environment/blob/master/lib/index.coffee
ChildProcess.spawn process.env.SHELL, ['-ilc', @command + ">&3"],
-->


[ini]: https://en.wikipedia.org/wiki/INI_file
[dtools]: http://cr.yp.to/daemontools.html
[envdir]: http://cr.yp.to/daemontools/envdir.html
[rcstand]: https://github.com/dominictarr/rc#standards
