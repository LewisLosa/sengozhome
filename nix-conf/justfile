default:
    just --list

deploy machine='':
    @if [ -z "{{ machine }}" ]; then \
      nixos-rebuild switch --sudo --flake .; \
    else \
      nixos-rebuild switch --sudo --flake ".#{{ machine }}"; \
    fi

format:
    nix fmt .

lint:
    statix check .

rebuild:
    nixos-rebuild switch --flake .

update:
    nix flake update

