PROTO_DIR=proto
GEN_DIR=gen/go

.PHONY: all gen clean

all: gen

gen:
	protoc -I $(PROTO_DIR) \
	$(PROTO_DIR)/sso/sso.proto \
	--go_out=$(GEN_DIR) \
	--go_opt=paths=source_relative \
	--go-grpc_out=$(GEN_DIR) \
	--go-grpc_opt=paths=source_relative

clean:
	rm -rf $(GEN_DIR)/*