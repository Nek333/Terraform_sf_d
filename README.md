Диплом.
1. Необходимо склонировать проект, в папке Terrafort сделать команды terraform init, terraform plan, terraform apply, перед этим проверить колличество ресурсов, которые вам необходимы в главной
файле main.tf в корне.
После того как создасться инфраструктура, необходимо в папке ans создать файл hosts с данными о созданных инстансах, внести данные для подключения (путь к ssh ключу, и ip).
Поочередно установить k8s-dependencies.yml,k8s-control-plane.yml, k8s-workers.yml и jen_inst.yml для установки Jenkins на сервер srv. После выполнения этого плейбука будет выведен пароль, для регистрации Jenkins.
Необходимо будет зайти на srv по порту 8080 и вручную зарегистрировать его с помощью данного пароля, а так же настроить свой логин и пароль.
3. Далее создается пайплайн который делает билд из репозитория https://github.com/Nek333/dip3.git и отправляет его в DockerHub
Вот код который для этого использовался:

pipeline {

    agent any
    environment {
        IMAGE_NAME = 'nek33/myapp'
        IMAGE_TAG = 'latest'
		DOCKER_BUILDKIT=1
    }

    stages {
        stage('Checkout Code') {
            steps {
                git 'https://github.com/Nek333/dip3.git'
            }
        }
        
        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("${env.IMAGE_NAME}:${env.IMAGE_TAG}")
                }
            }
        }
        
        stage('Push Image to DockerHub') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', 'nek33') {
                        docker.image("${env.IMAGE_NAME}:${env.IMAGE_TAG}").push()
                    }
                }
            }
        }
    }
    
    post {
        always {
          
            echo 'Pipeline finished. Check logs and results.'
        }
    }
}

В итоге мы получает доступный контейнер https://hub.docker.com/r/nek33/myapp
3. Далее необходимо зайти в папку helm и скопировать ее на сервер мастера, можно это сделать с помощью git clone. 
В папке helm необходимо установить все файлы yaml находящиеся в корневом каталоге (kubectl apply -f имя_файла.yaml), а так же создать папку /home/ansible/1 для стореджа.
проверить все сервисы и поды, kubectl get pods, kubectl get svc и установить helm install myapp-release ./myapp
приложение будет доступно (http://158.160.29.215/)

4. Для мониторинга на Jenkins настраивается пойплайн для отправки в телеграм бот.

   Если HTTP статус не равен 200, то делаем curl запрос
                        sh 'curl -X POST "https://api.telegram.org/bot6064000089:AAHyUDmuL2lGu_g65xEbfjkyuNgGtNy_7ic/sendMessage?chat_id=-1001894073514&text=HTTP_response_code_is_not_200"'
                    }
                    
   и получаем сообщение в телеграм
   
   ![нотификатонс](https://github.com/Nek333/Terraform_sf_d/assets/125662225/99171e5a-1654-4c6e-a500-cd87c0be1835)

   
Так же для мониторинга доступны следующие сервисы 
Prometheus - http://130.193.43.176:9090/

   ![Мониторинг](https://github.com/Nek333/Terraform_sf_d/assets/125662225/cc87ae0b-29ff-4ab5-890d-ccdfe5456454)

Grafana - http://130.193.43.176:3000/
   




