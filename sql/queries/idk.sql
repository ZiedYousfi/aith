-- name: GetUserById :one
SELECT * FROM user WHERE uuid = $1;
