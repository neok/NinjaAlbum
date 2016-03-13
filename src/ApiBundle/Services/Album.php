<?php

namespace ApiBundle\Services;


use JMS\Serializer\SerializationContext;
use MainBundle\Entity\Image;
use MainBundle\Repository\AlbumRepository;
use MainBundle\Repository\ImageRepository;
use Knp\Component\Pager\Paginator;

class Album
{

    const ITEMS_PER_PAGE = 10;
    const MIN_ALBUM_IMAGE = 10;

    protected $container;

    public function __construct(\Symfony\Component\DependencyInjection\Container $container)
    {
        $this->container = $container;
    }

    /**
     * @return \Doctrine\Bundle\DoctrineBundle\Registry
     */
    public function getDoctrine()
    {
        return $this->getContainer()->get('doctrine');
    }

    /**
     * @param string $name
     * @return \Doctrine\Common\Persistence\ObjectRepository
     */
    public function getRepository($name)
    {
        return $this->getDoctrine()->getRepository($name);
    }

    /**
     * @return \Symfony\Component\DependencyInjection\Container
     */
    public function getContainer()
    {
        return $this->container;
    }

    /**
     * @return array
     */
    public function getAlbumList()
    {
        $result = [];
        /**
         * @var AlbumRepository $repository
         */
        $repository = $this->getRepository('MainBundle:Album');

        /**
         * @var \MainBundle\Entity\Album $album
         */
        foreach ($repository->getList(self::MIN_ALBUM_IMAGE) as $albums) {

            foreach ($albums as $album)

                if (is_array($album)
                    && array_key_exists('id', $album)
                    && array_key_exists('name', $album)
                ) {
                    $result[] = [
                        'id' => $album['id'],
                        'name' => $album['name']
                    ];
                }


        }

        return $result;
    }

    /**
     * Get Images by albumId with pagination
     *
     * @param int $id
     * @param int $page
     * @return mixed
     */
    public function getImages($id, $page = 1)
    {

        $serializer = $this->getContainer()->get('jms_serializer');

        /**
         * @var \MainBundle\Repository\ImageRepository $repository
         */
        $repository = $this->getRepository('MainBundle:Image');

        $query = $repository->getImagesByAlbumIdDQL((int)$id);
        /**
         * @var Paginator $paginator
         */
        $paginator = $this->getContainer()->get('knp_paginator');

        return
            $paginator->paginate(
                $query,
                $page,
                self::ITEMS_PER_PAGE
            );

    }

}