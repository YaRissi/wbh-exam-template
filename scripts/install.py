# /// script
# requires-python = ">=3.11"
# ///

import os
import shutil
import sys
import tomllib
from pathlib import Path

REPO_ROOT = Path(__file__).resolve().parent.parent
ALWAYS_EXCLUDED = {
    ".git",
    ".github",
    ".gitlab",
    ".gitlab-ci.yml",
    ".claude",
    ".vscode",
    ".idea",
    "scripts",
}


def data_dir() -> Path:
    # https://github.com/typst/packages#local-packages
    if sys.platform == "win32":
        return Path(os.environ["APPDATA"])
    if sys.platform == "darwin":
        return Path.home() / "Library/Application Support"
    return Path(os.environ.get("XDG_DATA_HOME", Path.home() / ".local/share"))


def main() -> None:
    package = tomllib.loads((REPO_ROOT / "typst.toml").read_text("utf-8"))["package"]
    name, version = package["name"], package["version"]
    excluded = ALWAYS_EXCLUDED | {p.rstrip("/") for p in package.get("exclude", [])}

    target = data_dir() / "typst" / "packages" / "local" / name / version
    if target.exists():
        shutil.rmtree(target)

    def ignore(_dir: str, names: list[str]) -> set[str]:
        return {n for n in names if n in excluded or n.endswith(".pdf")}

    shutil.copytree(REPO_ROOT, target, ignore=ignore)

    package_import = f"@local/{name}:{version}"
    for typ_file in (target / "template").rglob("*.typ"):
        content = typ_file.read_text("utf-8")
        rewritten = content.replace("../../src/lib.typ", package_import).replace(
            "../src/lib.typ", package_import
        )
        if rewritten != content:
            typ_file.write_text(rewritten, "utf-8")

    print(f"Installed {package_import} to {target}")
    print(f"Create a project with: typst init {package_import} my-assignment")


if __name__ == "__main__":
    main()
