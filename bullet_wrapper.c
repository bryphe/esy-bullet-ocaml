#include <stdio.h>

#include <caml/mlvalues.h>
#include "btBulletDynamicsCommon.h"

extern "C" {

    CAMLprim value
    bulletCreateDynamicsWorld(value unit)
    {
        btDefaultCollisionConfiguration* collisionConfiguration = new btDefaultCollisionConfiguration();
        btCollisionDispatcher* dispatcher = new btCollisionDispatcher(collisionConfiguration);
        btBroadphaseInterface* overlappingPairCache = new btDbvtBroadphase();
        btSequentialImpulseConstraintSolver* solver = new btSequentialImpulseConstraintSolver;
        btDiscreteDynamicsWorld* dynamicsWorld = new btDiscreteDynamicsWorld(dispatcher, overlappingPairCache, solver, collisionConfiguration);

        dynamicsWorld->setGravity(btVector3(0, -10, 0));

        printf("Created world!\n");

        return (value)dynamicsWorld;
    }

    CAMLprim value
    bulletDestroyDynamicsWorld(value w)
    {
        /* btDiscreteDynamicsWorld* world = (btDiscreteDynamicsWorld*) world; */

        /* for (int i = world->getNumCollisionObjects() - 1; i >= 0; i--) */
        /* { */
        /*     btCollisionObject *obj = world->getCollisionObjectArray()[i]; */
        /*     btRigidBody* body = btRigidBody::upcast(obj); */

        /*     if(body && body->getMotionState()) */
        /*     { */
        /*         delete body->getMotionState(); */
        /*     } */

        /*     world->removeCollisionObject(obj); */
        /*     delete obj; */
        /* } */

        // TODO: Delete collision shapes?

        /* delete world; */

        // TODO:
        // delete solver;
        // delete overlappingPairCache;
        // delete dispatcher;
        // delete collisionConfiguration;

        printf("Destroyed world!");

        return Val_unit;
    }
}
