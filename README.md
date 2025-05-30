# Blake's Template Devcontainer for Modern Python & React Development

This repository provides a robust, ready-to-use development environment for modern full-stack projects using [Docker](https://www.docker.com/), [devcontainers](https://containers.dev/), and the [Cursor IDE](https://www.cursor.so/). It is designed for developers who want a seamless, reproducible setup for both backend (Python/FastAPI) and frontend (React/Vite) development, with advanced tooling and cloud integration out of the box.

---

## 🚀 Quick Start

**Start the FastAPI backend server:**
```sh
python -m uvicorn src.fastapi:app --host 0.0.0.0 --port 8000 --reload
```

**Start the Vite/React frontend server:**
```sh
cd frontend && npm run dev -- --host --port=5173
```

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
- **VS Code Extensions**: AWS Toolkit, Tailwind CSS IntelliSense, Python Debugger, and more

---

## 📁 Folder Structure

- **`frontend/`**: Contains all frontend code (React, Vite, TypeScript, Tailwind). All dependencies are installed inside a Docker volume at `frontend/node_modules` (not on your host).
- **`src/`**: Contains backend Python code (FastAPI app and related modules).
- **`.cursor/rules/`**: Cursor IDE-specific rules and workflow files, supporting the CursorRIPER framework.
- **`memory-bank/`**: Persistent project memory and documentation, managed by CursorRIPER.

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

For any questions or issues, please refer to the documentation above or open an issue in this repository.
