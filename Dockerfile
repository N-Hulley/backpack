# Use the official Elixir image as a parent image
FROM elixir:latest

# Install Hex package manager
RUN mix local.hex --force && \
    mix local.rebar --force

# Create and set the working directory
WORKDIR /app

# Copy all dependencies files
COPY mix.exs mix.lock ./
COPY config config
COPY lib lib
COPY priv priv

# Install dependencies
RUN mix deps.get

# Copy rest of the application code
COPY . .

# Compile the project
RUN mix do compile

# Expose the application on port 4000
EXPOSE 4000

# The command to run when the container starts
CMD ["mix", "phx.server"]
