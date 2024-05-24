<?php

namespace App\Http\Controllers;

use App\Restorant;
use Illuminate\Http\Request;
use SimpleSoftwareIO\QrCode\Facades\QrCode;
use File;
use ZipArchive;

class QRController extends Controller
{
    public function index()
    {
        $domain = config('app.url');
        $linkToTheMenu = $domain . '/' . config('settings.url_route') . '/' . auth()->user()->restorant->subdomain;

        if (strlen(auth()->user()->restorant->getConfig('domain')) > 3) {
            $linkToTheMenu = "https://" . explode(' ', auth()->user()->restorant->getConfig('domain'))[0];
        } else if (config('settings.wildcard_domain_ready')) {
            $linkToTheMenu = (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] ? 'https://' : 'http://') . auth()->user()->restorant->subdomain . '.' . str_replace('www.', '', $_SERVER['HTTP_HOST']);
        }
        $qr = "?qr=1";
        $url = $linkToTheMenu . $qr;

        $qrCode1 = $this->qrCodeOne($url);
        $qrCode2 = $this->qrCodeTwo($url);
        $qrCode3 = $this->qrCodeThree($url);
        $qrCode4 = $this->qrCodeFour($url);
        $qrCode5 = $this->qrCodeFive($url);

        $dataToPass = [
            'url' => $url,
            'qr_1' => $qrCode1,
            'qr_2' => $qrCode2,
            'qr_3' => $qrCode3,
            'qr_4' => $qrCode4,
            'qr_5' => $qrCode5,
        ];

        // dd(public_path(auth()->user()->restorant->logowide));

