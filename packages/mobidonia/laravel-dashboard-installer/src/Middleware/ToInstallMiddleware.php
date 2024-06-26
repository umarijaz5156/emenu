<?php

namespace dacoto\LaravelInstaller\Middleware;

use Closure;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;

class ToInstallMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  Request  $request
     * @param  Closure  $next
     * @return RedirectResponse|mixed
     */
    public function handle(Request $request, Closure $next)
    {
        if (!$this->alreadyInstalled() && explode('/', $request->route() ? $request->route()->uri() : '')[0] !== 'install') {
            return redirect()->route('LaravelInstaller::install.index');
        }
        return $next($request);
    }

    /**
     * If application is already installed.
     *
     * @return bool
     */
    public function alreadyInstalled(): bool
    {
        return file_exists(storage_path('installed'));
    }
}
