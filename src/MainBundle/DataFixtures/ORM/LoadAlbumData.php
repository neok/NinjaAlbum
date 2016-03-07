<?php

namespace MainBundle\DataFixtures\ORM;

use Doctrine\Common\DataFixtures\FixtureInterface;
use Doctrine\Common\Persistence\ObjectManager;
use MainBundle\Entity\Album;
use MainBundle\Entity\Image;
use Symfony\Component\DependencyInjection\ContainerAwareInterface;
use Symfony\Component\DependencyInjection\ContainerInterface;

class LoadAlbumData implements FixtureInterface, ContainerAwareInterface
{
    /** @var ContainerInterface */
    private $container;

    public function load(ObjectManager $manager)
    {

        for ($i = 0; $i < 5; $i++) {
            $maxImgCount = $i === 0 ? 5 : 20;
            $album = new Album();
            $album->setName('Test' . $i);
            $manager->persist($album);
            for ($j = 0; $j < $maxImgCount; $j++) {
                $img = new Image();
                $img->setPath('index.jpg');
                $img->setAlbum($album);
                $manager->persist($img);
            }
        }

        $manager->flush();
    }

    public function setContainer(ContainerInterface $container = null)
    {
        $this->container = $container;
    }
}