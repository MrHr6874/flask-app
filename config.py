import os

DB_USER = os.getenv("DB_USER", "postgres")
DB_PASSWORD = os.getenv("DB_PASSWORD", "Your-password")  # default, can be overridden by env variable
DB_HOST = os.getenv("DB_HOST", "flask-postgres-db.<random-string>.ap-south-1.rds.amazonaws.com")  # Replace with actual RDS endpoint
DB_PORT = os.getenv("DB_PORT", "5432")
DB_NAME = os.getenv("DB_NAME", "demo_db")

SQLALCHEMY_DATABASE_URI = f"postgresql://{DB_USER}:{DB_PASSWORD}@{DB_HOST}:{DB_PORT}/{DB_NAME}"
SQLALCHEMY_TRACK_MODIFICATIONS = False  # Optional, to disable Flask-SQLAlchemy modification tracking
