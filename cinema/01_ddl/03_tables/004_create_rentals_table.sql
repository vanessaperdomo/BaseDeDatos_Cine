CREATE TABLE cine.rentals (
    rental_id   uuid        PRIMARY KEY DEFAULT gen_random_uuid(),
    client_id   uuid        NOT NULL,
    movie_id    uuid        NOT NULL,
    room_id     uuid        NOT NULL,
    rental_date date        NOT NULL DEFAULT CURRENT_DATE,
    return_date date,
    status      varchar(20) NOT NULL DEFAULT 'active',
    created_at  timestamptz NOT NULL DEFAULT now(),
    updated_at  timestamptz NOT NULL DEFAULT now(),
    CONSTRAINT fk_rentals_client  FOREIGN KEY (client_id)  REFERENCES cine.clients(client_id)          ON DELETE RESTRICT,
    CONSTRAINT fk_rentals_movie   FOREIGN KEY (movie_id)   REFERENCES cine.movies(movie_id)             ON DELETE RESTRICT,
    CONSTRAINT fk_rentals_room    FOREIGN KEY (room_id)    REFERENCES cine.screening_rooms(room_id)     ON DELETE RESTRICT,
    CONSTRAINT ck_rentals_status  CHECK (status IN ('active', 'returned', 'overdue')),
    CONSTRAINT ck_rentals_dates   CHECK (return_date IS NULL OR return_date >= rental_date)
);