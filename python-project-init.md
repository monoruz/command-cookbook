# Repo init
## install uv
```
curl -LsSf https://astral.sh/uv/install.sh | sh
```
## install aider
```
uv tool install aider-chat
```
## install ruff
```
uv tool install ruff@latest
```
## install pre-commit
```
uv tool install pre-commit
pre-commit install
cat <<EOF > .pre-commit-config.yaml
repos:
  - repo: https://github.com/astral-sh/ruff-pre-commit
    rev: v0.11.10  # Use the latest stable version
    hooks:
      - id: ruff
        args: [--fix]
        types_or: [python, pyi]
      - id: ruff-format
        types_or: [python, pyi]
EOF
```
