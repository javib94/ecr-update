sleep 5
if curl -Is http://localhost:80/ | head -n 1 | grep -q 'HTTP/1.1 200 OK'; then
  echo "PASSED"
  exit 0
else
  echo "FAILED"
  exit 1
fi
