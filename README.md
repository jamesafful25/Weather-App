# Weather App

A modern, responsive, and interactive weather forecasting web application built with **HTML5, CSS3, and JavaScript**. The application integrates the **OpenWeatherMap API** to retrieve and display real-time weather information, hourly forecasts, and 5-day weather predictions.

Users can search for weather conditions in different cities or use geolocation to retrieve weather information for their current location. The application also supports Celsius and Fahrenheit temperature conversion, light and dark themes, and a dynamic date and time display.

## Live Features

- Search for weather information by city.
- Retrieve weather information using the device's geographical location.
- View current weather conditions and detailed atmospheric information.
- Explore hourly and 5-day weather forecasts.
- Switch between Celsius (°C) and Fahrenheit (°F).
- Toggle between light and dark display themes.
- View dynamically updated date and time information.
- Access a responsive interface across different screen sizes.

## 1. Project Overview

The Weather App was developed to provide users with an accessible and intuitive way to retrieve and monitor weather conditions.

The application consumes weather data from the OpenWeatherMap API and transforms the returned information into a user-friendly interface.

It demonstrates practical frontend development concepts, including:

- JavaScript-based API integration.
- Asynchronous data retrieval.
- JSON response handling.
- Browser geolocation.
- Dynamic DOM manipulation.
- Event handling and user interaction.
- Responsive web design.
- Client-side application state and interface updates.

## 2. Key Features

### Current Weather Information

Displays detailed weather information for a selected city, including:

- Current temperature.
- Feels-like temperature.
- Weather description and conditions.
- Humidity.
- Wind speed.
- Cloud coverage.
- Atmospheric pressure.
- Sunrise and sunset times.

### City Search

Users can enter a city name to retrieve its current weather conditions and forecast information.

### Geolocation Support

The application uses browser geolocation functionality to retrieve the user's current coordinates and obtain weather information for their location.

Location access depends on browser permissions and device location availability.

### Weather Forecasts

Provides forecast information to help users understand expected weather conditions.

- Hourly weather forecast.
- 5-day weather forecast.
- Temperature information.
- Weather conditions and corresponding icons.

### Temperature Unit Conversion

Users can switch between:

- Celsius (°C)
- Fahrenheit (°F)

### Light and Dark Themes

Provides light and dark display modes, allowing users to switch between themes according to their preferences.

### Dynamic Date and Time

Displays a continuously updated date and time within the application.

## 3. Technology Stack

| Technology | Purpose |
|---|---|
| HTML5 | Application structure and content |
| CSS3 | Styling, layouts, and responsive design |
| JavaScript | Application logic and interactive functionality |
| OpenWeatherMap API | Real-time weather data and forecast information |
| Fetch API | HTTP requests and API communication |
| Browser Geolocation API | Retrieval of geographical coordinates |
| JSON | Weather API response data exchange |

## 4. Application Architecture

The application follows a lightweight client-side architecture without requiring a separate backend server.

### Frontend

- **HTML5:** Defines the structure and layout of the application.
- **CSS3:** Controls the visual presentation, themes, and responsive layouts.
- **JavaScript:** Handles application logic, API requests, user interactions, and dynamic content rendering.

### External API Integration

The application communicates with the OpenWeatherMap API to retrieve weather information.

The Fetch API is used to send HTTP requests, receive responses, and process the returned JSON data.

### Geolocation Integration

The browser Geolocation API retrieves the user's geographical coordinates, subject to permission. These coordinates are then used to request location-based weather information.

## 5. Project Structure

```text
Weather-App/
│
├── index.html       # Main application structure
├── style.css        # Application styling and themes
├── script.js        # Application logic and API integration
└── README.md        # Project documentation
```

## 6. Getting Started

Follow these instructions to run the application locally.

### Prerequisites

You will need:

- A modern web browser (Chrome, Firefox, Edge, etc.).
- A code editor such as Visual Studio Code.
- An internet connection.
- An OpenWeatherMap API key.

### Step 1: Clone the Repository

```bash
git clone https://github.com/jamesafful25/Weather-App.git
```

Navigate into the project directory:

```bash
cd Weather-App
```

### Step 2: Obtain an OpenWeatherMap API Key

1. Visit [OpenWeatherMap](https://openweathermap.org/).
2. Create an account or sign in.
3. Obtain an API key from your account.
4. Open `script.js` in your code editor.
5. Locate the API key configuration.

Replace the placeholder with your API key:

```javascript
const apiKey = 'YOUR_API_KEY_HERE';
```

**Important:** Do not commit your actual API key to a public GitHub repository. Because this application runs entirely in the browser, a key embedded in JavaScript is visible to users. Restrict the key through the provider's available controls and consider a backend proxy if stronger key protection is required.

### Step 3: Run the Application

Open `index.html` in your web browser.

Alternatively, use the Visual Studio Code Live Server extension to launch the application locally.

No additional package installation or build process is required.

## 7. How the Application Works

The application follows this general workflow:

1. **User Input:** The user searches for a city or selects the geolocation option.
2. **Location Retrieval:** For geolocation requests, the browser obtains the user's geographical coordinates after permission is granted.
3. **API Request:** JavaScript uses the Fetch API to send a request to OpenWeatherMap.
4. **Data Retrieval:** The API returns weather information in JSON format.
5. **Data Processing:** JavaScript extracts and processes the relevant weather information.
6. **Interface Rendering:** The application dynamically updates the interface with current weather conditions and forecast information.
7. **User Interaction:** Users can switch temperature units and display themes.

## 8. Skills Demonstrated

This project demonstrates practical experience in:

- Frontend Web Development.
- HTML5 and CSS3.
- JavaScript Programming.
- REST API Integration.
- Fetch API and Asynchronous JavaScript.
- JSON Data Processing.
- Browser Geolocation.
- DOM Manipulation.
- Event-Driven Programming.
- Responsive Web Design.
- Interactive User Interface Development.

## 9. Future Improvements

Potential enhancements include:

- Weather alerts and severe weather notifications.
- Search history and saved favourite cities.
- Improved loading indicators and API error handling.
- Extended forecast information.
- Weather maps and visualizations.
- Progressive Web App (PWA) capabilities.
- Backend integration for improved API key protection.

## 10. Author

**James Afful**

Full-Stack Developer | DevOps & Cloud Engineer | AI Automation Engineer | Data Scientist & Analytics | Economist & Financial Analyst

**Professional Links**

- **GitHub:** [github.com/jamesafful25](https://github.com/jamesafful25)
- **Portfolio:** [jamesafful25.github.io/james-afful-portfolio](https://jamesafful25.github.io/james-afful-portfolio/)
- **Email:** [james.afful47@gmail.com](mailto:james.afful47@gmail.com)

---

*Designed and developed by James Afful | 2025*
