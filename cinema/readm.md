# 🎬 BaseDeDatos_Cine

Proyecto de base de datos para sistema de cine utilizando **PostgreSQL**, **Docker Compose** y **Liquibase** para la administración de migraciones.

---

## 📌 Tecnologías utilizadas

* PostgreSQL 17
* Docker / Docker Compose
* Liquibase
* YAML
* SQL

---

## 📁 Estructura del proyecto

```text
BaseDeDatos_Cine/
│── docker-compose.yml
│── .env
│── changelog-master.yaml
│── liquibase.properties
│
├── 01_ddl/
│   ├── 01_schemas/
│   └── 03_tables/
│
├── 02_dml/
│
└── 03_rollbacks/
```

---

## ⚙️ Configuración

Archivo `.env`

```env
POSTGRES_DB=cine_db
POSTGRES_USER=cine_user
POSTGRES_PASSWORD=cine_password
POSTGRES_PORT=5433
```

---

## 🚀 Cómo ejecutar el proyecto

Ubicarse en la carpeta raíz del proyecto y ejecutar:

```bash
docker compose up --build
```

Esto realizará automáticamente:

1. Creación del contenedor PostgreSQL
2. Creación de la base de datos `cine_db`
3. Ejecución de migraciones con Liquibase
4. Creación de schema, tablas e inserción de datos iniciales

---

## 🛑 Detener contenedores

```bash
docker compose down
```

---

## 🧹 Reiniciar proyecto desde cero

```bash
docker compose down -v
docker compose up --build
```

> El comando `-v` elimina también el volumen de datos.

---

## 🔌 Conexión a la base de datos

Puede conectarse desde herramientas como pgAdmin o DBeaver con los siguientes datos:

```text
Host: localhost
Puerto: 5433
Base de datos: cine_db
Usuario: cine_user
Contraseña: cine_password
```

---

## 🗃️ Tablas creadas

Dentro del schema `cine`:

* movies
* clients
* screening_rooms
* rentals

---

## 🔄 Rollbacks

Cada `changeSet` cuenta con rollback configurado mediante Liquibase.

---

## 👨‍💻 Autor

Jhoan Camilo Penagos
Aprendiz SENA

---

## 📌 Notas

* Liquibase se ejecuta automáticamente al iniciar Docker Compose.
* Si las migraciones ya fueron aplicadas, Liquibase no las repite.
* PostgreSQL queda disponible en el puerto **5433**.
