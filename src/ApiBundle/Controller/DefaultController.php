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
use Symfony\Component\BrowserKit\Request;

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
     * @Get("/list", name="list_get_all", defaults={"_format" = "json"})
     * @View
     */
    public function indexAction()
    {
        return [
            ['path' => 'path'],
            ['path' => 'path2'],
            ['path' => 'path3']
        ];
    }
}
