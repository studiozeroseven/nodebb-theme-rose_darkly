# Integrating NodeBB Theme with Coolify for Continuous Development

## Overview of Coolify

Coolify is an open-source, self-hostable platform that simplifies the deployment and management of applications. It provides a user-friendly interface for setting up continuous integration and continuous deployment (CI/CD) pipelines, managing environment variables, and configuring automatic deployments. By using Coolify, you can streamline the development process for your NodeBB theme, ensuring that changes are automatically deployed whenever you push updates to your Git repository.

## Prerequisites

*   A working NodeBB installation.
*   A Coolify account and a project set up.
*   A Git repository for the NodeBB theme.

## Configuration Steps

1.  **Add a New Service in Coolify:**

    *   Log in to your Coolify account and navigate to your project.
    *   Click on the "Add Service" button.
    *   Select "Git Repository" as the source type.

2.  **Configure the Source:**

    *   Enter the Git repository URL for your NodeBB theme.
    *   Specify the branch you want to deploy (e.g., `main` or `master`).
    *   Enable automatic deployments by checking the "Automatic Deployments" option.

3.  **Set Environment Variables:**

    *   Add any necessary environment variables for your NodeBB theme. For example, you might need to specify the theme's name using the `NODEBB_THEME_NAME` variable.
    *   In Coolify, navigate to the service settings and click on "Environment Variables".
    *   Add the required variables and their values.

4.  **Configure the Deploy Script:**

    *   Create a deploy script that copies the theme files to the NodeBB installation directory and restarts NodeBB.
    *   In Coolify, navigate to the service settings and click on "Deploy Script".
    *   Enter the following script (adjust the paths as needed):

        ```bash
        #!/bin/bash
        # Stop NodeBB
        ./nodebb stop

        # Copy theme files
        cp -r /app/* /path/to/nodebb/themes/rose_darkly/

        # Start NodeBB
        ./nodebb start
        ```

    *   Make sure to replace `/path/to/nodebb` with the actual path to your NodeBB installation.
    *   Ensure that the deploy script has execute permissions.

5.  **Set the Buildpack:**

    *   If your theme requires specific build steps (e.g., compiling SCSS), you might need to specify a buildpack.
    *   In Coolify, navigate to the service settings and click on "Buildpack".
    *   Select the appropriate buildpack (e.g., "Node.js") or leave it as "None" if no build steps are required.

## Setting Up Automatic Deployments

1.  **Configure Webhooks:**

    *   In your Git repository (e.g., GitHub, GitLab), set up a webhook that triggers a deployment in Coolify whenever changes are pushed to the specified branch.
    *   In Coolify, navigate to the service settings and copy the "Webhook URL".
    *   In your Git repository, add a new webhook and paste the Coolify webhook URL.
    *   Configure the webhook to trigger on "push" events.

2.  **Test the Deployment:**

    *   Make a small change to your theme's code (e.g., update a CSS file) and push it to your Git repository.
    *   Verify that Coolify automatically deploys the changes and that the changes are reflected in your NodeBB installation.

## Relevant Configuration Details

*   **NodeBB Theme Directory:** `/path/to/nodebb/themes/theme-name/`
*   **Example `plugin.json` Configuration:**

    ```json
    {
      "id": "nodebb-theme-rose_darkly",
      "name": "Rose Darkly",
      "description": "A dark theme for NodeBB.",
      "version": "1.0.0",
      "less": [
        "theme.less"
      ],
      "templates": [
        "templates/header.tpl",
        "templates/footer.tpl"
      ]
    }
    ```

## Conclusion

By integrating your NodeBB theme with Coolify, you can automate the deployment process and ensure that changes are quickly and easily deployed to your NodeBB installation. This streamlines the development workflow and allows you to focus on creating a great theme without worrying about manual deployment steps.