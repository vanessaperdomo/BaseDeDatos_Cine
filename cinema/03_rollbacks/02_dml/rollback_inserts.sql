-- ============================================================
-- Rollback: eliminar datos iniciales (DML)
-- ============================================================
-- Orden importante por claves foráneas:
-- rentals → clients → movies → screening_rooms
-- ============================================================

DELETE FROM cine.rentals;
DELETE FROM cine.clients;
DELETE FROM cine.movies;
DELETE FROM cine.screening_rooms;