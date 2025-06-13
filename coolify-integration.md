# Integrating NodeBB Theme with Coolify using Git Repository

## Overview

This guide outlines how to integrate your NodeBB theme with Coolify by directly referencing the theme's Git repository in your NodeBB application's `docker-compose.yml` file. This approach ensures that the latest version of your theme from the `main` branch is always used during the build/deploy process.

## Prerequisites

*   A working NodeBB installation managed by Docker and Docker Compose.
*   A Coolify account and project set up, connected to your NodeBB application.
*   A Git repository for the NodeBB theme.

## Configuration Steps

1.  **Modify the NodeBB `docker-compose.yml` file:**

    *   Edit your NodeBB application's `docker-compose.yml` file to include the theme repository as a volume. This allows the theme files to be directly accessible within the NodeBB container.

    ```yaml
    version: "3.7"
    services:
      nodebb:
        image: nodebb/nodebb
        # ... other configurations ...
        volumes:
          - ./data:/data
          - ./themes/nodebb-theme-rose_darkly:/app/node_modules/nodebb-theme-rose_darkly # Mount the theme
    ```

    *   In this example:
        *   `./themes/nodebb-theme-rose_darkly` is a local directory (relative to the `docker-compose.yml` file) where you will clone the theme repository.
        *   `/app/node_modules/nodebb-theme-rose_darkly` is the directory inside the NodeBB container where NodeBB expects to find the theme.
    *   Before running `docker-compose up`, you need to clone the theme repository into the specified local directory:

    ```bash
    mkdir -p themes
    cd themes
    git clone <theme-git-repository-url> nodebb-theme-rose_darkly
    ```

2.  **Configure Coolify to use the modified `docker-compose.yml` file:**

    *   In Coolify, navigate to your NodeBB application's service settings.
    *   Specify that Coolify should use your existing `docker-compose.yml` file instead of generating a new one.  This is typically done in the "Source" or "Deployment Settings" section of the service configuration.
    *   Ensure that Coolify has access to the `docker-compose.yml` file in your repository.

3.  **Set Environment Variables (if necessary):**

    *   If your theme requires specific environment variables, define them in Coolify's service settings.  For example, you might need to specify the theme's name:

    ```
    NODEBB_THEME=nodebb-theme-rose_darkly
    ```

4.  **Configure the Build/Deploy Process:**

    *   Coolify will use the `docker-compose.yml` file to build and deploy your NodeBB application.  Since the theme is included as a volume, any changes to the theme in the Git repository will be reflected in the deployed application after a rebuild.
    *   You may need to configure a build script in Coolify to run `docker-compose up -d --build` to ensure that the changes are applied.

## Relevant Configuration Details

*   **NodeBB Theme Directory (inside container):** `/app/node_modules/`
*   **Example `docker-compose.yml` Snippet:**

    ```yaml
    version: "3.7"
    services:
      nodebb:
        image: nodebb/nodebb
        # ... other configurations ...
        volumes:
          - ./data:/data
          - ./themes/nodebb-theme-rose_darkly:/app/node_modules/nodebb-theme-rose_darkly
    ```

## Conclusion

By integrating your NodeBB theme with Coolify using this method, you ensure that your NodeBB application always uses the latest version of the theme directly from your Git repository. This simplifies the deployment process and makes it easier to manage theme updates.