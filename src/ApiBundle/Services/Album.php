<?php

namespace ApiBundle\Services;


use Doctrine\ORM\EntityManager;
use MainBundle\Repository\AlbumRepository;
use Knp\Component\Pager\Paginator;

class Album
{

    const ITEMS_PER_PAGE = 10;
    const MIN_ALBUM_IMAGE = 10;

    protected $docrine;
    protected $paginator;

    public function __construct(EntityManager $docrine,
                                Paginator $paginator)
    {
        $this->docrine = $docrine;
        $this->paginator = $paginator;
    }

    /**
     * @return \Doctrine\Bundle\DoctrineBundle\Registry
     */
    public function getDoctrine()
    {
        return $this->docrine;
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
     * @return Paginator
     */
    public function getPaginator()
    {
        return $this->paginator;
    }

//    /**
//     * @return \Symfony\Component\DependencyInjection\Container
//     */
//    public function getContainer()
//    {
//        return $this->container;
//    }

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

        /**
         * @var \MainBundle\Repository\ImageRepository $repository
         */
        $repository = $this->getRepository('MainBundle:Image');

        $query = $repository->getImagesByAlbumIdDQL((int)$id);
        /**
         * @var Paginator $paginator
         */
        $paginator = $this->getPaginator();

        return
            $paginator->paginate(
                $query,
                $page,
                self::ITEMS_PER_PAGE
            );

    }

}