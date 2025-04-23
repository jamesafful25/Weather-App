const apiKey = '20c68192f3495c14d4b92c9d0c1c10e3';
const searchBtn = document.getElementById('searchBtn');
const searchInput = document.getElementById('userlocation');
const unitSwitcher = document.getElementById('unitSwitcher');
const geoBtn = document.getElementById('geoBtn');
const lightBtn = document.getElementById('lightBtn');
const darkBtn = document.getElementById('darkBtn');

let currentUnit = unitSwitcher.value;

searchBtn.addEventListener('click', () => {
  const city = searchInput.value.trim();
  if (city) fetchWeather(city);
});

unitSwitcher.addEventListener('change', () => {
  currentUnit = unitSwitcher.value;
  const city = document.querySelector('.location').textContent.split(',')[0];
  if (city && city !== 'Location') fetchWeather(city);
});

geoBtn.addEventListener('click', () => {
  navigator.geolocation.getCurrentPosition(
    pos => fetchWeatherByCoords(pos.coords.latitude, pos.coords.longitude),
    () => alert("Location access denied!")
  );
});

lightBtn.addEventListener('click', () => document.body.classList.remove('dark-mode'));
darkBtn.addEventListener('click', () => document.body.classList.add('dark-mode'));

function fetchWeather(city) {
  fetch(`https://api.openweathermap.org/data/2.5/weather?q=${city}&appid=${apiKey}&units=${currentUnit}`)
    .then(res => res.json())
    .then(data => {
      if (data.cod !== 200) return alert('City not found!');
      updateCurrentWeather(data);
      fetchForecast(data.coord.lat, data.coord.lon);
    });
}

// ## Using async function:
// async function fetchWeather(city) {
//   try {
//     const response = await fetch(`https://api.weatherapi.com/data?q=${city}`);
//     const data = await response.json();
//     console.log(data);
//   } catch (error) {
//     console.error('Error:', error);
//   }
// }


function fetchWeatherByCoords(lat, lon) {
  fetch(`https://api.openweathermap.org/data/2.5/weather?lat=${lat}&lon=${lon}&appid=${apiKey}&units=${currentUnit}`)
    .then(res => res.json())
    .then(data => {
      updateCurrentWeather(data);
      fetchForecast(lat, lon);
    });
}

function updateCurrentWeather(data) {
  document.querySelector('.location').textContent = `${data.name}, ${data.sys.country}`;
  document.querySelector('.temperature').textContent = `${Math.round(data.main.temp)}°${currentUnit === 'metric' ? 'C' : 'F'}`;
  document.querySelector('.feelslike').textContent = `Feels like: ${Math.round(data.main.feels_like)}°${currentUnit === 'metric' ? 'C' : 'F'}`;
  document.querySelector('.description').textContent = data.weather[0].description;
  document.querySelector('.weatherIcon').innerHTML = `<img src="https://openweathermap.org/img/wn/${data.weather[0].icon}@4x.png" />`;
  document.getElementById('HValue').textContent = data.main.humidity + '%';
  document.getElementById('WValue').textContent = data.wind.speed + (currentUnit === 'metric' ? ' km/h' : ' mph');
  document.getElementById('CValue').textContent = data.clouds.all + '%';
  document.getElementById('PValue').textContent = data.main.pressure + ' hPa';
  document.getElementById('SRValue').textContent = new Date(data.sys.sunrise * 1000).toLocaleTimeString();
  document.getElementById('SSValue').textContent = new Date(data.sys.sunset * 1000).toLocaleTimeString();
}

function fetchForecast(lat, lon) {
  fetch(`https://api.openweathermap.org/data/2.5/forecast?lat=${lat}&lon=${lon}&appid=${apiKey}&units=${currentUnit}`)
    .then(res => res.json())
    .then(data => {
      updateWeeklyForecast(data.list);
      updateHourlyForecast(data.list);
    });
}

function updateWeeklyForecast(forecastList) {
  const weeklyDiv = document.getElementById('weeklyForecast');
  weeklyDiv.innerHTML = '';

  const dailyData = {};
  forecastList.forEach(entry => {
    const date = new Date(entry.dt * 1000);
    const dayKey = date.toLocaleDateString('en-US', { weekday: 'short', month: 'short', day: 'numeric' });

    if (!dailyData[dayKey]) {
      dailyData[dayKey] = entry;
    }
  });

  Object.entries(dailyData).slice(0, 5).forEach(([day, entry]) => {
    const card = document.createElement('div');
    card.className = 'forecast-card';
    card.innerHTML = `
      <div class="forecast-date">${day}</div>
      <img src="https://openweathermap.org/img/wn/${entry.weather[0].icon}@2x.png" />
      <div>${Math.round(entry.main.temp)}°${currentUnit === 'metric' ? 'C' : 'F'}</div>
      <div>${entry.weather[0].main}</div>
    `;
    weeklyDiv.appendChild(card);
  });
}

function updateHourlyForecast(forecastList) {
  const hourlyDiv = document.getElementById('hourlyForecast');
  hourlyDiv.innerHTML = '';

  forecastList.slice(0, 8).forEach(entry => {
    const date = new Date(entry.dt * 1000);
    const hour = date.toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' });
    const card = document.createElement('div');
    card.className = 'forecast-card';
    card.innerHTML = `
      <div>${hour}</div>
      <img src="https://openweathermap.org/img/wn/${entry.weather[0].icon}@2x.png" />
      <div>${Math.round(entry.main.temp)}°${currentUnit === 'metric' ? 'C' : 'F'}</div>
      <div>${entry.weather[0].main}</div>
    `;
    hourlyDiv.appendChild(card);
  });
}

function updateDateTime() {
    const now = new Date();
    const options = {
      weekday: 'long',
      year: 'numeric',
      month: 'long',
      day: 'numeric',
      hour: '2-digit',
      minute: '2-digit',
      second: '2-digit',
    };
  
    const dateTimeString = now.toLocaleString('en-US', options);
    document.getElementById('datetime').textContent = dateTimeString;
  }
  
  // Update once on load
  updateDateTime();
  
  // Optional: Keep updating every second
  setInterval(updateDateTime, 1000);
  