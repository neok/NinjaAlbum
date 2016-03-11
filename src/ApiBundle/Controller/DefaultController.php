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
       return $this->container->get('album.service')->getAlbumList();

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
        return $this->container->get('album.service')->getOne($request->get('album_id'));
    }
}
