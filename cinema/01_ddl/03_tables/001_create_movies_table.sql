CREATE TABLE cine.movies (
    movie_id     uuid         PRIMARY KEY DEFAULT gen_random_uuid(),
    title        varchar(200) NOT NULL,
    genre        varchar(100) NOT NULL,
    director     varchar(150) NOT NULL,
    release_year smallint     NOT NULL,
    duration_min smallint     NOT NULL,
    stock        smallint     NOT NULL DEFAULT 1,
    created_at   timestamptz  NOT NULL DEFAULT now(),
    updated_at   timestamptz  NOT NULL DEFAULT now(),
    CONSTRAINT uq_movies_title        UNIQUE (title, release_year),
    CONSTRAINT ck_movies_release_year CHECK (release_year >= 1888),
    CONSTRAINT ck_movies_duration     CHECK (duration_min > 0),
    CONSTRAINT ck_movies_stock        CHECK (stock >= 0)
);