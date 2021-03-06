APP_NAME=User-Vault
APP_VERSION=1.0
APP_DIR=${APP_NAME}-${APP_VERSION}
BACKUP_DIR=~/dev/backup
BACKUP_FILE=$(BACKUP_DIR)/$(APP_NAME).$(APP_VERSION).backup.`date '+%Y%m%d.%H%M%S'`.tar.gz
GIT_USER=greenpau

all:
	@echo "Running full deployment ..."
	@make build

build:
	@echo "Running build locally ..."
	@tar cvzf ${APP_NAME}-${APP_VERSION}.tar.gz ${APP_NAME}

clean:
	@echo "Running cleanup ... it is empty function"

run:
	@${APP_NAME} -h

backup:
	@echo "Backup ..."
	@mkdir -p ${BACKUP_DIR}
	tar -cvzf $(BACKUP_FILE) --exclude='*/.git*' --transform 's/^./${APP_NAME}-${APP_VERSION}/' .
	@echo "Completed! Run \"tar -ztvf $(BACKUP_FILE)\" to verify ..."

git:
	@echo "Running git commit ..."
	@git add -A && git commit -am  "improvements"

github:
	@echo "Running github commit ..."
	@git remote set-url origin git@github.com:${GIT_USER}/${APP_NAME}.git
	@git push origin master
