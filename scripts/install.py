# /// script
# requires-python = ">=3.9"
# dependencies = [
#     "tomli>=2.0.1",
# ]
# ///

import os
import shutil
import sys
import tomli
from pathlib import Path

def get_data_dir():
    """
    Get the data directory based on the user's OS.
    Reference: https://github.com/typst/packages?tab=readme-ov-file#local-packages
    """
    if sys.platform == "win32":
        return Path(os.environ["APPDATA"])
    elif sys.platform == "darwin":
        return Path.home() / "Library/Application Support"
    else:
        # Linux and others
        xdg_data_home = os.environ.get("XDG_DATA_HOME")
        if xdg_data_home:
            return Path(xdg_data_home)
        return Path.home() / ".local/share"

def main():
    # Base directory of the repository (assumed to be parent of scripts/)
    repo_root = Path(__file__).parent.parent
    toml_path = repo_root / "typst.toml"

    if not toml_path.exists():
        print(f"Error: {toml_path} not found.")
        sys.exit(1)

    with open(toml_path, "rb") as f:
        config = tomli.load(f)

    package = config.get("package", {})
    name = package.get("name")
    version = package.get("version")
    
    if not name or not version:
        print("Error: Could not determine package name or version from typst.toml")
        sys.exit(1)

    print(f"Detected package: {name} v{version}")

    # Determine exclude list
    # We always exclude the .git directory and the scripts directory itself
    # typst.toml excludes usually apply to the package bundling, but we can respect them too if we want
    # For now, let's just implement a robust copy that ignores common dev files.
    
    # User requested: "Store a package in {data-dir}/typst/packages/local/mypkg/1.0.0"
    data_dir = get_data_dir()
    target_dir = data_dir / "typst" / "packages" / "local" / name / version

    print(f"Target directory: {target_dir}")

    if target_dir.exists():
        print("Removing existing version...")
        shutil.rmtree(target_dir)
    
    # Get exclusions from typst.toml if present
    excludes = package.get("exclude", [])
    # Add some sensible defaults for local dev that might not be in toml
    hardcoded_excludes = [".git", ".github", ".gitlab", "scripts", ".gemini", ".vscode", ".idea", "node_modules", "*.pdf"]
    
    def ignore_patterns(path, names):
        ignored = set()
        for name in names:
            # Check hardcoded excludes
            if name in hardcoded_excludes:
                ignored.add(name)
                continue
            
            # Check typst.toml excludes (simple exact match or folder match)
            # This is a basic implementation. real globbing might be needed but usually top-level folders checks are enough for templates
            for pattern in excludes:
                clean_pattern = pattern.rstrip('/')
                if name == clean_pattern:
                    ignored.add(name)
        return ignored

    print("Copying files...")
    try:
        shutil.copytree(repo_root, target_dir, ignore=ignore_patterns)
        print(f"Successfully installed {name}:{version} to local packages.")
        print(f"Usage: #import \"@local/{name}:{version}\": *")
        print(f"typst init @local/{name}:{version}")
    except Exception as e:
        print(f"Failed to copy files: {e}")
        sys.exit(1)

if __name__ == "__main__":
    main()
