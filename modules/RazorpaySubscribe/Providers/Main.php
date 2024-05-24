<?php

namespace Modules\RazorpaySubscribe\Providers;

use Illuminate\Support\Facades\Blade;
use Illuminate\Support\ServiceProvider as Provider;

class Main extends Provider
{
    /**
     * Register the service provider.
     *
     * @return void
     */
    public function register()
    {
        $this->loadConfig();
        $this->loadRoutes();
    }

    /**
     * Boot the application events.
     *
     * @return void
     */
    public function boot()
    {
        $this->publishConfig();
        $this->loadViews();
        $this->loadViewComponents();
        $this->loadTranslations();
        $this->loadMigrations();
    }

    /**
     * Load config.
     *
     * @return void
     */
    protected function loadConfig()
    {
        $this->mergeConfigFrom(
            __DIR__ . '/../Config/config.php', 'razorpay-subscribe'
        );
    }

    /**
     * Publish config.
     *
     * @return void
     */
    protected function publishConfig()
    {
        $this->publishes([
            __DIR__ . '/../Config/config.php' => config_path('razorpay-subscribe.php'),
        ], 'config');
    }

    /**
     * Load views.
     *
     * @return void
     */
    public function loadViews()
    {
        $viewPath = resource_path('views/modules/razorpay-subscribe');

        $sourcePath = __DIR__ . '/../Resources/views';

        $this->publishes([
            $sourcePath => $viewPath
        ],'views');

        $this->loadViewsFrom(array_merge(array_map(function ($path) {
            return $path . '/modules/razorpay-subscribe';
        }, \Config::get('view.paths')), [$sourcePath]), 'razorpay-subscribe');
    }

    /**
     * Load view components.
     *
     * @return void
     */
    public function loadViewComponents()
    {
        Blade::componentNamespace('Modules\RazorpaySubscribe\View\Components', 'razorpay-subscribe');
    }

    /**
     * Load translations.
     *
     * @return void
     */
    public function loadTranslations()
    {
        $langPath = resource_path('lang/modules/razorpay-subscribe');

        if (is_dir($langPath)) {
            $this->loadTranslationsFrom($langPath, 'razorpay-subscribe');
        } else {
            $this->loadTranslationsFrom(__DIR__ . '/../Resources/lang/en', 'razorpay-subscribe');
        }
    }

    /**
     * Load migrations.
     *
     * @return void
     */
    public function loadMigrations()
    {
        $this->loadMigrationsFrom(__DIR__ . '/../Database/Migrations');
    }

    /**
     * Load routes.
     *
     * @return void
     */
    public function loadRoutes()
    {
        if (app()->routesAreCached()) {
            return;
        }

        $routes = [
            'web.php',
            'api.php',
        ];

        foreach ($routes as $route) {
            $this->loadRoutesFrom(__DIR__ . '/../Routes/' . $route);
        }
    }

    /**
     * Get the services provided by the provider.
     *
     * @return array
     */
    public function provides()
    {
        return [];
    }
}
