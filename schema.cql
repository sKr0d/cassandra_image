CREATE KEYSPACE IF NOT EXISTS development WITH REPLICATION = { 'class' : 'SimpleStrategy', 'replication_factor' : 1 } AND DURABLE_WRITES = true;

CREATE TABLE development.tx_events (
    customer_id text,
    year int,
    month int,
    day int,
    hour int,
    transaction_id uuid,
    cassandra_id uuid,
    client_time timestamp,
    customer_name text,
    event_id int,
    internal boolean,
    message text,
    trans_time timestamp,
    PRIMARY KEY ((customer_id, year, month, day, hour), transaction_id, cassandra_id)
) WITH CLUSTERING ORDER BY (transaction_id ASC, cassandra_id ASC);

CREATE TABLE development.tx_private (
    customer_id text,
    year int,
    month int,
    day int,
    transaction_id uuid,
    created_at timestamp,
    pii_expiration timestamp,
    pii_key_id text,
    transaction_text text,
    transaction_text_private text,
    PRIMARY KEY ((customer_id, year, month, day), transaction_id)
) WITH CLUSTERING ORDER BY (transaction_id ASC);

CREATE TABLE development.tx_summary (
    customer_id text,
    year int,
    month int,
    day int,
    transaction_id uuid,
    created_at timestamp,
    pii_expiration timestamp,
    transaction_text text,
    PRIMARY KEY ((customer_id, year, month, day), transaction_id)
) WITH CLUSTERING ORDER BY (transaction_id ASC);

