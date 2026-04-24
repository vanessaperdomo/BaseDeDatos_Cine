CREATE TABLE cine.clients (
    client_id     uuid        PRIMARY KEY DEFAULT gen_random_uuid(),
    first_name    varchar(100) NOT NULL,
    last_name     varchar(100) NOT NULL,
    email         varchar(150) NOT NULL,
    phone         varchar(20),
    registered_at date         NOT NULL DEFAULT CURRENT_DATE,
    created_at    timestamptz  NOT NULL DEFAULT now(),
    updated_at    timestamptz  NOT NULL DEFAULT now(),
    CONSTRAINT uq_clients_email UNIQUE (email)
);