<?php

namespace App\Notifications;

use App\Driver;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;

class DriverCreated extends Notification
{
    use Queueable;

    protected $password;
    protected $user;

    /**
     * Create a new notification instance.
     *
     * @return void
     */
    public function __construct($password, $user)
    {
        $this->password = $password;
        $this->user = $user;
    }

    /**
     * Get the notification's delivery channels.
     *
     * @param  mixed  $notifiable
     * @return array
     */
    public function via($notifiable)
    {
        return ['mail'];
    }

    /**
     * Get the mail representation of the notification.
     *
     * @param  mixed  $notifiable
     * @return \Illuminate\Notifications\Messages\MailMessage
     */
    public function toMail($notifiable)
    {
        return (new MailMessage)
            ->subject(__('welcome_driver', ['driver_name' => $this->user->name]))
            ->greeting(__('notifications_hello', ['username' => $this->user->name]))
            ->line(__('notifications_driver_acc_created', ['app_name' => config('app.name')]))
            ->line(__('Here are your login details:'))
            ->line(__('notifications_username', ['email' => $this->user->email]))
            ->line(__('notifications_password', ['password' => $this->password]))
            ->line(__('ask_driver_to_reset_pass'))
            ->action(__('notifications_login'), url(config('app.url') . '/login'))
            ->line(__('Safe travels and happy deliveries!'));
    }

    /**
     * Get the array representation of the notification.
     *
     * @param  mixed  $notifiable
     * @return array
     */
    public function toArray($notifiable)
    {
        return [];
    }
}
