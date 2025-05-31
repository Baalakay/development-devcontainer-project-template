# Blake's Template Devcontainer for Modern Python & React Development

**Repository:** [https://github.com/Baalakay/template.git](https://github.com/Baalakay/template.git)

This repository provides a robust, ready-to-use development environment for modern full-stack projects (particularly Generative AI projects) using [Docker](https://www.docker.com/), [devcontainers](https://containers.dev/), and any compatible IDE such as [Cursor](https://www.cursor.so/), [VS Code](https://code.visualstudio.com/), [Windsurf](https://windsurf.ai/), and others. It is designed for developers who want a seamless, reproducible setup for both backend (Python/FastAPI) and frontend (React/Vite) development, with advanced tooling and cloud integration out of the box.

> **Prerequisite:**
> You must have [Docker](https://www.docker.com/products/docker-desktop/) and an IDE such as [Cursor](https://www.cursor.so/), [Windsurf](https://windsurf.ai/), or [VS Code](https://code.visualstudio.com/) installed on your local machine before using this template. 
> - You must also install the [Dev Containers (Remote Development) extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers).
> - Cursor and Windsurf are forks of VSCode and so have built-in support for devcontainers.
> - Please install these tools first if you haven't already.

---

## 🧩 Why Use a Devcontainer? (Benefits & Safe Rebuilds)

- **Safe to Rebuild**: You can safely rebuild the devcontainer at any time (for example, to add new features, update tools, or refresh the environment) without losing your source code. Your code always lives on your local machine and is mounted into the container, so it is never deleted or overwritten by container rebuilds.
- **Purpose of a Development Devcontainer**: A devcontainer provides a fully isolated, reproducible development environment. All packages, libraries, and tools are installed inside the container, not on your host. This prevents pollution or conflicts on your local system, ensures consistent builds across machines, and makes it easy to onboard new team members or move between computers.
- **Key Benefits**:
  - **Reproducible builds**: Everyone gets the same environment, every time.
  - **Isolation**: No more dependency conflicts or "works on my machine" problems.
  - **Clean host system**: Your local OS stays clean—no need to install or update project-specific tools globally.
  - **Easy management**: Update, reset, or extend your environment with a single config change.
  - **Portability**: Move your project between machines or share with teammates with zero setup hassle.

---

## 🛠️ Technology Stack

- **Python 3.12** ([python.org](https://www.python.org/))
- **FastAPI** ([fastapi.tiangolo.com](https://fastapi.tiangolo.com/))
- **React 19** ([react.dev](https://react.dev/))
- **Vite** ([vitejs.dev](https://vitejs.dev/))
- **TypeScript** ([typescriptlang.org](https://www.typescriptlang.org/))
- **Tailwind CSS** ([tailwindcss.com](https://tailwindcss.com/))
- **Node.js 22** ([nodejs.org](https://nodejs.org/))
- **npm 11** ([npmjs.com](https://www.npmjs.com/))
- **[uv](https://github.com/astral-sh/uv)** (Python package manager, replaces pip)
- **Ruff** ([docs.astral.sh/ruff](https://docs.astral.sh/ruff/)) (Python linter)
- **Pre-commit** ([pre-commit.com](https://pre-commit.com/))
- **AWS CLI** ([aws.amazon.com/cli](https://aws.amazon.com/cli/))
- **Oh My Zsh** ([ohmyz.sh](https://ohmyz.sh/)) with custom themes and plugins
- **[bat](https://github.com/sharkdp/bat)**: Modern alternative to `cat` for file viewing (with syntax highlighting, line numbers, and more). The `cat` command is aliased to `bat` for a better experience.
- **[fzf](https://github.com/junegunn/fzf)**: Command-line fuzzy finder for fast file and content search in the shell.
- **VS Code Extensions**: AWS Toolkit, Tailwind CSS IntelliSense, Python Debugger, and more

---

## 📁 Folder Structure

- **`frontend/`**: Contains all frontend code (React, Vite, TypeScript, Tailwind). All dependencies are installed inside a Docker volume at `frontend/node_modules` (not on your host).
- **`src/`**: Contains backend Python code (FastAPI app and related modules).
- **`.cursor/rules/`**: Cursor IDE-specific rules and workflow files, supporting the CursorRIPER framework.
- **`memory-bank/`**: Persistent project memory and documentation, managed by CursorRIPER.

---

## 🗂️ Devcontainer & Git Project Setup

- **Devcontainer Configuration**: All devcontainer and Docker configuration files are located in the `.devcontainer` folder at the project root. This folder defines the environment, features, volumes, and mounts for your project.
- **Git Integration**: Git is enabled at the project root (`/workspace`). You can use all standard git commands to manage your source code.
- **Adding Your Own Remote**: To push your project to GitHub (or another remote), add your own remote URL. For example:
  ```sh
  git remote add origin https://github.com/your-username/your-repo.git
  git push -u origin main
  ```
- **Cloning for New Projects**: You can simply clone this repository into any new project directory or with any new name. It will automatically be recognized as a devcontainer project and set up the environment for you on first open in Cursor or VS Code.

---

## 🧩 Why Use a Devcontainer? (Benefits & Safe Rebuilds)

- **Safe to Rebuild**: You can safely rebuild the devcontainer at any time (for example, to add new features, update tools, or refresh the environment) without losing your source code. Your code always lives on your local machine and is mounted into the container, so it is never deleted or overwritten by container rebuilds.
- **Purpose of a Development Devcontainer**: A devcontainer provides a fully isolated, reproducible development environment. All packages, libraries, and tools are installed inside the container, not on your host. This prevents pollution or conflicts on your local system, ensures consistent builds across machines, and makes it easy to onboard new team members or move between computers.
- **Key Benefits**:
  - **Reproducible builds**: Everyone gets the same environment, every time.
  - **Isolation**: No more dependency conflicts or "works on my machine" problems.
  - **Clean host system**: Your local OS stays clean—no need to install or update project-specific tools globally.
  - **Easy management**: Update, reset, or extend your environment with a single config change.
  - **Portability**: Move your project between machines or share with teammates with zero setup hassle.

---

## 🔑 Environment Variables & API Keys

- **API Key Management**: No API keys or secrets are stored in any devcontainer files (such as `.env`). Instead, all sensitive credentials (like OpenAI, Anthropic, Gemini, AWS, etc.) are read from your local host environment variables, as configured in `devcontainer.json`.
- **How to Set API Keys**: To persist your API keys across reboots, add them to your shell profile on your host machine (e.g., `~/.zshrc` or `~/.zprofile`). For example:
  ```sh
  export OPENAI_API_KEY=sk-...
  export ANTHROPIC_API_KEY=sk-...
  export GEMINI_API_KEY=sk-...
  export AWS_PROFILE=your-aws-profile
  ```
  After editing your profile, run `source ~/.zshrc` (or restart your terminal) to apply the changes. The devcontainer will automatically read these variables from your host when it starts.
- **Security**: This approach keeps your API keys out of version control and out of the devcontainer files, reducing the risk of accidental exposure.

---

## 📝 Personalization: Dotfiles, Stow, and Shell Enhancements

- **Dotfiles Management**: This build uses [GNU Stow](https://www.gnu.org/software/stow/) to manage your dotfiles. Stow allows you to keep your configuration files organized in a single directory (like `.dotfiles`) and symlink them to their appropriate locations. This makes it easy to version-control and sync your shell/editor settings across machines.
- **Default Dotfiles Source**: By default, this build pulls dotfiles from Blake McDonald's personal GitHub repository. To personalize your environment, you should set up your own `.dotfiles` repo on GitHub and update the configuration to use your repo instead. This way, you can maintain and sync your own custom shell, editor, and tool settings.
- **Zsh & Oh My Zsh**: The default shell is Zsh, enhanced with Oh My Zsh, custom themes, and plugins for productivity. Your shell history, themes, and other settings are bind-mounted from your host for seamless experience.
- **bat**: [`bat`](https://github.com/sharkdp/bat) is a modern replacement for `cat`, providing syntax highlighting, line numbers, and more. The `cat` command is aliased to `bat` for improved file viewing.
- **fzf**: [`fzf`](https://github.com/junegunn/fzf) is a powerful command-line fuzzy finder, making it easy to search for files, history, and content directly from the shell.

---

## 🐳 Devcontainer & Docker Details

- **Volumes & Mounts**: Key dependency and cache folders (`.venv`, `frontend/node_modules`, `.mypy_cache`, `.pytest_cache`, `dist/`) are mounted as Docker named volumes. This keeps your local source tree clean—these folders exist only inside the container.
- **Bind Mounts**: Several host files and folders are bind-mounted for convenience and personalization:
  - `~/.gitconfig`, `~/.aws`, `~/.zsh_history`, `~/.oh-my-zsh/themes`, `~/.config/bat`, and a shared `devcontainer_shared` folder.
  - This allows you to sync your dotfiles, AWS credentials, and shell history seamlessly between host and container.
- **User Shell**: Uses Zsh (with Oh My Zsh and plugins) instead of Bash for a modern terminal experience. Dotfiles are managed via [stow](https://www.gnu.org/software/stow/) and can be synced from GitHub.
- **Devcontainer Features**: Most tools (Node, Python, Git, Ruff, pre-commit, AWS CLI, etc.) are installed via [devcontainer features](https://containers.dev/features), ensuring a reproducible and up-to-date environment.

---

## ⚡ Python Dependency Management with UV

- This environment uses [uv](https://github.com/astral-sh/uv) instead of pip for Python package management.
- Dependencies are declared in `pyproject.toml` and locked in `uv.lock` for reproducible builds.
- The `.venv` is created automatically in the container (and is a Docker volume, not on your host).

---

## 🧠 Cursor IDE & CursorRIPER Framework

- This project is designed for use with the [Cursor IDE](https://www.cursor.so/), which supports advanced AI workflows and persistent project memory.
- The `.cursor/rules/` folder and `memory-bank/` directory implement the [CursorRIPER Framework](https://github.com/johnpeterman72/CursorRIPER), which provides:
  - Structured, phase-based development workflow (Research, Innovate, Plan, Execute, Review)
  - Persistent memory bank for project context, requirements, and progress
  - Safe initialization and state management to prevent accidental data loss

---

## ☁️ AWS & Bedrock Integration

- The devcontainer includes the AWS CLI and is ready for [AWS Bedrock](https://aws.amazon.com/bedrock/) integration.
- **To use AWS and Bedrock with Cursor:**
  - Set up your AWS profile and credentials in your host's `~/.aws` directory (bind-mounted into the container).
  - For company-provided Cursor accounts with pre-configured LLM API keys, ensure you create a Cursor profile for your environment.

---

## 📝 Additional Notes

- **Node.js/Frontend dependencies** are installed inside the container only (not on your host), thanks to Docker volumes.
- **Python virtual environment** is managed by uv and also container-only.
- **Linter, formatter, and pre-commit hooks** are pre-installed and ready to use.
- **Zsh shell** is the default, with Oh My Zsh themes and plugins for productivity.
- **Personalization**: You can further customize the environment by editing the bind mounts in `.devcontainer/devcontainer.json` to match your local setup.
- **Viewing Installed Libraries**:
  - **Backend (Python) Libraries:**
    - View declared dependencies in [`pyproject.toml`](./pyproject.toml).
    - To see all installed packages in the devcontainer, run:
      ```sh
      uv pip list
      ```
  - **Frontend (Node/JS) Libraries:**
    - View declared dependencies in [`frontend/package.json`](./frontend/package.json).
    - To see all installed frontend packages, run (from the `frontend` directory):
      ```sh
      npm list --depth=0
      ```

---

## 📚 Further Reading

- [Docker](https://www.docker.com/)
- [Devcontainers](https://containers.dev/)
- [Cursor IDE](https://www.cursor.so/)
- [CursorRIPER Framework](https://github.com/johnpeterman72/CursorRIPER)
- [uv Python package manager](https://github.com/astral-sh/uv)
- [FastAPI](https://fastapi.tiangolo.com/)
- [React](https://react.dev/)
- [Vite](https://vitejs.dev/)
- [Tailwind CSS](https://tailwindcss.com/)
- [AWS Bedrock](https://aws.amazon.com/bedrock/)

---

## 🚀 Quick Start

**1. Download or Clone the Repository**
- Use the following command to clone into a new local folder (e.g., `my-app-1`):
  ```sh
  git clone https://github.com/Baalakay/template.git my-app-1
  ```
- Or download the ZIP and extract it to your desired project directory.

**2. Open the Project in Cursor or VS Code**
- Launch [Cursor IDE](https://www.cursor.so/) or [VS Code](https://code.visualstudio.com/) (or other compatible IDEs).
- Open the project folder you just cloned or extracted.

**3. Rebuild and Open in Devcontainer**
- Press <kbd>Shift</kbd>+<kbd>Ctrl</kbd>+<kbd>P</kbd> (or <kbd>Shift</kbd>+<kbd>Cmd</kbd>+<kbd>P</kbd> on Mac) to open the command palette.
- Type and select **"Dev Containers: Rebuild and Reopen in Container"**.
- This will build the devcontainer, set up all dependencies, and create the necessary Docker volumes and mounts. The first build may take several minutes as it downloads and installs everything.
- Once the container is ready, your development environment is fully set up and isolated from your host system. All further development happens inside the container.

**4. Start the Servers**

- **Start the FastAPI backend server:**
  ```sh
  python -m uvicorn src.fastapi:app --host 0.0.0.0 --port 8000 --reload
  ```

- **Start the Vite/React frontend server:**
  ```sh
  cd frontend && npm run dev -- --host --port=5173
  ```

## 🔌 Open Ports

The devcontainer is configured to forward several ports from the container to your host, making it easy to access development servers and tools:

- **5173**: Vite/React development server (frontend hot-reload and preview)
- **8000**: FastAPI backend server (main Python API)
- **6379**: Redis (if you add a Redis service for caching or message brokering; not enabled by default but reserved for future use)
- **5678**: Python debugger (used for remote debugging sessions, e.g., with VS Code or Cursor)

These ports are defined in the `forwardPorts` array in `.devcontainer/devcontainer.json` and are automatically made available on your host when the devcontainer is running.

---

For any questions or issues, please refer to the documentation above or open an issue in this repository.
