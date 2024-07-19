# TicTacToe App

A real-time multiplayer TicTacToe game built using Flutter for the frontend and Node.js with Express, MongoDB, and Socket.IO for the backend.

## Features

- Real-time multiplayer functionality
- User authentication
- Persistent game state storage
- Responsive UI for both Android and iOS
- Simple and intuitive gameplay

## Technologies Used

### Frontend

- **Flutter**: For building the cross-platform mobile application

### Backend

- **Node.js**: Runtime environment
- **Express**: Web framework for Node.js
- **MongoDB**: NoSQL database for storing game state and user information
- **Socket.IO**: Library for real-time web applications

## Getting Started

### Prerequisites

- [Flutter](https://flutter.dev/docs/get-started/install) installed
- [Node.js](https://nodejs.org/en/download/) installed
- [MongoDB](https://docs.mongodb.com/manual/installation/) installed and running

### Installation

#### Backend

1. Clone the repository:

    ```sh
    git clone https://github.com/yourusername/tictactoe.git
    cd tictactoe/backend
    ```

2. Install dependencies:

    ```sh
    npm install
    ```

3. Create a `.env` file in the `backend` directory and add your MongoDB URI:

    ```env
    MONGO_URI=your_mongodb_uri
    ```

4. Start the server:

    ```sh
    npm start
    ```

#### Frontend

1. Navigate to the `frontend` directory:

    ```sh
    cd ../frontend
    ```

2. Get Flutter dependencies:

    ```sh
    flutter pub get
    ```

3. Run the Flutter app:

    ```sh
    flutter run
    ```

## Usage

1. Open the app on your mobile device or emulator.
2. Register or log in to your account.
3. Start a new game or join an existing game with a friend.
4. Enjoy playing TicTacToe in real-time!

## Project Structure

### Frontend

