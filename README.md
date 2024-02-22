# Web-App-DevOps-Project

Welcome to the Web App DevOps Project repo! The purpose of this repo is to showcase the development of an Azure End-to-End DevOps Pipeline to build and manage a Python Flask application. The application allows efficient management and tracking of orders for a business. It provides an intuitive user interface for viewing existing orders and adding new ones.

## Disclaimer 
Needless to say, the processes and technologies used here are overkill for the simplicity of the application and does not represent a typical implementation in industry. Nonetheless, it serves as a learning exercise for the use of the toolsets involved.
 
## Table of Contents

- [Features](#features)
- [Getting Started](#getting-started)
- [Technology Stack](#technology-stack)
- [Contributors](#contributors)
- [License](#license)

## Features

- **Order List:** View a comprehensive list of orders including details like date UUID, user ID, card number, store code, product code, product quantity, order date, and shipping date.
  
![Screenshot 2023-08-31 at 15 48 48](https://github.com/maya-a-iuga/Web-App-DevOps-Project/assets/104773240/3a3bae88-9224-4755-bf62-567beb7bf692)

- **Pagination:** Easily navigate through multiple pages of orders using the built-in pagination feature.
  
![Screenshot 2023-08-31 at 15 49 08](https://github.com/maya-a-iuga/Web-App-DevOps-Project/assets/104773240/d92a045d-b568-4695-b2b9-986874b4ed5a)

- **Add New Order:** Fill out a user-friendly form to add new orders to the system with necessary information.
  
![Screenshot 2023-08-31 at 15 49 26](https://github.com/maya-a-iuga/Web-App-DevOps-Project/assets/104773240/83236d79-6212-4fc3-afa3-3cee88354b1a)

- **Data Validation:** Ensure data accuracy and completeness with required fields, date restrictions, and card number validation.

## Getting Started

### Prerequisites

The preferred method for running this application is via Docker. The benefit of using Docker is the application can be deployed in different environments without the risk of dependency or OS issues. The only prerequisite to running the application on a new instance is the installation of Docker.

### Usage

The simplest way to deploy this application is by pulling dpwn the image from DockerHub using this command: `docker pull sameem97/flask-track-orders:latest`. Alternatively you can build the image using the Dockerfile (see Containerisation Process and Build below). In either case, you will then need to run the image (see Deploy below) which creates a new instance of a container hosting the application.

### Containerisation Process

The containerisation process starts with the Dockerfile. It can be thought of as a recipe for building the Docker image and handles the installation of Python packages (see requirements.txt) and system dependencies, configuration of environment variables and exposing network ports. The image, like a standardised shipping container, contains everything required to run the application.

### Build

- To build the docker image from the Dockerfile, run this command in the root of the working directory: `docker build -t <image_name> .` where `<image_name>` is the name you would like to give the new image.

### Deploy

- To run the docker image on your instance, run this command: `docker run -p 5000:5000 <image_name>` where `-p 5000:5000` is a port mapping between the host machine port 5000 to the container port 5000 as exposed in the Dockerfile and `<image_name>` is the name of the docker image as provided in the build stage. Please note, the optional `-d` flag can be added to run the application in detached mode. Otherwise `ctrl+c` will stop the container.

### Access
To access the application, go to localhost port 5000: `http://127.0.0.1:5000`. Here you will be meet with the following two pages:

1. **Order List Page:** Navigate to the "Order List" page to view all existing orders. Use the pagination controls to navigate between pages.

2. **Add New Order Page:** Click on the "Add New Order" tab to access the order form. Complete all required fields and ensure that your entries meet the specified criteria.

## Technology Stack

- **Backend:** Flask is used to build the backend of the application, handling routing, data processing, and interactions with the database.

- **Frontend:** The user interface is designed using HTML, CSS, and JavaScript to ensure a smooth and intuitive user experience.

- **Database:** The application employs an Azure SQL Database as its database system to store order-related data.

- **Containerisation:** Docker is used as the containerisation platform. The image is available for access in DockerHub under sameem97/flask-track-orders.
  
## Contributors 

- [Maya Iuga]([https://github.com/yourusername](https://github.com/maya-a-iuga))

## License

This project is licensed under the MIT License. For more details, refer to the [LICENSE](LICENSE) file.
