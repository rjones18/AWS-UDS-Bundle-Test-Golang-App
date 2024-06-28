#!/bin/bash

# Install UDS Cli, Zarf, K3d, Kubectl and K9s using Homebrew
brew install defenseunicorns/tap/uds
brew tap defenseunicorns/tap && brew install zarf
brew install k3d
brew install kubectl
brew install derailed/k9s/k9s

# Deploy UDS Core
uds deploy k3d-core-demo:0.22.2 --confirm
