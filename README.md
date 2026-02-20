# dbt fusion warning on local package dependencies
This is a small project to show a dbt fusion warning when using a local dbt package which depends on another local dbt package.

Description of when the [Dockerfile](Dockerfile) builds:
- `/opt/dbt-utils-1.3.3/` contains the `dbt-utils` package.
- `/opt/my-package/` contains the [my-package](my-package) package, which [depends on](my-package/packages.yml) `local: /opt/dbt-utils-1.3.3`.
- `/opt/my-project/` contains the [my-project](my-project) project, which [depends on](my-project/packages.yml) `local: /opt/my-package`.

Using [just](https://just.systems/) to run the [Justfile](Justfile) commands, it can be seen that:

- `just run-core` (see github [workflow run](https://github.com/fornwall/dbt-fusion-issues/actions/runs/22220818612/job/64275526025)) runs without warnings about packages.
- `just run-fusion` (see github [workflow run](https://github.com/fornwall/dbt-fusion-issues/actions/runs/22220818612/job/64275526039)) logs the following warning, which AFAIK is a dbt fusion bug:
  - `warning: dbt1005: Package dependency '../../../dbt-utils-1.3.3' not found in package-lock.yml. Skipping. Run 'fs deps --upgrade' with a packages.yml to resolve all dependencies.`
 