        return view('qrsaas.qrgenNew')->with('data', $dataToPass);
    }

    public function qrColour(Request $request)
    {
        if ($request->qrIndex == 1) {
            $qrCode = $this->qrCodeOne($request->qrUrl,$request->colour);
        }elseif ($request->qrIndex == 2) {
            $qrCode = $this->qrCodeTwo($request->qrUrl,$request->colour);
        }elseif ($request->qrIndex == 3) {
            $qrCode = $this->qrCodeThree($request->qrUrl,$request->colour);
        }elseif ($request->qrIndex == 4) {
            $qrCode = $this->qrCodeFour($request->qrUrl,$request->colour);
        }elseif ($request->qrIndex == 5) {
            $qrCode = $this->qrCodeFive($request->qrUrl,$request->colour);
        }

        return response()->json(['qrCode' => $qrCode]);
    }

    public function qrCodeOne($url, $color='')
    {
        if ($color != '') {
            $color = explode(',', $color);
            $code = base64_encode(QrCode::format('png')
                                    ->size(250)
                                    ->color($color[0], $color[1], $color[2])
                                    ->generate($url)
                                );
        }else{
            $code = base64_encode(QrCode::format('png')
                                    ->size(250)
                                    ->generate($url)
                                );
        }

        return 'data:image/png; base64, '.$code;
    }

    public function qrCodeTwo($url, $color='')
    {
        if ($color != '') {
            $color = explode(',', $color);
            $code = base64_encode(QrCode::format('png')
                                    ->size(250)
                                    ->eyeColor(1, 94, 132, 209, 94, 132, 209)
                                    ->style('square')
                                    ->eye('circle')
                                    ->color($color[0], $color[1], $color[2])
                                    ->generate($url)
                                );
        }else{
            $code = base64_encode(QrCode::format('png')
                                    ->size(250)
                                    ->eyeColor(1, 94, 132, 209, 94, 132, 209)
                                    ->style('square')
                                    ->eye('circle')
                                    ->color(210, 116, 254)
                                    ->generate($url)
                                );
        }

        return 'data:image/png; base64, '.$code;
    }

    public function qrCodeThree($url, $color='')
    {
        if ($color != '') {
            $color = explode(',', $color);
            $code = base64_encode(QrCode::format('png')
                                        ->size(250)
                                        ->color($color[0], $color[1], $color[2])
                                        ->generate($url)
                                    );
        }else{
            $code = base64_encode(QrCode::format('png')
                                        ->size(250)
                                        ->color(237, 166, 181)
                                        ->generate($url)
                                    );
        }

        return 'data:image/png; base64, '.$code;
    }

    public function qrCodeFour($url, $color='')
    {
        if ($color != '') {
            $color = explode(',', $color);
            $code = base64_encode(QrCode::format('png')
                                            ->size(250)
                                            ->style('dot')
                                            ->eye('circle')
                                            ->eyeColor(0, 13, 95, 167, 13, 95, 167)
                                            ->eyeColor(1, 13, 95, 167, 13, 95, 167)
                                            ->eyeColor(2, 13, 95, 167, 13, 95, 167)
                                            ->color($color[0], $color[1], $color[2])
                                            ->generate($url)
                                        );
        }else{

            $code = base64_encode(QrCode::format('png')
                                            ->size(250)
                                            ->style('dot')
                                            ->eye('circle')
                                            ->eyeColor(0, 13, 95, 167, 13, 95, 167)
                                            ->eyeColor(1, 13, 95, 167, 13, 95, 167)
                                            ->eyeColor(2, 13, 95, 167, 13, 95, 167)
                                            ->color(51, 159, 255)
                                            ->generate($url)
                                        );
        }

        return 'data:image/png; base64, '.$code;
    }

    public function qrCodeFive($url, $color='')
    {
        if (!empty(auth()->user()->restorant->logowide)) {
            if ($color != '') {
                $color = explode(',', $color);
                $code = base64_encode(QrCode::format('png')
                                            ->size(250)
                                            ->merge(public_path(auth()->user()->restorant->logowide), 0.4, true)
                                            ->errorCorrection('H')
                                            ->color($color[0], $color[1], $color[2])
                                            ->generate($url)
                                        );
            }else{
                $code = base64_encode(QrCode::format('png')
                                            ->size(250)
                                            ->merge(public_path(auth()->user()->restorant->logowide), 0.4, true)
                                            ->errorCorrection('H')
                                            ->generate($url)
                                        );
            }
        }else{
            if ($color != '') {
                $code = $this->qrCodeOne($request->qrUrl,$request->colour);
            }else{
                $code = $this->qrCodeOne($request->qrUrl);
            }
        }

        return 'data:image/png; base64, '.$code;
    }

    public function documentation()
    {
        return view('qrsaas.documentation');
    }

    public function become_an_affiliate()
    {
        return view('qrsaas.become_an_affiliate');
    }

    public function zipCreate(Request $request)
    {
        // $zip = new ZipArchive;
    
        // $fileName = 'myNewFile.zip';

        // $qrPath = storage_path('app/public/qrs/'.time().'-qr.png');
        // QrCode::format('png')->size(250)->generate(request()->url, $qrPath);

        // $qrPath2 = $this->templateOne();
        // $qrPath3 = $this->templateTwo();

        // if ($zip->open(public_path($fileName), ZipArchive::CREATE) === TRUE)
        // {   
        //     $relativeNameInZipFile = basename($qrPath2);
        //     $zip->addFile($qrPath2, $relativeNameInZipFile);

        //     $relativeNameInZipFile = basename($qrPath3);
        //     $zip->addFile($qrPath3, $relativeNameInZipFile);

        //     $relativeNameInZipFile = basename($qrPath);
        //     $zip->addFile($qrPath, $relativeNameInZipFile);
               
        //     $zip->close();
        // }
      
        // return response()->download(public_path($fileName))->deleteFileAfterSend(true);

        $qrPath3 = $this->templateOne();
        return response()->download($qrPath3);
    }

    /**
     * Write code on Method
     *
     * @return response()
     */
    private function templateOne()
    {
        $temlateImageOne = storage_path('app/public/qrs/'.time().'-template-1.png');
        $qrImagePath = storage_path('app/public/qrs/'.time().'-qr-1.png');
        QrCode::format('png')->size(780)->generate(request()->url, $qrImagePath);

        // Load the main image
        $mainImage = imagecreatefrompng(public_path('qrImagesDefault/scan-menu-blank.png'));

        // Load the image you want to add
        $overlayImage = imagecreatefrompng($qrImagePath);

        // Get the dimensions of the overlay image
        $overlayWidth = imagesx($overlayImage);
        $overlayHeight = imagesy($overlayImage);

        // Get the dimensions of the main image
        $mainWidth = imagesx($mainImage);
        $mainHeight = imagesy($mainImage);

        // Set the position where you want to place the overlay image on the main image
        $positionX = 250; // Adjust as needed
        $positionY = 280; // Adjust as needed

        // Copy the overlay image onto the main image
        imagecopy($mainImage, $overlayImage, $positionX, $positionY, 0, 0, $overlayWidth, $overlayHeight);

        // Save the final image
        $outputFilename = $temlateImageOne;
        imagejpeg($mainImage, $outputFilename, 200);

        // Clean up resources
        imagedestroy($mainImage);
        imagedestroy($overlayImage);

        return $temlateImageOne;
    }

    /**
     * Write code on Method
     *
     * @return response()
     */
    private function templateTwo()
    {
        $temlateImageTwo = storage_path('app/public/qrs/'.time().'-template-2.png');
        $qrImagePath = storage_path('app/public/qrs/'.time().'-qr-2.png');
        QrCode::format('png')->size(500)->generate(request()->url, $qrImagePath);

        // Load the main image
        $mainImage = imagecreatefrompng(public_path('qrImagesDefault/menu-blank.png'));

        // Load the image you want to add
        $overlayImage = imagecreatefrompng($qrImagePath);

        // Get the dimensions of the overlay image
        $overlayWidth = imagesx($overlayImage);
        $overlayHeight = imagesy($overlayImage);

        // Get the dimensions of the main image
        $mainWidth = imagesx($mainImage);
        $mainHeight = imagesy($mainImage);

        // Set the position where you want to place the overlay image on the main image
        $positionX = 580; // Adjust as needed
        $positionY = 915; // Adjust as needed

        // Copy the overlay image onto the main image
        imagecopy($mainImage, $overlayImage, $positionX, $positionY, 0, 0, $overlayWidth, $overlayHeight);

        // Save the final image
        $outputFilename = $temlateImageTwo;
        imagejpeg($mainImage, $outputFilename, 200);

        // Clean up resources
        imagedestroy($mainImage);
        imagedestroy($overlayImage);

        return $temlateImageTwo;
    }
}
