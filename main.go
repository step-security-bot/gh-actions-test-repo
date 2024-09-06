package main

import (
	"fmt"
	"net/http"

	"github.com/fsnotify/fsnotify"
	"github.com/labstack/echo"
	"github.com/spf13/viper"
)

func main() {
	readConfig()
	e := echo.New()
	e.GET("/", func(c echo.Context) error {
		return c.String(http.StatusOK, "Hello, World!")
	})
	port := viper.GetString("PORT")
	e.Logger.Fatal(e.Start(fmt.Sprintf(":%s", port)))
}

func readConfig() {
	viper.SetConfigName("app_config")
	viper.SetConfigType("json")
	viper.AddConfigPath(".")
	// Read the configuration file
	if err := viper.ReadInConfig(); err != nil {
		fmt.Printf("Error reading config file: %s\n", err)
	}

	// Watch for changes in the config file
	viper.WatchConfig()
	viper.OnConfigChange(func(e fsnotify.Event) {
		fmt.Println("Config file changed:", e.Name)
	})
}
