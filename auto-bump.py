import re

# https://github.com/mislav/bump-homebrew-formula-action

github_packages = [
    'defguard-client',
    'usql'
]

def get_current_version(cask_name):
    with open(f"Casks/{cask_name}.rb", 'r') as fp:
        cask_content = fp.read()

    matched = re.search(r'version "(.*)"', cask_content)
    current_version = matched.group(1)

    return current_version

def get_

for cask in github_packages:
    print(cask, ':', get_current_version(cask))
