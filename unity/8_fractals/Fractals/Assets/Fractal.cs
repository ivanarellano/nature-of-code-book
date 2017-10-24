using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Fractal : MonoBehaviour
{
    [SerializeField]
    private Transform _origin;

    [SerializeField]
    private int _depth = 1;

    [SerializeField]
    private float _length = 1.0f;

    private Color _lineColor = Color.red;

    private void Start ()
    {
        DrawHTree(_origin.position, _depth, _length);
	}
	
    private void DrawLine(Vector3 p1, Vector3 p2)
    {
        Debug.DrawLine(p1, p2, _lineColor, 900);
    }

    private void DrawHTree(Vector3 center, int depth, float length)
    {
        if (depth <= 0)
        {
            return;
        }

        float newLength = length / 2.0f; //Mathf.Sqrt(2.0f);

        _lineColor = new Color(Random.Range(0, 1.0f), Random.Range(0, 1.0f), Random.Range(0, 1.0f));

        /// This section could be turned into only four points
        /// (four Vector3) to reduce the overlap when creating 
        /// dedicated line structures
        Vector3 centerStart = new Vector3(center.x - newLength, center.y);
        Vector3 centerEnd   = new Vector3(center.x + newLength, center.y);

        Vector3 leftStart   = new Vector3(center.x - newLength, center.y - newLength);
        Vector3 leftEnd     = new Vector3(center.x - newLength, center.y + newLength);

        Vector3 rightStart  = new Vector3(center.x + newLength, center.y - newLength);
        Vector3 rightEnd    = new Vector3(center.x + newLength, center.y + newLength);

        DrawLine(centerStart, centerEnd);
        DrawLine(leftStart, leftEnd);
        DrawLine(rightStart, rightEnd);

        int newDepth = depth - 1;
        DrawHTree(leftStart, newDepth, newLength);  // TL
        DrawHTree(leftEnd, newDepth, newLength);    // BL
        DrawHTree(rightStart, newDepth, newLength); // TR
        DrawHTree(rightEnd, newDepth, newLength);   // BR
    }
}
