<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class ContactFormMail extends Mailable
{
    use Queueable, SerializesModels;

    public $data;

    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct($data)
    {
        $this->data = $data;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {

        // $contact_message->full_name = $request->full_name;
        // $contact_message->restaurant_name = $request->restaurant_name;
        // $contact_message->phone_number = $request->phone_number;
        // $contact_message->subject = $request->subject;
        // $contact_message->message = $request->message;

        $content = "<h1>New contact form submission</h1>";
        $content .= "<div>Full name: {$this->data->full_name}</div>";
        $content .= "<div>Phone number: {$this->data->phone_number}</div>";
        $content .= "<div>Subject: {$this->data->subject}</div>";
        $content .= "<div>Message: {$this->data->message}</div>";

        return $this->html($content)
            ->subject('Contact Form Data');
    }
}
