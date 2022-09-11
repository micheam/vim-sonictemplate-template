APP_NAME               = {{_input_:app-name}}
GCP_PROJECT            = {{_input_:gcp-project}}
IMAGE_URL              = gcr.io/$(GCP_PROJECT)/$(APP_NAME):latest

deploy:{{_cursor_}}
	@gcloud run deploy $(APP_NAME) --image=$(IMAGE_URL) --platform managed --max-instances={{_input_:max-instance}}
