# Wallet System

This is a Ruby on Rails application that manages an internal wallet transactional system for various entities like Users, Teams, and Stocks. The system allows for the transfer of funds between these entities while ensuring ACID compliance.

## Prerequisites

- **Ruby version:** `3.0.1`  
- **Rails version:** `6.1.7.8`
- **Database:** SQLite3 (for development and testing)

### System Dependencies

Ensure the following dependencies are installed on your system:
- **Ruby** `3.0.1`
- **Bundler**
- **SQLite3**
- **Node.js** and **Yarn** (for handling JavaScript dependencies)
- **Git** (for version control)

### Configuration

1. Clone the repository:
    ```bash
    git clone https://github.com/meysifk/wallet_system.git
    cd wallet_system
    ```

2. Install the dependencies:
    ```bash
    bundle install
    yarn install
    ```

### Database Setup

1. Create the database and run migrations:
    ```bash
    rails db:create db:migrate
    ```

2. Seed the database with initial data (optional):
    ```bash
    rails db:seed
    ```

### Running the Application

To start the Rails server:
```bash
rails server
```
Visit the app at `http://localhost:3000`.

### How to Run the Test Suite

To run the RSpec test suite:
```bash
bundle exec rspec
```

Ensure all tests pass before deploying or committing new code.

### Services

#### Background Jobs
- You can queue background jobs using ActiveJob. Example jobs can be added to handle periodic tasks like updating stock prices.

#### External APIs
- The app integrates with the **Latest Stock Price API** via the `LatestStockPrice` service located in the `lib/` directory. Make sure to set your API key as an environment variable:
    ```bash
    export RAPIDAPI_KEY=your_api_key
    ```

### Deployment Instructions

1. Precompile assets for production:
    ```bash
    rails assets:precompile
    ```

2. Ensure all environment variables (like `RAPIDAPI_KEY`) are properly configured on the server.

3. Migrate the database on the production server:
    ```bash
    rails db:migrate RAILS_ENV=production
    ```

4. Restart the application server to apply the changes.

### Usage

- **Wallets:** Each entity (User, Team, Stock, etc.) has an associated wallet that tracks their balance.
- **Transactions:** Funds can be transferred between wallets using `credit` and `debit` transactions. The app supports complex validations and adheres to ACID compliance for transaction safety.
- **Stock Prices:** The system can fetch the latest stock prices using the `LatestStockPrice` service and update user portfolios accordingly.

### Authors

- [Meysi Fairus K.](https://github.com/meysifk)
