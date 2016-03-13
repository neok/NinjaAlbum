<?php

namespace MainBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;

class DefaultController extends Controller
{
    public function indexAction()
    {
        return $this->render('MainBundle:Default:index.html.twig');
    }

    public function testAction(Request $request)
    {
        $data = $this->container->get('album.service')->getImages(2, $request->get('page'));

        return $this->render('MainBundle:Default:tt.html.twig', array('pagination' => $data));

    }
}
