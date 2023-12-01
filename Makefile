PROTO_FILES = $(shell find ./schema -name "*.proto" -type f)

.PHONY: protoc
protoc:
	rm -rf ./proto_generated/*
	mkdir ./proto_generated/openapi
	protoc -I . --openapiv2_out proto_generated/openapi --openapiv2_opt logtostderr=true \
	--openapiv2_opt disable_default_errors=true \
	--openapiv2_opt allow_merge=true \
	--openapiv2_opt output_format=yaml \
	--openapiv2_opt merge_file_name="api_definition.yml" $(PROTO_FILES) \
	--openapiv2_opt allow_delete_body=true

fmt:
	find ./schema/ -name "*.proto" | xargs clang-format -i