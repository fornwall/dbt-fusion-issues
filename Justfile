image := "dbt-fusion-test"

run-terminal: build
	docker run -it {{image}}

run-core: build
	docker run -q --rm --entrypoint /bin/bash {{image}} -c "/opt/venv/bin/dbt deps && /opt/venv/bin/dbt build"

run-fusion: build
	docker run -q --rm --entrypoint /bin/bash {{image}} -c "/root/.local/bin/dbt deps && /root/.local/bin/dbt build"

build:
	docker build -q -t {{image}} .

