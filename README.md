/CurrencyConverterApp
├── app/                 # Din main-app som kör ServiceLoader
├── converter-usd/       # En modul som implementerar SPI (t.ex. USD)
├── converter-eur/       # En till implementation (t.ex. EUR)
├── spi-api/             # Här ligger interfacet + annotation
├── pom.xml              # Root pom
└── docker-compose.yml   # För att köra allt
