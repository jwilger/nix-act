# nix-act

This GitHub Action is designed to streamline the setup process for Nix environments in your CI workflows. It performs the following tasks:
- Checks out your repository.
- Installs Nix.
- Connects to a predefined Nix binary cache.
- Enters a specified Nix development environment.

## Usage

To use this action in your GitHub workflows, follow these steps:

### 1. Add the Action to Your Workflow

You can include this action in a job of your GitHub Actions workflow by referencing it with the purplenoodlesoop/nix-act@master syntax. Here is an example on how to use it:

```yaml
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - name: Setup Nix and Environment
        uses: purplenoodlesoop/nix-act@master
        with:
          environment: 'publish'
```

### Inputs

This action supports the following input:

- `environment`: **Required**. The Nix environment to set up. This is typically a flake attribute, such as `publish` in the example above.

### Example Workflow

Below is a complete example of a workflow using the nix-act:

```yaml
name: Build and Deploy
on: [push]

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - name: Setup Nix and Environment
        uses: your-username/nix-setup-and-cache-action@v1
        with:
          environment: 'publish'
      - name: Build site
        run: nix build .#site
      - name: Publish to Cloudflare Pages
        uses: another-action/cloudflare-pages@v1
        with:
          some-param: value
```

## Contributions

Contributions to this GitHub Action are welcome. You can contribute by:
- Reporting issues
- Suggesting new features or improvements
- Submitting pull requests to propose changes

## License

The scripts and documentation in this project are released under the [MIT License](LICENSE).