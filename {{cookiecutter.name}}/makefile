# Variables
namespace = website

all: build-{{cookiecutter.name}} push-{{cookiecutter.name}} deploy-{{cookiecutter.name}}
update: build-{{cookiecutter.name}} push-{{cookiecutter.name}} restart-{{cookiecutter.name}}


# Build related
build-{{cookiecutter.name}}:
	docker build -f build/dockerfile -t ghcr.io/{{cookiecutter.github_username}}/{{cookiecutter.name}}:latest ./build/

# Push related
push-{{cookiecutter.name}}:
	docker push ghcr.io/{{cookiecutter.github_username}}/{{cookiecutter.name}}:latest

# Deploy related
deploy-{{cookiecutter.name}}:
	-kubectl create namespace $(namespace)
	helm install {{cookiecutter.name}} ./deploy/ -n $(namespace) --create-namespace

# Restart related
restart-{{cookiecutter.name}}:
	kubectl rollout restart deployment/{{cookiecutter.name}} --namespace $(namespace)

# Uninstall related
uninstall-{{cookiecutter.name}}:
	helm uninstall {{cookiecutter.name}} -n $(namespace)