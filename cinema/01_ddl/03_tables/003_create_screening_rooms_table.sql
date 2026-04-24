CREATE TABLE cine.screening_rooms (
    room_id    uuid        PRIMARY KEY DEFAULT gen_random_uuid(),
    room_name  varchar(100) NOT NULL,
    capacity   smallint     NOT NULL,
    room_type  varchar(20)  NOT NULL DEFAULT 'standard',
    created_at timestamptz  NOT NULL DEFAULT now(),
    updated_at timestamptz  NOT NULL DEFAULT now(),
    CONSTRAINT uq_screening_rooms_name      UNIQUE (room_name),
    CONSTRAINT ck_screening_rooms_capacity  CHECK (capacity > 0),
    CONSTRAINT ck_screening_rooms_type      CHECK (room_type IN ('standard', '3D', 'IMAX', 'VIP'))
);