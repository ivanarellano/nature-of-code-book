using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[RequireComponent(typeof(MeshFilter))]
public class Mover : MonoBehaviour
{
    [SerializeField] private Camera cam;

    private Vector3 meshExtentsToScreen;
    private Vector3 velocity = new Vector3();
    private Vector3 acceleration = new Vector3(1, 1, 0);

    public float maxSpeed = 10.0f;

    void Start()
    {
        /// http://answers.unity3d.com/questions/1071640/calculate-the-radius-of-a-spherical-game-object.html
        Vector3 meshExtents = GetComponent<MeshFilter>().mesh.bounds.extents;

        meshExtentsToScreen = cam.WorldToScreenPoint(meshExtents) / 4;
    }

    void Update()
    {
        velocity += acceleration * Time.deltaTime;
        velocity = Vector3.ClampMagnitude(velocity, maxSpeed);
        transform.position += velocity * Time.deltaTime;

        CheckBounds();
    }

    private void CheckBounds()
    {
        /// http://answers.unity3d.com/questions/8003/how-can-i-know-if-a-gameobject-is-seen-by-a-partic.html
        Vector3 posToScreen = cam.WorldToScreenPoint(transform.position);

        if (posToScreen.x > cam.pixelWidth + meshExtentsToScreen.x)
        {
            transform.position = cam.ScreenToWorldPoint(new Vector3(0, posToScreen.y, posToScreen.z));
        }
        else if (posToScreen.x < -meshExtentsToScreen.x)
        {
            transform.position = cam.ScreenToWorldPoint(new Vector3(cam.pixelWidth, posToScreen.y, posToScreen.z));
        }

        if (posToScreen.y > cam.pixelHeight + meshExtentsToScreen.y)
        {
            transform.position = cam.ScreenToWorldPoint(new Vector3(posToScreen.x, 0, posToScreen.z));
        }
        else if (posToScreen.y < -meshExtentsToScreen.y)
        {
            transform.position = cam.ScreenToWorldPoint(new Vector3(posToScreen.x, cam.pixelHeight, posToScreen.z));
        }
    }
}
