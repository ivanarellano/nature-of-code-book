using UnityEngine;

[RequireComponent(typeof(LineRenderer))]
public class Circle : MonoBehaviour
{
    [SerializeField] private float _radius = 3.0f;
    [SerializeField] private float _startAngle = 0.0f;
    [SerializeField] private float _endAngle = 180.0f;
    [SerializeField] private int _circleVertices = 2;

    private LineRenderer _lineRenderer;

    private void Awake()
    {
        _lineRenderer = GetComponent<LineRenderer>();
    }

    private void Update()
    {
        Vector3[] vertices = new Vector3[_circleVertices];

        float theta = Mathf.Deg2Rad * _startAngle;
        float arcLengthStride = (_endAngle - _startAngle) / _circleVertices;

        for (int i = 0; i < vertices.Length; i++)
        {
            float x = _radius * Mathf.Cos(theta);
            float y = _radius * Mathf.Sin(theta);

            vertices[i] = new Vector3(x, y, 0.0f);

            theta += Mathf.Deg2Rad * arcLengthStride;
        }

        _lineRenderer.positionCount = _circleVertices;
        _lineRenderer.SetPositions(vertices);
    }

    private void OnValidate()
    {
        _circleVertices = Mathf.Clamp(_circleVertices, 0, 9999);
    }
}
