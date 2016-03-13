<?php

namespace ApiBundle\Controller;

use JMS\Serializer\SerializationContext;
use Knp\Bundle\PaginatorBundle\KnpPaginatorBundle;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use FOS\RestBundle\Controller\Annotations\Delete;
use FOS\RestBundle\Controller\Annotations\Get;
use FOS\RestBundle\Controller\Annotations\Post;
use FOS\RestBundle\Controller\Annotations\Put;
use FOS\RestBundle\Controller\Annotations\View;
use Nelmio\ApiDocBundle\Annotation\ApiDoc;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;

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
        $data = $this->container->get('album.service')->getImages($request->get('id'), $request->get('page'));
        $serializer = $this->get('jms_serializer');
        return new Response(
            $serializer->serialize(
                $data,
                'json',
                SerializationContext::create()->setGroups(['Default'])
            ) ,
            Response::HTTP_OK,
            [
                'Content-Type' => 'application/json',
            ]
        );

    }
}
