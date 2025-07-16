checkport() {
  if [ -z "$1" ]; then
    echo "Usage: checkport <port_number>"
    return 1
  fi

  PORT=$1
  if sudo lsof -i :$PORT >/dev/null 2>&1; then
    echo "Port $PORT is open."
  else
    echo "Port $PORT is closed or not actively listening."
    echo "Checking for processes using this port:"
    sudo lsof -i :$PORT -P -n
  fi
}

cenv() {
  # Print environment variables sorted alphabetically, with color (cyan for name, green for value)
  env | sort | awk -F= '
    $1 == "PATH" {
      printf "\033[1;36m%s\033[0m=\n", $1
      n = split($2, arr, ":")
      for (i = 1; i <= n; i++) {
        printf "  \033[1;32m%s\033[0m\n", arr[i]
      }
      next
    }
    {
      printf "\033[1;36m%s\033[0m=\033[1;32m%s\033[0m\n", $1, $2
    }'
}

