<?php

namespace ApiBundle\Services;


use MainBundle\Entity\Image;
use MainBundle\Repository\AlbumRepository;

class Album
{
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
        foreach ($repository->findAll() as $album) {

            $result[] = [
                'id' => $album->getId(),
                'name' => $album->getName()
            ];
        }

        return $result;
    }

}