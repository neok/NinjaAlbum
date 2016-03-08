<?php

namespace ApiBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use FOS\RestBundle\Controller\Annotations\Delete;
use FOS\RestBundle\Controller\Annotations\Get;
use FOS\RestBundle\Controller\Annotations\Post;
use FOS\RestBundle\Controller\Annotations\Put;
use FOS\RestBundle\Controller\Annotations\View;
use Nelmio\ApiDocBundle\Annotation\ApiDoc;
use Symfony\Component\HttpFoundation\Request;

class DefaultController extends Controller
{
    /**
     * @ApiDoc(
     *     description="Get all data",
     *
     *     statusCodes={
     *         200="When successful"
     *     }
     * )
     * @Get("/albums", name="list_get_all", defaults={"_format" = "json"})
     * @View
     */
    public function indexAction()
    {
        $f = fopen('/tmp/test.txt', 'a+');
        fwrite($f, 'test' . "\n");
        fclose($f);
        return [
            ['path' => 'path'],
            ['path' => 'path2'],
            ['path' => 'path3']
        ];
    }

    /**
     * @ApiDoc(
     *     description="Gets a album",
     *     statusCodes={
     *         200="When successful"
     *     }
     * )
     * @Get("/album/{id}", name="album_id",
     *     requirements={"id" = "\d+"}, defaults={"_format" = "json"}
     * )
     * @View
     */
    public function getAlbumAction(Request $request)
    {
        return [
            [
                'path' => 'ORLY'
            ]
        ];
    }
}