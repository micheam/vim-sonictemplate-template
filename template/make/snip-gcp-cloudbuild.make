APP_NAME               = {{_input_:app-name}}
GCP_PROJECT            = {{_input_:gcp-project}}
IMAGE_URL              = gcr.io/$(GCP_PROJECT)/$(APP_NAME):latest

build: Dockerfile{{_cursor_}}
	@gcloud builds submit --tag $(IMAGE_URL)

