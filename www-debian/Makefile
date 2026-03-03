PROJECT_NAME = sm_www_debian

DOCKER_COMPOSE = DOCKER_BUILDKIT=0 docker-compose -p $(PROJECT_NAME)
DOCKER = docker

.PHONY: all
all: up

.PHONY: up
up:
	@echo "Starting Docker containers..."
	@$(DOCKER_COMPOSE) up -d

.PHONY: down
down:
	@echo "Stopping Docker containers..."
	@$(DOCKER_COMPOSE) down --remove-orphans

.PHONY: clean
clean: down clean-containers clean-images clean-volumes

.PHONY: stop
stop:
	@echo "Stopping Docker containers..."
	@$(DOCKER_COMPOSE) stop

.PHONY: clean-containers
clean-containers:
	@echo "Removing containers..."
	@$(DOCKER_COMPOSE) rm -f

.PHONY: clean-images
clean-images:
	@echo "Removing images for project $(PROJECT_NAME)..."
	@$(DOCKER) images -q --filter "label=com.docker.compose.project=$(PROJECT_NAME)" | xargs -r $(DOCKER) rmi -f

.PHONY: clean-volumes
clean-volumes:
	@echo "Removing volumes..."
	@$(DOCKER_COMPOSE) down -v