<?php

namespace MainBundle\Repository;

use Doctrine\ORM\EntityRepository;
use Doctrine\ORM\Query;
use MainBundle\Entity\Album;

/**
 * AlbumRepository
 *
 * This class was generated by the Doctrine ORM. Add your own custom
 * repository methods below.
 */
class AlbumRepository extends EntityRepository
{
    /**
     * @param $minImageCount
     * @return array
     */
    public function getList($minImageCount)
    {
        $em = $this->getEntityManager();
        $dql = $em->createQuery('SELECT a, COUNT(a) as c
              FROM MainBundle:Album a
              JOIN MainBundle:Image i
              WHERE i.album = a.id
              GROUP BY i.album
              HAVING c > :cnt');
        $dql->setParameter('cnt', (int) $minImageCount);

        return $dql->getResult(Query::HYDRATE_ARRAY);
    }

}
