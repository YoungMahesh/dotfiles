# stripe: cli through docker, --network host tells cli to look network on host computer instead of inside docker-container
alias stripe='docker run --rm -it --network host stripe/stripe-cli:latest'
