-- name: CreateUser :one
INSERT INTO users(id, created_at, updated_at, name, api_key)
VALUES ($1, $2, $3, $4,
  encode(sha256(random()::text::bytea),'hex')
)
RETURNING *;

-- basically sqlc make the go code for the sql queries, we are making a funtion called createuser and returning one row, in this case everything that we inserted in
