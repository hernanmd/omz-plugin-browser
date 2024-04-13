[![license-badge](https://img.shields.io/badge/license-MIT-blue.svg)](https://img.shields.io/badge/license-MIT-blue.svg)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)
[![Project Status: Active – The project has reached a stable, usable state and is being actively developed.](http://www.repostatus.org/badges/latest/active.svg)](http://www.repostatus.org/#active)

# Table of Contents

- [Description](#description)
  - [Features](#features)
- [Installation](#installation)
  - [Baseline String](#baseline-string)
- [Screenshots](#screenshots)
- [Usage](#usage)
- [Implementation notes](#implementation-note)
- [Contribute](#contribute)
  - [Version management](#version-management)
- [License](#license)

# Description

[Oh My Zsh](https://ohmyz.sh/) is a framework for managing a [Zsh](https://en.wikipedia.org/wiki/Z_shell) configuration, it comes bundled with thousands of helpful functions, helpers, plugins, themes. Zsh, short for Z shell, serves as a versatile Unix shell suitable for interactive login sessions and shell scripting tasks. It stands out as an extended Bourne shell boasting numerous enhancements, borrowing features from Bash, ksh, and tcsh. Zsh introduces advanced functionalities like programmable command-line completion, expanded file globbing, refined variable/array handling, and customizable prompts. It is also cross-platform, including support for Microsoft Windows through the [UnxUtils](https://en.wikipedia.org/wiki/UnxUtils) collection. It has earned recognition as the default shell for macOS and Kali Linux.

This Oh-My-Zsh Plugin Manager is a user-friendly graphical tool designed to simplify the management of [Oh-My-Zsh plugins](https://github.com/ohmyzsh/ohmyzsh/wiki/Plugins). It offers a convenient interface to list, enable, and disable plugins with ease. There is a [massive collection of awesome plugins](https://github.com/unixorn/awesome-zsh-plugins) available to try in your own system. With the Oh-My-Zsh Plugin Manager, managing your Zsh plugins becomes effortless, allowing you to tailor your shell environment to your specific needs.

## Features

- View a list of all installed Oh-My-Zsh plugins.
- Check the status of each plugin (enabled or disabled).
- Enable or disable plugins with a simple click.

# Installation

```smalltalk
Metacello new	
		baseline: 'OMZPluginBrowser';	
		repository: 'github://hernanmd/omz-plugin-browser/src';	
		load.
```

## Baseline String 

If you want to add the OMZPluginBrowser to your Metacello Baselines or Configurations, copy and paste the following expression:
```smalltalk
	" ... "
	spec
		baseline: 'OMZPluginBrowser' 
		with: [ spec repository: 'github://hernanmd/omz-plugin-browser/src' ];
	" ... "
```

# Screenshots

![OMZ Plugin Browser 1](https://github.com/hernanmd/omz-plugin-browser/assets/4825959/a8d33a53-0d4d-459a-99ba-f514772e19bf)

![OMZ Plugin Browser_2](https://github.com/hernanmd/omz-plugin-browser/assets/4825959/598b21b5-c878-401d-a0b1-5d6983d5f803)

<img width="727" alt="OMZ Plugin Browser_3" src="https://github.com/hernanmd/omz-plugin-browser/assets/4825959/c0f72c68-f381-4f50-931a-2d6bf85db44d">

# Usage

From the Pharo menu, go to **Library -> OMZ Plugin Browser**

From a Playground:
```smalltalk
OMZSpPluginBrowserApp new run.
```
# Implementation Notes

This package uses the UI library Spec 2, along with the Commander 2 to implement UI menu commands.
Each plugin is represented using `OMZPluginObject` and shell commands are sent from Pharo using the UnifiedFFI LibC helper.

# Contribute

**Working on your first Pull Request?** You can learn how from this *free* series [How to Contribute to an Open Source Project on GitHub](https://egghead.io/series/how-to-contribute-to-an-open-source-project-on-github)

If you have discovered a bug or have a feature suggestion, feel free to create an issue on Github.
If you have any suggestions for how this package could be improved, please get in touch or suggest an improvement using the GitHub issues page.
If you'd like to make some changes yourself, see the following:    

  - Fork this repository to your own GitHub account and then clone it to your local device
  - Do some modifications
  - Test.
  - Add <your GitHub username> to add yourself as author below.
  - Finally, submit a pull request with your changes!
  - This project follows the [all-contributors specification](https://github.com/kentcdodds/all-contributors). Contributions of any kind are welcome!

## Version management 

This project use semantic versioning to define the releases. This means that each stable release of the project will be assigned a version number of the form `vX.Y.Z`. 

- **X** defines the major version number
- **Y** defines the minor version number 
- **Z** defines the patch version number

When a release contains only bug fixes, the patch number increases. When the release contains new features that are backward compatible, the minor version increases. When the release contains breaking changes, the major version increases. 

Thus, it should be safe to depend on a fixed major version and moving minor version of this project.

# License
	
This software is licensed under the MIT License.

Copyright Hernán Morales Durand, 2024.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

# Authors

Hernán Morales Durand
