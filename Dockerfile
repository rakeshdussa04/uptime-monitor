# 1. Start with a lightweight Linux OS that has Python installed
FROM python:3.9-slim

# 2. Set the working directory inside the container
WORKDIR /app

# 3. Install 'curl' (It's not in the slim version by default)
# We use 'apt-get' because the base image is Debian-based
RUN apt-get update && apt-get install -y curl

# 4. Copy all files from your laptop to the container
COPY . .

# 5. Make sure the script is executable
RUN chmod +x monitor.sh

# 6. Tell Docker: When you start, run this script
CMD ["./monitor.sh"]
